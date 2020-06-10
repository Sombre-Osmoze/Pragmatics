//
//  XCTestManifests.swift
//  ChecksumTests
//
//  Created by Marcus Florentin on 10/06/2020.
//

import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
	return [
		testCase(ChecksumTests.allTests),
	]
}
#endif
