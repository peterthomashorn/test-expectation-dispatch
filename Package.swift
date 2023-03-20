// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "TestExpectationDispatch",
    products: [
        .library(
            name: "TestExpectationDispatch",
            targets: ["TestExpectationDispatch"]),
    ],
    targets: [
        .target(
            name: "TestExpectationDispatch",
            dependencies: []),
        .testTarget(
            name: "TestExpectationDispatchTests",
            dependencies: ["TestExpectationDispatch"]),
    ]
)
