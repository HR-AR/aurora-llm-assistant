// swift-tools-version: 5.10
import PackageDescription

let products: [PackageDescription.Product] = {
    var items: [Product] = [
        .library(name: "RAGEngine", targets: ["RAGEngine"]),
        .library(name: "DocumentParser", targets: ["DocumentParser"]),
        .library(name: "Embedder", targets: ["Embedder"]),
        .library(name: "LocalLLM", targets: ["LocalLLM"]),
        .library(name: "VectorStore", targets: ["VectorStore"])
    ]
    #if os(macOS)
    items.append(.executable(name: "AuroraLLMApp", targets: ["AuroraLLMApp"]))
    #endif
    return items
}()

let targets: [PackageDescription.Target] = {
    var items: [Target] = [
        .target(
            name: "RAGEngine",
            dependencies: ["Embedder", "LocalLLM", "VectorStore"],
            path: "Sources/RAGEngine"
        ),
        .target(
            name: "DocumentParser",
            path: "Sources/DocumentParser"
        ),
        .target(
            name: "Embedder",
            path: "Sources/Embedder"
        ),
        .target(
            name: "LocalLLM",
            path: "Sources/LocalLLM"
        ),
        .target(
            name: "VectorStore",
            path: "Sources/VectorStore"
        ),
        .testTarget(
            name: "AuroraLLMTests",
            dependencies: ["DocumentParser", "VectorStore"],
            path: "Tests/AuroraLLMTests",
            resources: [
                .copy("Resources")
            ]
        )
    ]
    #if os(macOS)
    items.insert(
        .executableTarget(
            name: "AuroraLLMApp",
            dependencies: ["RAGEngine", "DocumentParser", "Embedder", "LocalLLM", "VectorStore"],
            path: "Sources/AuroraLLMApp"
        ), at: 0)
    #endif
    return items
}()

let package = Package(
    name: "AuroraLLM",
    platforms: [
        .macOS(.v13)
    ],
    products: products,
    dependencies: [],
    targets: targets
)
