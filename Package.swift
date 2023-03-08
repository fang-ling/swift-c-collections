// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "swift-c-collections",
    products: [
        .library(
            name: "CCollections",
            targets: ["swift-c-collections"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "swift-c-collections",
            dependencies: ["_CCollections"]
        ),
        .target(
            name: "_CCollections",
            path: "Sources/c-collections",
            exclude: ["benchmark"]
        ),
        .testTarget(
            name: "swift-c-collectionsTests",
            dependencies: ["swift-c-collections"]),
    ]
)
