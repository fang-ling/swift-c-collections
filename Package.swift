// swift-tools-version: 5.7

import PackageDescription

let package = Package(
    name: "swift-c-collections",
    products: [
        .library(
            name: "CCollections",
            targets: ["CCollections"]
        ),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CCollections",
            dependencies: ["_CCollections"],
            path: "Sources/swift-c-collections"
        ),
        .target(
            name: "_CCollections",
            path: "Sources/c-collections",
            exclude: ["benchmark"]
        ),
        .testTarget(
            name: "swift-c-collectionsTests",
            dependencies: ["CCollections"])
    ]
)
