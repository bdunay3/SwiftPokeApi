// swift-tools-version: 5.9
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftPokeApi",
    platforms: [
        .macOS(.v11),
        .iOS(.v14),
        .watchOS(.v7),
        .tvOS(.v14),
        .visionOS(.v1)
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
            name: "PokeApiModels",
            targets: [
                "PokeApiModels"
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
        // Needed to work with the remote API. The additional libraries below are split up depending on what you want to do.
        // This library doesn't force the user to import things they done want to use. For example if you don't to use the
        // Combine functions, don't import that library into your project.
        .target(
            name: "PokeApi"
        ),
        
        // This library splits out the Models into their own library in case you want to work with ONLY the model types.
        .target(
            name: "PokeApiModels",
            dependencies: [
                "PokeApi"
            ]
        ),
        
        // Additional Libraries
        .target(
            name: "PokeApiAsync",
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
    ]
)
