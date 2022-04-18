// swift-tools-version:5.3
import PackageDescription

let package = Package(
	name: "Network Insider",
	platforms: [ .iOS( .v11 ) ],
	products: [
		.library(
			name: "NetworkInsider",
			type: .dynamic,
			targets: ["NetworkInsider"]
		),
	],
	targets: [
		.target(
			name: "NetworkInsider",
			path: "Sources"
		),
	],
	swiftLanguageVersions: [ .v5 ]
)
