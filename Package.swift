// swift-tools-version: 5.10

import PackageDescription

let package = Package(
    name: "Reroute",
    platforms: [
        .iOS(.v16),
    ],
    products: [
        .library(
            name: "Reroute",
            targets: [
                "Reroute",
            ]
        ),
    ],
    targets: [
        .target(
            name: "Reroute"
        ),
        .testTarget(
            name: "RerouteTests",
            dependencies: [
                "Reroute",
            ]
        ),
    ]
)
