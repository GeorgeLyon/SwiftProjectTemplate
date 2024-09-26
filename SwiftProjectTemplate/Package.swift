// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "SwiftProjectTemplate",
  platforms: [
    .macOS(.v14),
    .iOS(.v17)
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
