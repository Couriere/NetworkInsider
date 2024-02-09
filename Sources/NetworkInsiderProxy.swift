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
final class NetworkInsiderProxy: URLProtocol {

	private lazy var urlSession = URLSession( configuration: .default, delegate: self, delegateQueue: nil )
	private var dataTask: URLSessionDataTask?
	private static let requestHandledKey = "NetworkInsiderProxy_Handled"

	private var currentRequest: Request!
	private var downloadedData = Data()

	override class func canInit( with request: URLRequest ) -> Bool {
		return !shouldIgnoreRequest( request )
	}

	override class func canInit(with task: URLSessionTask) -> Bool {
		guard let request = task.currentRequest else { return false }
		return canInit( with: request )
	}

	override class func canonicalRequest( for request: URLRequest ) -> URLRequest {
		return request
	}

	override func startLoading() {
		let mutable = ( request as NSURLRequest ).mutableCopy() as! NSMutableURLRequest
		URLProtocol.setProperty( true, forKey: NetworkInsiderProxy.requestHandledKey, in: mutable )
		let handledRequest = mutable as URLRequest

		currentRequest = Request( with: handledRequest )
		RequestsStorage.shared.insert( currentRequest )
		dataTask = urlSession.dataTask( with: handledRequest )
		dataTask?.resume()
	}

	override func stopLoading() {
		currentRequest.registerResult( with: downloadedData.isEmpty ? nil : downloadedData )
		self.urlSession.invalidateAndCancel()
	}

	private static func shouldIgnoreRequest( _ request: URLRequest ) -> Bool {
		let handledKey = NetworkInsiderProxy.requestHandledKey

		guard
			Configuration._isEnabled,
			let host = request.url?.host,
			Configuration._ignoredHosts.allSatisfy({ !host.contains( $0 ) }),
			URLProtocol.property( forKey: handledKey, in: request ) == nil
		else { return true }

		return false
	}
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension NetworkInsiderProxy: URLSessionDataDelegate {

	func urlSession(
		_ session: URLSession,
		task: URLSessionTask,
		willPerformHTTPRedirection response: HTTPURLResponse,
		newRequest request: URLRequest,
		completionHandler: @escaping (URLRequest?) -> Void
	) {
		client?.urlProtocol(
			self,
			wasRedirectedTo: request,
			redirectResponse: response
		)

		completionHandler( request )
	}

	func urlSession(
		_ session: URLSession,
		dataTask: URLSessionDataTask,
		didReceive response: URLResponse,
		completionHandler: @escaping ( URLSession.ResponseDisposition ) -> Void
	) {
		currentRequest.registerResponse( response )

		let cachePolicy = URLCache.StoragePolicy( rawValue: request.cachePolicy.rawValue ) ?? .notAllowed
		client?.urlProtocol( self, didReceive: response, cacheStoragePolicy: cachePolicy )
		completionHandler( .allow )
	}

	func urlSession(
		_ session: URLSession,
		dataTask: URLSessionDataTask,
		didReceive data: Data
	) {
		client?.urlProtocol( self, didLoad: data )
		downloadedData.append( data )
	}

	func urlSession(
		_ session: URLSession,
		task: URLSessionTask,
		didCompleteWithError error: Error?
	) {
		if let error = error {
			currentRequest.registerFailure( error )
			client?.urlProtocol( self, didFailWithError: error )
		}
		client?.urlProtocolDidFinishLoading( self )
	}

	func urlSession(
		_ session: URLSession,
		didBecomeInvalidWithError error: Error?
	) {
		guard let error = error else { return }
		client?.urlProtocol( self, didFailWithError: error )
		currentRequest.registerFailure( error )
	}
}
