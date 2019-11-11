import Foundation

public struct Application {
    public let path: URL
    private let _version: Version?

    init(path: URL, dataLoader: DataLoader) {
        self.path = path
        let versionPlistPath = path
            .appendingPathComponent("Contents")
            .appendingPathComponent("version.plist")
        self._version = Version(from: versionPlistPath, dataLoader: dataLoader)
    }

    var version: String? {
        _version?.identifier
    }

    /// Covert version to sortable version
    /// 10.2 -> 102
    var versionCode: Int? {
        return version?
            .split(separator: ".")
            .map(String.init)
            .compactMap(Int.init)
            .reversed()
            .enumerated()
            .reduce(into: 0) { (result: inout Int, element: (Int, Int)) in
                result += Int(pow(10.0, Double(element.0))) * element.1
        }
    }

}

extension Application {
    private struct Version: Decodable {
        let identifier: String

        init?(from versionPlistPath: URL, dataLoader: DataLoader) {
            let decoder = PropertyListDecoder()
            do {
                let data = try dataLoader.load(from: versionPlistPath)
                self = try decoder.decode(Application.Version.self, from: data)
            } catch {
                return nil
            }
        }

        private enum CodingKeys: String, CodingKey {
            case identifier = "CFBundleShortVersionString"
        }
    }
}
