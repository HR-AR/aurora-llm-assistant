#if canImport(SwiftUI)
import Foundation
import RAGEngine

final class ChatViewModel: ObservableObject {
    @Published var inputText: String = ""
    @Published var messages: [String] = []
    private let engine = RAGEngine()

    func send() {
        let query = inputText
        inputText = ""
        messages.append("You: \(query)")
        engine.handleQuery(query) { [weak self] response in
            DispatchQueue.main.async {
                self?.messages.append("Assistant: \(response)")
            }
        }
    }
}
#endif
