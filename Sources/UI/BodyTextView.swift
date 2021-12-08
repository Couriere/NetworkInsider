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

import SwiftUI

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
struct BodyTextView: View {

	let title: String
	let text: String

	var body: some View {
		ScrollView {
			BodyText( text: text )
		}
		.navigationBarTitle( "\( title )", displayMode: .inline )
	}
}

/// Regulat `Text` control is way too slow to
/// render long body texts, so we use UITextView.
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
private struct BodyText: View {

	let text: String

	@State private var height: CGFloat = .zero
	@State private var textView = UITextView()

	var body: some View {
		InternalLabel( text: text,
					   textView: textView,
					   dynamicHeight: $height )
			.frame( height: height )
	}

	struct InternalLabel: UIViewRepresentable {

		let text: String
		let textView: UITextView
		@Binding var dynamicHeight: CGFloat

		func makeUIView(context: Context) -> UITextView {
			textView.text = text
			textView.font = .preferredFont( forTextStyle: .body )
			textView.textAlignment = .left
			textView.backgroundColor = .clear
			textView.setContentCompressionResistancePriority(.defaultLow, for: .horizontal)
			textView.setContentCompressionResistancePriority(.defaultLow, for: .vertical)
			textView.isScrollEnabled = false
			return textView
		}

		func updateUIView(_ uiView: UITextView, context: Context) {
			DispatchQueue.main.async {
				dynamicHeight = uiView.sizeThatFits(
					CGSize( width: uiView.bounds.width, height: CGFloat.greatestFiniteMagnitude)
				).height
			}
		}
	}
}
