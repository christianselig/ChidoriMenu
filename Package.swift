// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "ChidoriMenu",
    platforms: [
        .iOS(.v13),
    ],
    products: [
        .library(
            name: "ChidoriMenu",
            targets: ["ChidoriMenu"]
        ),
    ],
    dependencies: [
    ],
    targets: [
        .target(
            name: "ChidoriMenu",
            dependencies: [],
            path: "Source",
            exclude: ["Source/ExampleViewController.swift"]
        ),
    ]
)
