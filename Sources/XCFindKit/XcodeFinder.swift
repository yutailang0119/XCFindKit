import Foundation

protocol XcodeFinder {
    associatedtype Loader: DataLoader
    var dataLoader: Loader { get }
    func findXcodes() -> [Application]
}

extension XcodeFinder {
    func find(_ version: String) -> Application? {
        let xcodes = findXcodes()
        if let xcode = xcodes.first(where: { $0.version?.identifier == version }) {
            return xcode
        }

        guard let matchingMaxVersion = (
            xcodes
                .filter { $0.version?.identifier.hasPrefix(version) ?? false }
                .compactMap { $0.versionCode }
                .max()
            ) else {
                return nil
        }
        return xcodes
            .last { $0.versionCode == matchingMaxVersion }
    }
}

public struct SpotlightXcodeFinder: XcodeFinder {
    typealias Loader = FileSystemDataLoader
    let dataLoader: FileSystemDataLoader = FileSystemDataLoader()

    public init() {}

    public func findXcodes() -> [Application] {
        let process = Process()
        process.launchPath = "/usr/bin/mdfind"
        process.arguments = ["kMDItemCFBundleIdentifier == 'com.apple.dt.Xcode'"]

        let pipe = Pipe()
        process.standardOutput = pipe
        process.launch()

        let readHandle = pipe.fileHandleForReading
        let data = readHandle.readDataToEndOfFile()

        guard let output = String(data: data, encoding: .utf8) else {
            return []
        }

        return output
            .split(separator: "\n")
            .map(String.init)
            .map(URL.init(fileURLWithPath:))
            .map { Application(path: $0, dataLoader: dataLoader) }
    }

}

