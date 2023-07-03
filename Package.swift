// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftPokeApi",
    platforms: [
        .macOS(.v11),
        .iOS(.v14),
        .watchOS(.v7),
        .tvOS(.v14)
    ],
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "PokeApi",
            targets: [
                "PokeApi"
            ]
        ),
        .library(
            name: "PokeApiCaching",
            targets: [
                "PokeApiCaching"
            ]
        ),
        .library(
            name: "PokeApiAsync",
            targets: [
                "PokeApiAsync"
            ]
        ),
        .library(
            name: "PokeApiCombine",
            targets: [
                "PokeApiCombine"
            ]
        ),
        .library(
            name: "PokiApiDataTask",
            targets: [
                "PokiApiDataTask"
            ]
        ),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "PokeApi",
            dependencies: [
                // no dependencies
            ]),
        .target(
            name: "PokeApiAsync",
            dependencies: [
                "PokeApi"
            ]),
        .target(
            name: "PokeApiCaching",
            dependencies: [
                "PokeApi"
            ]),
        .target(
            name: "PokeApiCombine",
            dependencies: [
                "PokeApi"
            ]),
        .target(
            name: "PokiApiDataTask",
            dependencies: [
                "PokeApi"
            ]),
        .testTarget(
            name: "SwiftPokeApiTests",
            dependencies: ["PokeApi"]),
    ]
)
