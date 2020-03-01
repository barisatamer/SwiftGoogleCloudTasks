// swift-tools-version:5.1
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "SwiftGoogleCloudTasks",
    platforms: [
       .macOS(.v10_14)
    ],
    products: [
        // Products define the executables and libraries produced by a package, and make them visible to other packages.
        .library(
            name: "SwiftGoogleCloudTasks",
            targets: ["SwiftGoogleCloudTasks"]),
    ],
    dependencies: [
        .package(url: "https://github.com/grpc/grpc-swift.git", .branch("nio")),
        .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.7.0"),
        .package(url: "https://github.com/googleapis/google-auth-library-swift.git", from: "0.5.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages which this package depends on.
        .target(
            name: "SwiftGoogleCloudTasks",
            dependencies: ["GRPC", "SwiftProtobuf", "OAuth2"]),
        .testTarget(
            name: "SwiftGoogleCloudTasksTests",
            dependencies: ["SwiftGoogleCloudTasks"]),
    ]
)
