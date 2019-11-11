import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(ApplicationTests.allTests),
        testCase(XcodeFinderTests.allTests),
    ]
}
#endif
