// swift-tools-version: 5.9
import PackageDescription

let package = Package(
    name: "CEOSimulation",
    platforms: [
        .iOS(.v17),
        .macOS(.v14)
    ],
    products: [
        .library(
            name: "CEOSimulationCore",
            targets: ["CEOSimulationCore"]),
    ],
    dependencies: [
        .package(url: "https://github.com/apple/swift-collections.git", from: "1.0.0")
    ],
    targets: [
        .target(
            name: "CEOSimulationCore",
            dependencies: [
                .product(name: "Collections", package: "swift-collections")
            ]
        ),
        .testTarget(
            name: "CEOSimulationCoreTests",
            dependencies: ["CEOSimulationCore"]
        ),
    ]
)