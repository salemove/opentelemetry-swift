Pod::Spec.new do |spec|
  spec.name = "OpenTelemetry-Swift-Protocol-Exporter-Common-Glia"
  spec.version = "2.1.0"
  spec.summary = "Swift OpenTelemetry Protocol Exporter Common"

  spec.homepage = "https://github.com/open-telemetry/opentelemetry-swift"
  spec.documentation_url = "https://opentelemetry.io/docs/languages/swift"
  spec.license = { :type => "Apache 2.0", :file => "LICENSE" }
  spec.authors = "OpenTelemetry Authors"

  spec.source = { :git => "https://github.com/salemove/opentelemetry-swift.git", :tag => spec.version.to_s }
  spec.source_files = "Sources/Exporters/OpenTelemetryProtocolCommon/**/*.swift"
  spec.exclude_files = "**/Empty.swift"

  spec.swift_version = "5.10"
  spec.ios.deployment_target = "13.0"
  spec.module_name = "OpenTelemetryProtocolExporterCommon"

  spec.dependency 'OpenTelemetry-Swift-Api', '~> 2.1.1'
  spec.dependency 'OpenTelemetry-Swift-Sdk', '~> 2.1.1'
  spec.dependency 'SwiftProtobuf', '~> 1.28'
  spec.pod_target_xcconfig = { "OTHER_SWIFT_FLAGS" => "-module-name OpenTelemetryProtocolExporterCommon -package-name opentelemetry_swift_exporter_common" }

end
