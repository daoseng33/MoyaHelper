// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "MoyaHelper",
    platforms: [
        .iOS(.v16)
    ],
    products: [
        .library(
            name: "MoyaHelper",
            targets: ["MoyaHelper"]),
    ],
    dependencies: [
        .package(url: "https://github.com/Moya/Moya.git", .upToNextMajor(from: "15.0.0")),
    ],
    targets: [
        .target(
            name: "MoyaHelper",
            dependencies: [
                .product(name: "CombineMoya", package: "Moya"),
            ]
        ),
        .testTarget(
            name: "MoyaHelperTests",
            dependencies: ["MoyaHelper"]
        ),
    ]
)
