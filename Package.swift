// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XCFindKit",
    products: [
        .executable(
            name: "xcfind",
            targets: ["xcfind"]),
        .library(
            name: "XCFindKit",
            targets: ["XCFindKit"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "xcfind",
            dependencies: ["XCFindKit"]),
        .target(
            name: "XCFindKit",
            dependencies: []),
        .testTarget(
            name: "XCFindKitTests",
            dependencies: ["XCFindKit"]),
    ]
)
