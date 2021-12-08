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
struct RequestListRow: View {

	@ObservedObject var request: Request

	var body: some View {
		NavigationLink {
			RequestDetails( request: request )
		} label: {

			HStack( alignment: .top ) {

				HStack( spacing: 0 ) {
					statusCodeColor
						.frame( width: 10 )

					headerView
				}

				Text( request.url.droppingQuery.absoluteString )
					.multilineTextAlignment( .leading )
					.font( .body )
					.foregroundColor( .primary )
					.lineLimit( 3 )
					.minimumScaleFactor( 0.5 )
					.fixedSize( horizontal: false, vertical: true )
					.padding( .vertical, 2 )

				Spacer()
			}
			.frame( height: 70 )
			.background( statusCodeColor.opacity( 0.07 ) )
			.background( Color.background )
		}
	}


	private var headerView: some View {

		VStack( spacing: 4 ) {
			Text( request.request.method )
				.font( .subheadline )
				.bold()
				.padding( .top, 4 )

			if let response = request.response {

				HStack( spacing: 4 ) {
					Text( String( response.code ) )
						.font( .subheadline )
						.padding( .horizontal, 4 )
						.overlay(
							Capsule().stroke( statusCodeColor )
						)


					if request.error != nil {
						Text( "**" )
					}
				}
				.foregroundColor( statusCodeColor )
			}
			else if request.error != nil {
				Text( "Failed" )
					.foregroundColor( statusCodeColor )
			}

			if let result = request.result {
				Text( result.duration.string )
					.font( .footnote )
			} else {
				if #available(iOS 14.0, *) {
					ProgressView()
						.scaleEffect( 0.5, anchor: .center )
				}
			}

			Spacer( minLength: 0 )
		}
		.foregroundColor( .primary )
		.frame( width: 70, height: 70 )
		.frame( maxHeight: .infinity )
		.background( statusCodeColor.opacity( 0.15 ))

		.animation( .default, value: request.response?.code )
	}


	private var statusCodeColor: Color {
		guard request.error == nil else { return .red }
		guard let code = request.response?.code else { return .white }

		switch code {
		case ..<300: return .green
		case ..<400: return .blue
		case ..<500: return .orange
		case ..<400: return .red
		default: return .gray
		}
	}
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
extension Color {
	init( _ int: UInt, opacity: Double = 1 ) {
		let red = Double( ( int >> 16 ) & 0xFF )
		let green = Double( ( int >> 8 ) & 0xFF )
		let blue = Double( int & 0xFF )

		self.init( red: red / 255, green: green / 255, blue: blue / 255, opacity: opacity )
	}
}

extension TimeInterval {
	var string: String {
		let miliseconds = ( self * 1000 ).rounded()
		if miliseconds < 1000 {
			return "\( Int( miliseconds ))ms"
		}
		else if miliseconds < 60 * 1000 {
			return "\( ( miliseconds / 100 ).rounded() / 10 )s"
		}
		else {
			return "\( Int( miliseconds / 1000 / 60 ))m \( Int( miliseconds / 1000 ) % 60 )s"
		}
	}
}

extension URL {
	var droppingQuery: URL {
		var components = URLComponents( url: self, resolvingAgainstBaseURL: false )
		components?.query = nil
		return components?.url ?? self
	}
}

#if DEBUG
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
struct RequestListRow_Preview: PreviewProvider {

	private static var previewItemsView: some View {
		return VStack {
			ForEach( sampleRequests, content: RequestListRow.init )
		}
	}

	static var previews: some View {
		previewItemsView
			.background( Color.background )
			.previewLayout( .sizeThatFits )

		previewItemsView
			.preferredColorScheme( .dark )
			.background( Color.background )
			.previewLayout( .sizeThatFits )
	}
}
#endif
