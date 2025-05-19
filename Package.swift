// swift-tools-version: 5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "haydenevans-saga",
    /*platforms: [
        .macOS(.v12),
    ],*/
    dependencies: [
    .package(url: "https://github.com/loopwerk/Saga", from: "2.0.0"),
    .package(url: "https://github.com/loopwerk/SagaParsleyMarkdownReader", from: "1.0.0"),
    .package(url: "https://github.com/loopwerk/SagaSwimRenderer", from: "1.0.0"),
  ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .executableTarget(
            name: "haydenevans-saga",
            dependencies: [
                "Saga", 
                "SagaParsleyMarkdownReader", 
                "SagaSwimRenderer"
            ]
        ),
    ]
)
