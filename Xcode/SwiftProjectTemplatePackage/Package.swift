// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "SwiftProjectTemplatePackage",
  platforms: [
    .macOS(.v15),
    .iOS(.v18),
  ],
  products: [
    .library(
      name: "SwiftProjectTemplatePackage",
      targets: ["SwiftProjectTemplatePackage"]
    )
  ],
  dependencies: [
    .package(path: "../..")
  ],
  targets: [
    .target(
      name: "SwiftProjectTemplatePackage",
      dependencies: [
        "SwiftProjectTemplate"
      ]
    ),
    .testTarget(
      name: "SwiftProjectTemplatePackageTests",
      dependencies: ["SwiftProjectTemplatePackage"]
    ),
  ]
)
