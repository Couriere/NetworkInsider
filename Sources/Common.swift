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
import SwiftUI

let requestDateFormatter: DateFormatter = {
	let formatter = DateFormatter()
	formatter.dateStyle = .none
	formatter.timeStyle = .medium
	return formatter
}()


@propertyWrapper struct Synchronized<Value> {

	var wrappedValue: Value {
		get { lock.lock(); defer { lock.unlock() }; return _value }
		set { lock.lock(); defer { lock.unlock() }; _value = newValue }
	}

	init( wrappedValue: Value ) {
		_value = wrappedValue
	}

	private var _value: Value
	private let lock = NSRecursiveLock()
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension UIColor {
	convenience init(
		light: @escaping @autoclosure () -> UIColor,
		dark: @escaping @autoclosure () -> UIColor
	) {
		self.init { traitCollection in
			switch traitCollection.userInterfaceStyle {
			case .light, .unspecified:
				return light()
			case .dark:
				return dark()
			@unknown default:
				return light()
			}
		}
	}
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color {
	init(
		light: @escaping @autoclosure () -> UIColor,
		dark: @escaping @autoclosure () -> UIColor
	) {
		self.init( UIColor( light: light(), dark: dark() ))
	}
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color {
	static let background = Color(
		light: UIColor( white: 0.95, alpha: 1 ),
		dark: .systemGray6
	)

	static let gradient = Color(
		light: .white,
		dark: .black
	)
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension UIViewController {

	@MainActor
	func dismiss( animated flag: Bool ) async {
		await withUnsafeContinuation { continuation in
			self.dismiss( animated: flag ) {
				continuation.resume()
			}
		}
	}
}
