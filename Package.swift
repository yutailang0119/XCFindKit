// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "XCFindKit",
    platforms: [
        .macOS(.v10_10),
    ],
    products: [
        .executable(
            name: "xcode-find",
            targets: ["xcode-find"]),
        .library(
            name: "XCFindKit",
            targets: ["XCFindKit"]),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "xcode-find",
            dependencies: ["XCFindKit"]),
        .target(
            name: "XCFindKit",
            dependencies: []),
        .testTarget(
            name: "XCFindKitTests",
            dependencies: ["XCFindKit"]),
    ],
    swiftLanguageVersions: [.v5]
)
