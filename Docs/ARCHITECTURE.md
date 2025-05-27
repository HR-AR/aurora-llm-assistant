# AuroraLLM Architecture

AuroraLLM is a modular macOS SwiftUI application designed to run local-first.
The architecture is split into several modules:

- **UI**: SwiftUI chat interface implemented in `AuroraLLMApp`.
- **RAGEngine**: Coordinates retrieval augmented generation. Placeholder `handleQuery()` for now.
- **DocumentParser**: Extracts text from supported files using PDFKit and Vision OCR.
- **Embedder**: Placeholder module responsible for converting text to vector embeddings.
- **VectorStore**: Placeholder in-memory vector database for similarity search.
- **LocalLLM**: Placeholder local language model interface used to generate answers.

## Flow
1. User inputs a query through the UI.
2. `RAGEngine` embeds the query using `Embedder` and searches `VectorStore` for relevant documents.
3. Retrieved context is sent to `LocalLLM` along with the query to produce an answer.
4. The result is displayed back in the chat interface.

Future work will implement actual embedding, vector search, and model inference.
