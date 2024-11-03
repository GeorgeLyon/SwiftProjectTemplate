// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "SwiftProjectTemplate",
  platforms: [
    /// Use string versions to be more Linux-friendly
    .macOS("15.0"),
    .iOS("18.0"),
  ],
  products: [
    .library(
      name: "SwiftProjectTemplate",
      targets: ["SwiftProjectTemplate"])
  ],
  targets: [
    .target(
      name: "SwiftProjectTemplate"),
    .testTarget(
      name: "SwiftProjectTemplateTests",
      dependencies: ["SwiftProjectTemplate"]),
  ]
)
