// swift-tools-version: 5.9

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
