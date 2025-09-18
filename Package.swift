// swift-tools-version:5.10
// The swift-tools-version declares the minimum version of Swift required to build this package.

import Foundation
import PackageDescription

let package = Package(
  name: "opentelemetry-swift-glia",
  platforms: [
    .macOS(.v12),
    .iOS(.v13),
  ],
  products: [
    .library(
      name: "OpenTelemetryProtocolExporterHTTP", targets: ["OpenTelemetryProtocolExporterHttp"]
    ),
    .library(name: "ResourceExtension", targets: ["ResourceExtension"]),
    .library(name: "OpenTelemetryApi-gl", targets: ["OpenTelemetryApi-gl"]),
  ],
  dependencies: [
    .package(url: "https://github.com/open-telemetry/opentelemetry-swift-core.git", from: "2.1.0"),
    .package(url: "https://github.com/apple/swift-protobuf.git", from: "1.29.0"),
    .package(url: "https://github.com/apple/swift-log.git", from: "1.6.3"),
  ],
  targets: [
   .target(
      name: "OpenTelemetryApi-gl",
      dependencies: [
         .product(name: "OpenTelemetryApi", package: "opentelemetry-swift-core")
      ],
      path: "Sources/OpenTelemetryApi-gl",
      swiftSettings: [
        .unsafeFlags(["-enable-library-evolution"]) // <-- Use this instead
      ]
   ),
    .target(
      name: "OpenTelemetryProtocolExporterCommon",
      dependencies: [
        .product(name: "OpenTelemetrySdk", package: "opentelemetry-swift-core"),
        .product(name: "Logging", package: "swift-log"),
        .product(name: "SwiftProtobuf", package: "swift-protobuf")
      ],
      path: "Sources/Exporters/OpenTelemetryProtocolCommon",
      swiftSettings: [
        .unsafeFlags(["-enable-library-evolution"]) // <-- Use this instead
      ]
    ),
    .target(
      name: "OpenTelemetryProtocolExporterHttp",
      dependencies: [
        .product(name: "OpenTelemetrySdk", package: "opentelemetry-swift-core"),
        "OpenTelemetryProtocolExporterCommon",
      ],
      path: "Sources/Exporters/OpenTelemetryProtocolHttp",
      swiftSettings: [
        .unsafeFlags(["-enable-library-evolution"]) // <-- Use this instead
      ]
    ),
    .target(
        name: "ResourceExtension",
        dependencies: [
          .product(name: "OpenTelemetrySdk", package: "opentelemetry-swift-core")
        ],
        path: "Sources/Instrumentation/SDKResourceExtension",
        exclude: ["README.md"],
        swiftSettings: [
          .unsafeFlags(["-enable-library-evolution"]) // <-- Use this instead
        ]
    ),
  ]
)
