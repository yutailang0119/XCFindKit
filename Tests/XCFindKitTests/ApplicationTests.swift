import Foundation
import XCTest
@testable import XCFindKit

final class ApplicationTests: XCTestCase {

    func testV11() {
        let version = "11"
        let dataLoader: DataLoader = TestingDataLoader(versions: [version])
        let xcodePath = makeXcodeURL(from: version)
        let application = Application(path: xcodePath, dataLoader: dataLoader)
        XCTAssertEqual(application.versionCode, 11)
    }

    func testV11_0() {
        let version = "11.0"
        let dataLoader: DataLoader = TestingDataLoader(versions: [version])
        let xcodePath = makeXcodeURL(from: version)
        let application = Application(path: xcodePath, dataLoader: dataLoader)
        XCTAssertEqual(application.versionCode, 110)
    }

    func testV11_2_1() {
        let version = "11.2.1"
        let dataLoader: DataLoader = TestingDataLoader(versions: [version])
        let xcodePath = makeXcodeURL(from: version)
        let application = Application(path: xcodePath, dataLoader: dataLoader)
        XCTAssertEqual(application.versionCode, 1121)
    }

}
