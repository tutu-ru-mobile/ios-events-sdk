// swift-tools-version:5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "CriteoEventsSDK",
    products: [
        .library(
            name: "CriteoEventsSDK",
            targets: ["CriteoEventsSDK"]),
    ],
    dependencies: [],
    targets: [
        .target(
            name: "CriteoEventsSDK",
            path: "events-sdk",
            publicHeadersPath: "include",
            cSettings: [
                .headerSearchPath("include"),
                 .headerSearchPath("event"),
                 .headerSearchPath("event/serializer"),
                 .headerSearchPath("network"),
                 .headerSearchPath("product"),
                 .headerSearchPath("service"),
                 .headerSearchPath("util"),
                 .headerSearchPath(".")
             ])
    ]
)
