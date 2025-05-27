import RAGEngine
import DocumentParser
import Embedder
import LocalLLM
import VectorStore
#if canImport(SwiftUI)
import SwiftUI
#endif

#if canImport(SwiftUI)
@main
struct AuroraLLMApp: App {
    @StateObject private var viewModel = ChatViewModel()

    var body: some Scene {
        WindowGroup {
            ChatView(viewModel: viewModel)
        }
    }
}
#endif
