// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Route",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "Route",
            targets: [
                "Route",
            ]
        ),
    ],
    targets: [
        .target(
            name: "Route"
        ),
        .testTarget(
            name: "RouteTests",
            dependencies: [
                "Route",
            ]
        ),
    ]
)
