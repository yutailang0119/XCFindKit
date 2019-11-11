import Foundation
@testable import XCFindKit

class TestingXcodeFinder: XcodeFinder {
    let dataLoader: DataLoader

    private let xcodes: [Application]

    init(_ xcodes: [String]) {
        let dataLoader = TestingDataLoader(versions: xcodes)
        self.dataLoader = dataLoader
        self.xcodes = xcodes
            .map(makeXcodeURL(from:))
            .map { Application(path: $0, dataLoader: dataLoader) }
    }

    func findXcodes() -> [Application] {
        return xcodes
    }
}
