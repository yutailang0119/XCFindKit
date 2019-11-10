import XCTest
@testable import XCFindKit

final class XCFindKitTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(XCFindKit().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
