// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Awesome UI Components",
    products: [
        // Products define the executables and libraries a package produces, making them visible to other packages.
        .library(
            name: "Awesome UI Components",
            targets: ["Awesome UI Components"]),
    ],
    targets: [
        // Targets are the basic building blocks of a package, defining a module or a test suite.
        // Targets can depend on other targets in this package and products from dependencies.
        .target(
            name: "Awesome UI Components"),
        .testTarget(
            name: "Awesome UI ComponentsTests",
            dependencies: ["Awesome UI Components"]),
    ]
)
