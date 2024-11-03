// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "SwiftProjectTemplate",
  platforms: [
    .macOS(.v15),
    .iOS(.v18),
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
