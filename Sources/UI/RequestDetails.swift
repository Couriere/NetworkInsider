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
struct RequestDetails: View {

	@ObservedObject var request: Request
	@State private var toastString: String?

	private let toastDuration: TimeInterval = 3

    var body: some View {
		ScrollView {
			VStack( alignment: .leading, spacing: 0 ) {
				requestDescriptionSection()
				responseDescriptionSection()
			}
			.multilineTextAlignment( .leading )
		}
		.navigationBarTitle( "\( request.url.path )", displayMode: .inline )
		.navigationBarItems( trailing: navigationBarItems )
		.background( Color.gradient )
    }

	@ViewBuilder
	private func requestDescriptionSection() -> some View {

		sectionHeader( "Request at \( requestDateFormatter.string( from: request.request.date ))" )
		RequestListRow( request: request )
			.padding( .bottom, 8 )
			.disabled( true )

		subsection( "Headers") {
			ForEach( Array( request.request.headers.keys ), id: \.self ) {
				CellView( title: $0, value: request.request.headers[ $0 ]! )
			}
		}

		if let components = URLComponents( url: request.url,
										   resolvingAgainstBaseURL: false ) {

			if let query = components.queryItems, !query.isEmpty {
				subsection( "Query" ) {
					ExpandableCellList( query )
				}
			}
			if let body = request.bodyJSON {
				subsection( "Body" ) { Text( body ) }
			}
		} else {
			Text( request.url.absoluteString )
				.padding( .horizontal )
		}
	}

	@ViewBuilder
	private func responseDescriptionSection() -> some View {
		if let response = request.response {

			sectionHeader( "Response" )
				.padding( .bottom )

			subsection( nil ) {
				ForEach( Array( response.headers.keys ), id: \.self ) {
					CellView( title: $0, value: response.headers[ $0 ]! )
				}
			}

			if let body = request.responseJSON {
				subsection( "Body" ) {
					if body.count > 30 * 1024 {
						NavigationLink(
							"View Body",
							destination: BodyTextView( title: "Body", text: body )
						)
							.frame( maxWidth: .infinity )
							.padding( .vertical )
					} else {
						Text( body )
					}
				}
			}
		}
	}

	private var navigationBarItems: some View {

		let curlButton = Button {
			UIPasteboard.general.string = request.curl
		} label: {
			Text( "curl" )
		}

		let exportButton = Button( action: presentActivityController ) {
			Image( systemName: "square.and.arrow.up" )
		}

		return HStack { curlButton; exportButton }
	}


	private func sectionHeader( _ text: String ) -> some View {
		Text( text )
			.frame( maxWidth: .infinity )
		.padding( .vertical, 4 )
		.padding( .horizontal )
		.background( Color.background )
	}

	private func subsection<Content: View>(
		_ header: String?,
		@ViewBuilder content: () -> Content
	) -> some View {
		VStack( alignment: .leading, spacing: 4 ) {
			if let header = header {
				Text( header )
					.font( .subheadline )
					.bold()
					.frame( maxWidth: .infinity, alignment: .leading )
					.padding( .vertical, 2 )
					.padding( .horizontal )
					.padding( .horizontal, 20 )
					.background( Color.background )
			}

			content()
				.padding( .horizontal )
		}
		.padding( .bottom, 24 )
	}

	private func presentActivityController() {
		let controller = UIActivityViewController(
			activityItems: [ request.export ],
			applicationActivities: nil
		)

		guard var rootViewController = UIApplication.shared
				.windows
				.first( where: { $0.isKeyWindow } )?
				.rootViewController
		else { return }

		while rootViewController.presentedViewController != nil {
			rootViewController = rootViewController.presentedViewController!
		}

		rootViewController.present( controller, animated: true )
	}
}

	
#if DEBUG
@available(iOS 13.0, macOS 10.15, tvOS 13.0, watchOS 6.0, *)
struct RequestDetails_Previews: PreviewProvider {
	static var previews: some View {
		NavigationView {
			RequestDetails( request: sampleRequests[ 2 ] )
		}
		.preferredColorScheme( .light )

		NavigationView {
			RequestDetails( request: sampleRequests[ 2 ] )
		}
		.preferredColorScheme( .dark )
	}
}
#endif
