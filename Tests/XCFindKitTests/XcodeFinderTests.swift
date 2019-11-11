import Foundation
import XCTest
@testable import XCFindKit

final class XcodeFinderTests: XCTestCase {

    func testFindXcodes() {
        let versions = ["11", "11.0", "11.1", "11.2", "11.2.1"]
        let finder = TestingXcodeFinder(versions)
        let xcodes = finder.findXcodes()
        let result = xcodes
            .filter { $0.version != nil }
            .sorted { $0.versionCode! < $1.versionCode! }
            .reduce(into: [:]) { $0[$1.version!.identifier] = $1.path.path }
        XCTAssertEqual(
            result,
            [
                "11": "/Applications/Xcode-11.app",
                "11.0": "/Applications/Xcode-11.0.app",
                "11.1": "/Applications/Xcode-11.1.app",
                "11.2": "/Applications/Xcode-11.2.app",
                "11.2.1": "/Applications/Xcode-11.2.1.app",
            ]
        )
    }

    func testMajorVersion() {
        let version = "11"
        let finder = TestingXcodeFinder([version])
        let xcode = finder.find(version)
        XCTAssertEqual(xcode?.path.path, "/Applications/Xcode-\(version).app")
    }

    func testExactMatch() {
        let version = "11.2.1"
        let finder = TestingXcodeFinder([version])
        let xcode = finder.find(version)
        XCTAssertEqual(xcode?.path.path, "/Applications/Xcode-\(version).app")
    }

    func testMultipleMinors() {
        let versions = ["11.0", "11.1", "11.2", "11.2.1"]
        let finder = TestingXcodeFinder(versions)
        let xcode = finder.find("11")
        XCTAssertEqual(xcode?.path.path, "/Applications/Xcode-11.2.1.app")
    }

}
