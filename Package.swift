// swift-tools-version: 6.2
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "MisakiSwift",
  platforms: [
    .iOS(.v17), .macOS(.v14)
  ],
  products: [
    .library(
      name: "MisakiSwift",
      type: .dynamic,
      targets: ["MisakiSwift"]
    ),
  ],
  dependencies: [
    .package(url: "https://github.com/ml-explore/mlx-swift", exact: "0.30.2"),
    .package(url: "https://github.com/darphoenix/MLXUtilsLibrary.git", exact: "0.0.7")
  ],
  targets: [
    .target(
      name: "MisakiSwift",
      dependencies: [
        .product(name: "MLX", package: "mlx-swift"),
        .product(name: "MLXNN", package: "mlx-swift"),
        .product(name: "MLXUtilsLibrary", package: "MLXUtilsLibrary")
     ],
     resources: [
      .copy("../../Resources/")
     ]
    ),
    .testTarget(
      name: "MisakiSwiftTests",
      dependencies: ["MisakiSwift"]
    ),
  ]
)
