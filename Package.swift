// swift-tools-version: 6.0

import PackageDescription

let package = Package(
    name: "Route",
    platforms: [
        .iOS(.v18),
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
