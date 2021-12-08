//
//  -=Network Insider=-
//
// MIT License
//
// Copyright (c) 2021-present Vladimir Kazantsev
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in all
// copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
// SOFTWARE.

import Foundation

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
final class Request: Identifiable, ObservableObject {

	let id: UUID = UUID()

	let url: URL

	struct Request {
		let method: String
		let headers: Dictionary<String, String>
		let date: Date
		let body: Data?
	}

	struct Response {
		let code: Int
		let headers: [ String : String ]
	}

	struct Result {
		let duration: TimeInterval
		let body: Data?
	}



	let request: Request
	@Published private(set) var response: Response?
	@Published private(set) var result: Result?
	@Published private(set) var error: Error?
	@Published var counter: Int = 0


	init?( with request: URLRequest ) {
		guard let url = request.url else { return nil }

		self.url = url
		self.request = Request(
			method: request.httpMethod ?? "UNKNOWN",
			headers: request.allHTTPHeaderFields ?? [:],
			date: Date(),
			body: request.httpBody ?? request.httpBodyStream?.data
		)
	}

	func registerResponse( _ response: URLResponse ) {
		guard let response = response as? HTTPURLResponse else { return }
		let responseData = Response(
			code: response.statusCode,
			headers: response.allHeaderFields.convertToStringDictionary()
		)
		DispatchQueue.main.async {
			self.response = responseData
		}
	}

	func registerFailure( _ error: Error ) {
		self.error = error
	}

	func registerResult( with data: Data? ) {
		DispatchQueue.main.async {
			self.result = Result(
				duration: -self.request.date.timeIntervalSinceNow,
				body: data
			)
		}
	}
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Request {

	var bodyJSON: String? {
		convertBodyToString( from: request.body )
	}

	var responseJSON: String? {
		convertBodyToString( from: result?.body )
	}

	private func convertBodyToString( from data: Data? ) -> String? {

		guard let data = data else { return nil }

		/// First trying to decode JSON...
		if let jsonObject = try? JSONSerialization.jsonObject( with: data, options: [] ),
		   let prettyJSONData = try? JSONSerialization.data( withJSONObject: jsonObject,
															 options: [ .prettyPrinted, .withoutEscapingSlashes ]),
		   let prettyJSONString = String( data: prettyJSONData, encoding: .utf8 ) {

			return prettyJSONString
		}
		/// ... then `String` ...
		else if let string = String( data: data, encoding: .utf8 ) {
			return string
		}
		/// ... falling back to `describing:`.
		else {
			return String( describing: data )
		}
	}
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Request {

	var curl: String {
		let requestHeaderPairs: [ String ] = request.headers.map { "\( $0.key ): \( $0.value )"  }

		var curlBody: String?
		if let bodyData = request.body,
		   let bodyString = String( data: bodyData, encoding: .utf8 ) {
			curlBody = "-d '\( bodyString )'"
		}

		let curlElements: [[String?]] = [
			[
				"curl -v -X \( request.method )"
			],
			requestHeaderPairs.map { "-H \"\( $0 )\"" },
			[
				curlBody,
				"'\( url.absoluteString )'"
			],
		]

		return curlElements
			.flatMap { $0 }
			.compactMap { $0 }
			.joined( separator: " \\\n" )
	}

	var export: String {

		let dateFormatter = DateFormatter()
		dateFormatter.dateStyle = .full
		dateFormatter.timeStyle = .long

		let exportItems: [ String ] = Array<String> {

			"***** Overview *****"
			"\( request.method ) \( url.absoluteString )"

			"Date \( dateFormatter.string( from: request.date ))"

			if let responseCode = response?.code {
				"Status code \( responseCode )"
			}
			if let duration = result?.duration {
				"Duration \( duration.string )"
			}
			""

			"***** Request Headers *****"
			request.headers.map { "\( $0.key ) \( $0.value )" }
			""

			if let body = bodyJSON {
				"***** Request Body *****"
				body
				""
			}

			if let response = response {
				"***** Response Headers *****"
				response.headers.map { "\( $0.key ) \( $0.value )" }
				""
			}

			if let body = responseJSON {
				"***** Response Body *****"
				body
				""
			}

			"------------------------------------------------------------------------"
			"------------------------------------------------------------------------"
			"------------------------------------------------------------------------"
		}

		return exportItems.joined( separator: "\r\n" )
	}
}

private extension Array {

	init( @ArrayBuilder _ builder: () -> [ Element ] ) {
		self.init( builder() )
	}

	@resultBuilder
	struct ArrayBuilder {

		public static func buildExpression( _ expression: Element ) -> [ Element ] {
			[ expression ]
		}
		public static func buildExpression( _ expression: [Element] ) -> [ Element ] {
			expression
		}
		public static func buildBlock( _ children: [Element]... ) -> [ Element ] {
			return children.flatMap { $0 }
		}

		public static func buildOptional( _ component: [Element]? ) -> [ Element ] {
			component ?? []
		}

		public static func buildEither( first component: [Element] ) -> [ Element ] {
			component
		}
		public static func buildEither( second component: [Element] ) -> [ Element ] {
			component
		}

		public static func buildArray( _ components: [Element] ) -> [ Element ] {
			components
		}
	}
}

extension InputStream {

	var data: Data {
		var result = Data()
		let bufferSize = 4096
		var buffer: [ UInt8 ] = [ UInt8 ]( repeating: 0, count: bufferSize )

		open(); defer { close() }

		while true {
			let bytesRead = read( &buffer, maxLength: bufferSize )
			guard bytesRead > 0 else { break }
			result.append( buffer, count: bytesRead )
		}

		return result
	}
}
