import XCTest

import PragmaticsTests

var tests = [XCTestCaseEntry]()
tests += PragmaticsTests.allTests() // Pragmatics tests

tests += ChecksumTests.allTests() // Checksum tests

XCTMain(tests)
