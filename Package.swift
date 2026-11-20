// swift-tools-version: 5.6
// Copyright © 2026 Yodo1 Games. All rights reserved.

import PackageDescription

let package = Package(
    name: "Yodo1MasMediationFyber",
    platforms: [.iOS(.v15)],
    products: [
        .library(name: "Yodo1MasMediationFyber", targets: ["Yodo1MasMediationFyberTarget"]),
        .library(name: "Yodo1MasMediationFyber-AppLovinMediationFyberAdapter", targets: ["Yodo1MasMediationFyber-AppLovinMediationFyberAdapterTarget"]),
        .library(name: "Yodo1MasMediationFyber-DTExchangeAdapter", targets: ["Yodo1MasMediationFyber-DTExchangeAdapterTarget"]),
    ],
    dependencies: [
        .package(url: "https://github.com/AppLovin/AppLovin-MAX-Swift-Package.git", exact: "13.6.4"),
        .package(url: "https://github.com/googleads/swift-package-manager-google-mobile-ads.git", exact: "13.11.0"),
        .package(url: "https://github.com/inner-active/DTExchangeSDK-iOS-SPM.git", exact: "8.4.7"),
        .package(url: "https://github.com/Yodo1Games/MAS-Swift-Package-Core.git", exact: "5.0.0-beta.5"),
    ],
    targets: [
        // ==================== Yodo1MasMediationFyber ====================
        .target(
            name: "Yodo1MasMediationFyberTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationFyber"),
                .product(name: "Yodo1MasCore", package: "MAS-Swift-Package-Core"),
                .product(name: "DTExchangeSDK", package: "DTExchangeSDK-iOS-SPM"),
            ],
            path: "Sources/Yodo1MasMediationFyberTarget",
            resources: [.copy("Yodo1MasFyber.plist")]
        ),
        .binaryTarget(
            name: "Yodo1MasMediationFyber",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationFyber/Yodo1MasMediationFyber-5.0.0-beta.5.zip",
            checksum: "f140d491bc58f64843eb6615ce816542d9dfcc03974c7dfcd2a6994c5d43190b"
        ),
        // ==================== Yodo1MasMediationFyber-AppLovinMediationFyberAdapter ====================
        .target(
            name: "Yodo1MasMediationFyber-AppLovinMediationFyberAdapterTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationFyberTarget"),
                .product(name: "AppLovinSDK", package: "AppLovin-MAX-Swift-Package"),
                .target(name: "AppLovinMediationFyberAdapter"),
            ],
            path: "Sources/Yodo1MasMediationFyber-AppLovinMediationFyberAdapterTarget"
        ),
        .binaryTarget(
            name: "AppLovinMediationFyberAdapter",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationFyber/AppLovinMediationFyberAdapter-5.0.0-beta.5.zip",
            checksum: "393074ab6f5df5616cd2a7a95c3ec540a1b6d1c6b48d0baac76796c2883176c4"
        ),
        // ==================== Yodo1MasMediationFyber-DTExchangeAdapter ====================
        .target(
            name: "Yodo1MasMediationFyber-DTExchangeAdapterTarget",
            dependencies: [
                .target(name: "Yodo1MasMediationFyberTarget"),
                .product(name: "GoogleMobileAds", package: "swift-package-manager-google-mobile-ads"),
                .target(name: "DTExchangeAdapter"),
            ],
            path: "Sources/Yodo1MasMediationFyber-DTExchangeAdapterTarget"
        ),
        .binaryTarget(
            name: "DTExchangeAdapter",
            url: "https://mas-artifacts.yodo1.com/5.0.0-beta.5/iOS/Pre/spm/Yodo1MasMediationFyber/DTExchangeAdapter-5.0.0-beta.5.zip",
            checksum: "06a095c2db1306b710b65112b617944924faeb07c1163452a87bafa1362bcc30"
        ),
    ]
)
