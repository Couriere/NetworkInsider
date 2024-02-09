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
import Combine
import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
final class RequestsStorage: ObservableObject {

	static let shared = RequestsStorage()

	@Published private(set) var requests: [ Request ] = []

	func insert( _ request: Request ) {
		if Thread.current.isMainThread {
			self.requests.replace( request, orInsertAt: 0 )
		} else {
			DispatchQueue.main.sync {
				self.requests.replace( request, orInsertAt: 0 )
			}
		}
	}

	func clear() {
		if Thread.current.isMainThread {
			self.requests.removeAll()
		} else {
			DispatchQueue.main.sync {
				self.requests.removeAll()
			}
		}
	}

	private init() {}
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
private extension Array where Element: Identifiable {
	mutating func replace( _ element: Element, orInsertAt index: Int ) {
		guard let existingIndex = self.firstIndex( where: { $0.id == element.id } ) else {
			insert( element, at: index )
			return
		}
		self[ existingIndex ] = element
	}

	mutating func replaceOrAppend( _ element: Element ) {
		guard let existingIndex = self.firstIndex( where: { $0.id == element.id } ) else {
			append( element )
			return
		}
		self[ existingIndex ] = element
	}
}

extension Dictionary where Key == AnyHashable, Value: Any {

	func convertToStringDictionary() -> [ String : String ] {
		guard let dictionary = self as? [ String : Any ] else { return [:] }

		return Dictionary<String, String>(
			dictionary.flatMap( urlQueryItemsFrom ),
			uniquingKeysWith: { $1 }
		)
	}

	private func urlQueryItemsFrom( key: String, value: Any ) -> [(String, String)] {

		switch value {

		case let dictionary as [ String: Any ]:
			return dictionary.flatMap { nestedKey, value in
				urlQueryItemsFrom( key: "\( key )[\( nestedKey )]", value: value )
			}

		case let array as [ Any ]:
			if array.isEmpty {
				return [( key+"[]", value: "" )]
			}
			return array.enumerated().flatMap {
				urlQueryItemsFrom( key: "\( key )[]", value: $0.element )
			}

		case let set as Set<AnyHashable>:
			if set.isEmpty {
				return [( key+"[0]", value: "" )]
			}
			return set.enumerated().flatMap {
				urlQueryItemsFrom( key: "\( key )[\( $0.offset )]", value: $0.element )
			}

		default:
			return [( key, "\( value )" )]
		}
	}
}


#if DEBUG
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
func createRequest(
	url: String,
	response: HTTPURLResponse? = nil,
	error: Error? = nil,
	data: Data? = nil
) -> Request {

	var urlRequest = URLRequest( url: URL( string: url )! )
	urlRequest.httpMethod = Bool.random() ? "POST" : "GET"
	urlRequest.addValue("application/json", forHTTPHeaderField: "Content-Type")
	urlRequest.addValue("application/json", forHTTPHeaderField: "Accept")
	urlRequest.httpBody = try? JSONSerialization.data(withJSONObject: [ "hello": "world" ], options: [])

	let request = Request( with: urlRequest )!

	if let response = response {
		request.registerResponse( response )
	}
	if let error = error {
		request.registerFailure( error )
	}
	if let data = data {
		request.registerResult( with: data )
	}
	return request
}
#endif
