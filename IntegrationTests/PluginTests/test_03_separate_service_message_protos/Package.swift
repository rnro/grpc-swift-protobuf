// swift-tools-version: 6.0
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "grpc-adopter",
    platforms: [
      .macOS(.v15),
      .iOS(.v18),
      .tvOS(.v18),
      .watchOS(.v11),
      .visionOS(.v2),
    ],
    dependencies: [
        .package(
            path: "../../../../grpc-swift-protobuf"
        ),
        .package(
          url: "https://github.com/grpc/grpc-swift.git",
          from: "1.28.2"
        )
    ],
    targets: [
        .executableTarget(
            name: "grpc-adopter",
            dependencies: [
                .product(name: "GRPCCore", package: "grpc-swift"),
                .product(name: "GRPCInProcessTransport", package: "grpc-swift"),
                .product(name: "GRPCProtobuf", package: "grpc-swift-protobuf"),
            ],
            plugins: [
                .plugin(name: "GRPCGeneratorPlugin", package: "grpc-swift-protobuf")
            ]
        )
    ]
)
