// swift-tools-version: 5.8

// WARNING:
// This file is automatically generated.
// Do not edit it by hand because the contents will be replaced.

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "SwiftUIConponent",
    platforms: [
        .iOS("16.0")
    ],
    products: [
        .iOSApplication(
            name: "SwiftUIConponent",
            targets: ["AppModule"],
            bundleIdentifier: "com.sijong.ios.SwiftUIConponent",
            teamIdentifier: "U68CWSQ94X",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .placeholder(icon: .bunny),
            accentColor: .presetColor(.red),
            supportedDeviceFamilies: [
                .pad,
                .phone
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .landscapeRight,
                .landscapeLeft,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ]
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: "."
        )
    ]
)
