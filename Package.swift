// swift-tools-version:5.5

import PackageDescription

let package = Package(
  name: "Cinnamon",
  dependencies: [
    .package(
      name: "SnapshotTesting",
      url: "https://github.com/pointfreeco/swift-snapshot-testing.git", .upToNextMajor(from: "1.0.0")
    )
  ],
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
//    .testTarget(name: "AppTests", dependencies: ["App"]),

    .target(
      name: "Movies"
    ),
    .testTarget(
      name: "MoviesTests",
      dependencies: ["Movies", "SnapshotTesting"],
      resources: [
        .copy("__Snapshots__")
      ]
    )
  ]
)
