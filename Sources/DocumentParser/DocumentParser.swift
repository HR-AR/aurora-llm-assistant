import Foundation
#if canImport(PDFKit)
import PDFKit
#endif
#if canImport(Vision)
import Vision
#endif

public enum ParsedDocument {
    case text(String)
}

public final class DocumentParser {
    public init() {}

    public func parse(url: URL) -> ParsedDocument? {
        switch url.pathExtension.lowercased() {
        case "pdf":
            return parsePDF(url: url)
        case "txt":
            return parseTXT(url: url)
        case "docx":
            return parseDOCX(url: url)
        case "png":
            return parsePNG(url: url)
        case "eml":
            return parseEML(url: url)
        default:
            return nil
        }
    }

#if canImport(PDFKit)
    private func parsePDF(url: URL) -> ParsedDocument? {
        guard let pdf = PDFDocument(url: url) else { return nil }
        var text = ""
        for i in 0..<pdf.pageCount {
            if let page = pdf.page(at: i) {
                text += page.string ?? ""
            }
        }
        return .text(text)
    }
#else
    private func parsePDF(url: URL) -> ParsedDocument? {
        return nil
    }
#endif

    private func parseTXT(url: URL) -> ParsedDocument? {
        guard let data = try? Data(contentsOf: url),
              let text = String(data: data, encoding: .utf8) else { return nil }
        return .text(text)
    }

    private func parseDOCX(url: URL) -> ParsedDocument? {
        // TODO: implement DOCX parsing
        return nil
    }

#if canImport(Vision)
    private func parsePNG(url: URL) -> ParsedDocument? {
        // TODO: implement OCR using Vision
        return nil
    }
#else
    private func parsePNG(url: URL) -> ParsedDocument? {
        return nil
    }
#endif

    private func parseEML(url: URL) -> ParsedDocument? {
        // TODO: implement email parsing
        return nil
    }
}
