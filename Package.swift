// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "OrkaStorable",
    platforms: [
        .macOS(.v10_14), .iOS(.v13), .tvOS(.v13)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "OrkaStorable",
            targets: ["OrkaStorable"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/joey-barbier/ios-coredatawrapper.git",
                 .upToNextMajor(from: "1.0.2")),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "OrkaStorable",
            dependencies: [.product(name: "OrkaCoreDataWrapper",
                                    package: "ios-coredatawrapper")]),
        .testTarget(
            name: "OrkaStorableTests",
            dependencies: [
                "OrkaStorable",
                .product(name: "OrkaCoreDataWrapper", package: "ios-coredatawrapper")
            ]),
    ]
)
