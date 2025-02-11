// swift-tools-version: 5.8

import PackageDescription

let package = Package(name: "AndroidEntry", products: [
    .library(name: "AndroidEntry", targets: ["AndroidEntry"]),
    .library(name: "AndroidEntryLegacy", targets: ["AndroidEntryLegacy"]),
], dependencies: [
    .package(url: "https://github.com/purpln/native-app-glue.git", branch: "main"),
], targets: [
    .target(name: "AndroidEntry", dependencies: [
        .product(name: "NativeAppGlue", package: "native-app-glue"),
    ], swiftSettings: [
        .enableExperimentalFeature("Extern"),
    ]),
    .target(name: "AndroidEntryLegacy", dependencies: [
        .product(name: "NativeAppGlue", package: "native-app-glue"),
    ]),
])
