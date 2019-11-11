import Foundation
import XCFindKit

func makeXcodeURL(from versionString: String) -> URL {
    return URL(fileURLWithPath: "/Applications")
        .appendingPathComponent("Xcode-\(versionString).app")
}

final class TestingDataLoader: DataLoader {

    private let dataMap: [URL: Data]

    init(versions: [String]) {
        func makePlistURL(from versionString: String) -> URL {
            return makeXcodeURL(from: versionString)
                .appendingPathComponent("Contents")
                .appendingPathComponent("version.plist")
        }
        func makeData(from versionString: String) -> Data {
            struct Version: Encodable {
                let version: String
                enum CodingKeys: String, CodingKey {
                    case version = "CFBundleShortVersionString"
                }
            }
            let encoder = PropertyListEncoder()
            let version = Version(version: versionString)
            return try! encoder.encode(version)
        }

        self.dataMap = versions.reduce(into: [:]) {
            let key = makePlistURL(from: $1)
            let data = makeData(from: $1)
            $0[key] = data
        }
    }

    func load(from path: URL) throws -> Data {
        return dataMap[path]!
    }
}
