import PackageDescription

let package = Package(
  name: "SwiftPCAP",
  targets: [],
  dependencies: [
    .Package(url: "https://github.com/msmiley/CPcap.git", majorVersion: 1),
    .Package(url: "https://github.com/msmiley/SwiftHexTools", majorVersion: 1)
  ]
)
