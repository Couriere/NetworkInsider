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
import Combine

@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
struct NetworkInsiderMainView: View {

	@ObservedObject private var storage: RequestsStorage = .shared
	@Environment( \.presentationMode ) private var presentation

	var body: some View {
		NavigationView {

			ScrollView {
				if #available(iOS 14.0, *) {
					LazyVStack( spacing: 2 ) {
						ForEach(
							storage.requests,
							content: RequestListRow.init
						)
					}
					.padding( .vertical, 1 )
				} else {
					List( storage.requests, rowContent: RequestListRow.init )
				}
			}
			.animation( .default, value: storage.requests.count )
			.background( Color.background )

			.navigationBarTitle( "Requests", displayMode: .inline )
			.navigationBarItems(
				leading: leadingBarButtons,
				trailing: trailingBarButtons
			)
		}
	}

	private var leadingBarButtons: some View {
		Button {
			presentation.wrappedValue.dismiss()
		} label: {
			Image( systemName: "xmark" )
		}
	}

	private var trailingBarButtons: some View {
		Button {
			RequestsStorage.shared.clear()
		} label: {
			Image( systemName: "trash" )
		}
	}
}

#if DEBUG
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
struct ContentView_Previews: PreviewProvider {
	static var previews: some View {
		sampleRequests.forEach {
			RequestsStorage.shared.insert( $0 )
		}

		return Group {
			NetworkInsiderMainView()

			NetworkInsiderMainView()
				.preferredColorScheme(.dark)
		}
	}
}
#endif
