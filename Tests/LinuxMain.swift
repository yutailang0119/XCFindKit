import XCTest

import XCFindKitTests

var tests = [XCTestCaseEntry]()
tests += ApplicationTests.allTests()
tests += XcodeFinderTests.allTests()
XCTMain(tests)
