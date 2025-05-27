import Foundation

public final class VectorStore {
    private var vectors: [String: [Double]] = [:]

    public init() {}

    public func add(id: String, vector: [Double]) {
        vectors[id] = vector
    }

    public func nearest(to vector: [Double], count: Int = 5) -> [String] {
        return vectors.keys.prefix(count).map { $0 }
    }
}
