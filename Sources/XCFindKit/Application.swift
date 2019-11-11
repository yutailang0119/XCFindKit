import Foundation

public struct Application {
    public let path: URL
    public let version: Version?

    init(path: URL, dataLoader: DataLoader) {
        self.path = path
        let versionPlistPath = path
            .appendingPathComponent("Contents")
            .appendingPathComponent("version.plist")
        self.version = Version(from: versionPlistPath, dataLoader: dataLoader)
    }

    /// Covert version to sortable version
    /// 10.2 -> 102
    var versionCode: Int? {
        return version?.identifier
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
    public struct Version: Decodable {
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
