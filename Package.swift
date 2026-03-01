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
    .package(url: "https://github.com/ml-explore/mlx-swift", exact: "0.30.6"),
    .package(url: "https://github.com/darphoenix/MLXUtilsLibrary.git", exact: "0.0.9")
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
      // Avoid copying the whole Resources directory; nested bundle directories break
      // simulator codesign on some Xcode/macOS toolchains.
      .copy("../../Resources/gb_bart.safetensors"),
      .copy("../../Resources/gb_bart_config.json"),
      .copy("../../Resources/gb_gold.json"),
      .copy("../../Resources/gb_silver.json"),
      .copy("../../Resources/us_bart.safetensors"),
      .copy("../../Resources/us_bart_config.json"),
      .copy("../../Resources/us_gold.json"),
      .copy("../../Resources/us_silver.json")
     ]
    ),
    .testTarget(
      name: "MisakiSwiftTests",
      dependencies: ["MisakiSwift"]
    ),
  ]
)
