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


public var isEnabled: Bool { return Configuration._isEnabled }
public var ignoredHosts: [ String ] {
	get { Configuration._ignoredHosts }
	set { Configuration._ignoredHosts = newValue }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public func start( swizzleURLSessionConfiguration: Bool = true ) {
	if swizzleURLSessionConfiguration {
		_ = URLSessionConfiguration.configurationInitsSwizzle
	}
	DispatchQueue.main.async {
		Configuration._isEnabled = true
		URLProtocol.registerClass( NetworkInsiderProxy.self )
	}
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@MainActor public func start( swizzleURLSessionConfiguration: Bool = true ) async {
	if swizzleURLSessionConfiguration {
		_ = URLSessionConfiguration.configurationInitsSwizzle
	}
	Configuration._isEnabled = true
	URLProtocol.registerClass( NetworkInsiderProxy.self )
}


@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
public func stop() {
	DispatchQueue.main.async {
		Configuration._isEnabled = false
		URLProtocol.unregisterClass( NetworkInsiderProxy.self )
	}
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@MainActor public func stop() async {
	Configuration._isEnabled = false
	URLProtocol.unregisterClass( NetworkInsiderProxy.self )
}

public var presentOnShake: Bool {
	get { Configuration._presentOnShake }
	set { Configuration._presentOnShake = newValue }
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
@MainActor public func present() async {
	guard !Configuration._isPresented else { return }

	final class HostingController<Content>: UIHostingController<Content> where Content: View {
		let dismissHandler: () -> Void
		init( rootView: Content, dismissHandler: @escaping () -> Void ) {
			self.dismissHandler = dismissHandler
			super.init( rootView: rootView )
		}
		@objc required dynamic init?(coder aDecoder: NSCoder) {
			fatalError("init(coder:) has not been implemented")
		}

		override func viewDidDisappear( _ animated: Bool ) {
			super.viewDidDisappear( animated )
			dismissHandler()
		}
	}


	if var rootViewController = UIApplication.shared.windows
		.first( where: { $0.isKeyWindow } )?
		.rootViewController {

		while let presentedViewController = rootViewController.presentedViewController {
			rootViewController = presentedViewController
		}

		let hostingController = HostingController( rootView: NetworkInsiderMainView() ) {
			Configuration._presentedController = nil
		}
		Configuration._presentedController = hostingController
		rootViewController.present( hostingController, animated: true )
	}
}

enum Configuration {

	@Synchronized static var _ignoredHosts: [ String ] = []
	@Synchronized static var _isEnabled: Bool = false
	@Synchronized static var _presentOnShake: Bool = true
	@Synchronized static var _presentedController: UIViewController?

	static var _isPresented: Bool { _presentedController != nil }
}

//  Override the default behavior of shake gestures to send our notification instead.
extension UIWindow {

	open override func motionEnded(
		_ motion: UIEvent.EventSubtype,
		with event: UIEvent?
	) {
		if #available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *),
		   Configuration._isEnabled && Configuration._presentOnShake,
		   motion == .motionShake {
			Task {
				if let presented = Configuration._presentedController {
					await presented.dismiss( animated: true )
				} else {
					await present()
				}
			}
		}
	}
}
