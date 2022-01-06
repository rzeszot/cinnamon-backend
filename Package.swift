// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "Cinnamon",
  targets: [
    .target(
      name: "App",
      dependencies: [
        "Movies"
      ],
      resources: [
        .copy("cinemas.json")
      ]
    ),
    .testTarget(name: "AppTests", dependencies: ["App"]),

    .target(
      name: "Movies"
    ),
    .testTarget(name: "MoviesTests", dependencies: ["Movies"])
  ]
)
