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
struct CellView: View {

	let title: String
	let value: String

	var body: some View {
		VStack( alignment: .leading, spacing: -1 ) {
			Text( title )
				.font( .footnote )
				.bold()
			Text( value )
				.fontWeight( .light )
		}
		.frame( alignment: .leading )
	}
}

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
struct ExpandableCellList: View {

	init( _ list: [(String, String)] ) {
		self.list = list.map { Cell( title: $0.0, value: $0.1 )}
	}

	init( _ list: [ URLQueryItem ] ) {
		self.list = list.map { Cell( title: $0.name, value: $0.value ?? "" )}
	}

	private struct Cell: Identifiable {
		let title: String
		let value: String
		var id: String { title + value }
	}
	private let list: [ Cell ]

	@State private var isExpanded: Bool = false
	let collapseAtCount: Int = 3

	var body: some View {
		VStack( spacing: -3 ) {
			ZStack {
				VStack( alignment: .leading, spacing: 6 ) {
					ForEach(
						list.prefix( isExpanded ? .max : collapseAtCount )
					){
						CellView( title: $0.title, value: $0.value )
					}
				}
				.frame( maxWidth: .infinity, alignment: .leading )

				if !isExpanded && list.count > collapseAtCount {
					LinearGradient(
						gradient: Gradient( colors: [.gradient.opacity( 0 ), .gradient] ),
						startPoint: .top,
						endPoint: .bottom
					)
				}
			}

			if list.count > collapseAtCount {
				Button( isExpanded ? "↑ Collapse ↑" : "↓ Expand ↓" ) {
					isExpanded.toggle()
				}
				.font( .caption )

			}
		}
		.animation( .default, value: isExpanded )
		.frame( maxWidth: .infinity )
	}
}

#if DEBUG
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
struct CellViews_Previews: PreviewProvider {

	static let query = URLComponents( url: sampleRequests[ 2 ].url,
							   resolvingAgainstBaseURL: false )!.queryItems!

    static var previews: some View {
		VStack {
			CellView( title: "someKey", value: "98FAD635-32B7-4105-A54E-BC191275779D" )
		}
		.previewLayout( .sizeThatFits )
		.padding()

		ScrollView {
			ExpandableCellList( query )
		}
			.previewLayout( .fixed( width: 375, height: 220 ))
    }
}
#endif
