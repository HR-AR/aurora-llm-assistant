import XCTest
@testable import DocumentParser
@testable import VectorStore

final class AuroraLLMTests: XCTestCase {
    func testPDFParsing() throws {
        #if canImport(PDFKit)
        guard let url = Bundle.module.url(forResource: "sample", withExtension: "pdf") else {
            throw XCTSkip("Sample PDF not found")
        }
        let parser = DocumentParser()
        let result = parser.parse(url: url)
        XCTAssertNotNil(result)
        #else
        throw XCTSkip("PDFKit not available")
        #endif
    }

    func testVectorSimilarity() throws {
        let store = VectorStore()
        store.add(id: "a", vector: [1, 0, 0])
        let results = store.nearest(to: [0, 1, 0], count: 1)
        XCTAssertEqual(results.count, 1)
    }
}
