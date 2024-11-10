// swift-tools-version: 6.0

import PackageDescription

let package = Package(
  name: "SwiftProjectTemplateAppPackage",
  platforms: [
    .macOS(.v15),
    .iOS(.v18),
  ],
  products: [
    .library(
      name: "SwiftProjectTemplateAppPackage",
      targets: ["SwiftProjectTemplateAppPackage"]
    )
  ],
  dependencies: [
    .package(name: "SwiftProjectTemplate", path: "../SwiftProjectTemplate")
  ],
  targets: [
    .target(
      name: "SwiftProjectTemplateAppPackage",
      dependencies: [
        "SwiftProjectTemplate"
      ]
    ),
    .testTarget(
      name: "SwiftProjectTemplateAppPackageTests",
      dependencies: ["SwiftProjectTemplateAppPackage"]
    ),
  ]
)
