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

import UIKit
import SwiftUI

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

	static var shared: AppDelegate { UIApplication.shared.delegate as! AppDelegate }
	var window: UIWindow?

	func application(
		_ application: UIApplication,
		didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil
	) -> Bool {

		window = UIWindow( frame: UIScreen.main.bounds )
		window?.makeKeyAndVisible()

		#if DEBUG
		_debug_setSampleRequests()
		start()

		window?.rootViewController = UIHostingController( rootView: TestView())
		return true
		#else
		fatalError()
		#endif
	}

	#if DEBUG
	struct TestView: View {
		var body: some View {
			VStack {
				NetworkInsiderMainView()
				Button( action: performTestRequest, label: { Text( "Start test request" ) })
			}
		}

		private func performTestRequest() {
			let url = URL(string: "https://httpbin.org/post")!
			var request = URLRequest(url: url)
			request.httpMethod = "POST"
			request.addValue("application/json", forHTTPHeaderField: "Content-Type")
			request.addValue("application/json", forHTTPHeaderField: "Accept")
			request.httpBody = try? JSONSerialization.data(withJSONObject: [ "hello": "world" ], options: [])

			URLSession.shared.dataTask( with: request ) { data, response, error in
				guard let data = data,
					  let json = String( data: data, encoding: .utf8 ) else { return }
				print( json )
			}
			.resume()
		}
	}
	#endif
}
