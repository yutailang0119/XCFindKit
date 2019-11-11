import Foundation

public protocol DataLoader {
    func load(from path: URL) throws -> Data
}

public struct FileSystemDataLoader: DataLoader {
    public func load(from path: URL) throws -> Data {
        return try Data(contentsOf: path)
    }
}
