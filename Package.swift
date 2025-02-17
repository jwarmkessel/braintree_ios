// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Braintree",
    platforms: [.iOS(.v12)],
    products: [
        .library(
            name: "BraintreeAmericanExpress",
            targets: ["BraintreeAmericanExpress"]
        ),
        .library(
            name: "BraintreeApplePay",
            targets: ["BraintreeApplePay"]
        ),
        .library(
            name: "BraintreeCard",
            targets: ["BraintreeCard"]
        ),
        .library(
            name: "BraintreeCore",
            targets: ["BraintreeCore"]
        ),
        .library(
            name: "BraintreeDataCollector",
            targets: ["BraintreeDataCollector", "KountDataCollector"]
        ),
        .library(
            name: "BraintreePaymentFlow",
            targets: ["BraintreePaymentFlow", "PPRiskMagnes"]
        ),
        .library(
            name: "BraintreePayPal",
            targets: ["BraintreePayPal", "PPRiskMagnes"]
        ),
        .library(
            name: "BraintreePayPalNativeCheckout",
            targets: ["BraintreePayPalNativeCheckout"]
        ),
        .library(
            name: "BraintreeSEPADirectDebit",
            targets: ["BraintreeSEPADirectDebit"]
        ),
        .library(
            name: "BraintreeThreeDSecure",
            targets: ["BraintreeThreeDSecure", "CardinalMobile", "PPRiskMagnes"]
        ),
        .library(
            name: "BraintreeUnionPay",
            targets: ["BraintreeUnionPay"]
        ),
        .library(
            name: "BraintreeVenmo",
            targets: ["BraintreeVenmo"]
        ),
        .library(
            name: "PayPalDataCollector",
            targets: ["PayPalDataCollector", "PPRiskMagnes"]
        )
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "BraintreeAmericanExpress",
            dependencies: ["BraintreeCore"],
            publicHeadersPath: "Public"
        ),
        .target(
            name: "BraintreeApplePay",
            dependencies: ["BraintreeCore"],
            publicHeadersPath: "Public"
        ),
        .target(
            name: "BraintreeCard",
            dependencies: ["BraintreeCore"],
            publicHeadersPath: "Public"
        ),
        .target(
            name: "BraintreeCore",
            exclude: ["Info.plist"],
            publicHeadersPath: "Public"
        ),
        .target(
            name: "BraintreeDataCollector",
            dependencies: ["BraintreeCore", "KountDataCollector"],
            exclude: ["Kount"],
            publicHeadersPath: "Public"
        ),
        .target(
            name: "BraintreePaymentFlow",
            dependencies: ["BraintreeCore", "PayPalDataCollector"],
            publicHeadersPath: "Public"
        ),
        .target(
            name: "BraintreePayPal",
            dependencies: ["BraintreeCore", "PayPalDataCollector"],
            publicHeadersPath: "Public"
        ),
        .target(
            name: "BraintreePayPalNativeCheckout",
            dependencies: [
                "BraintreeCore",
                "BraintreePayPal",
                "PayPalCheckout",
            ],
            path: "Sources/BraintreePayPalNativeCheckout"
        ),
        .binaryTarget(
            name: "PayPalCheckout",
            path: "Frameworks/XCFrameworks/PayPalCheckout.xcframework"
        ),
        .target(
            name: "BraintreeSEPADirectDebit",
            dependencies: ["BraintreeCore"],
            path: "Sources/BraintreeSEPADirectDebit"
        ),
        .target(
            name: "BraintreeThreeDSecure",
            dependencies: ["BraintreePaymentFlow", "BraintreeCard", "CardinalMobile", "PPRiskMagnes"],
            publicHeadersPath: "Public",
            cSettings: [.headerSearchPath("V2UICustomization")]
        ),
        .binaryTarget(
            name: "CardinalMobile",
            path: "Frameworks/XCFrameworks/CardinalMobile.xcframework"
        ),
        .target(
            name: "BraintreeUnionPay",
            dependencies: ["BraintreeCard"],
            publicHeadersPath: "Public"
        ),
        .target(
            name: "BraintreeVenmo",
            dependencies: ["BraintreeCore"],
            publicHeadersPath: "Public"
        ),
        .binaryTarget(
            name: "KountDataCollector",
            path: "Frameworks/XCFrameworks/KountDataCollector.xcframework"
        ),
        .target(
            name: "PayPalDataCollector",
            dependencies: ["BraintreeCore", "PPRiskMagnes"],
            path: "Sources/PayPalDataCollector"
        ),
        .binaryTarget(
            name: "PPRiskMagnes",
            path: "Frameworks/XCFrameworks/PPRiskMagnes.xcframework"
        )
    ]
)
