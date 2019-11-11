import Foundation

protocol DataLoader {
    func load(from path: URL) throws -> Data
}

struct FileSystemDataLoader: DataLoader {
    func load(from path: URL) throws -> Data {
        return try Data(contentsOf: path)
    }
}
