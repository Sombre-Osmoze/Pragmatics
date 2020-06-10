//
//  ChecksumTests.swift
//  ChecksumTests
//
//  Created by Marcus Florentin on 10/06/2020.
//

import Foundation

import XCTest
import class Foundation.Bundle

final class ChecksumTests: XCTestCase {
	func testExample() throws {
		// This is an example of a functional test case.
		// Use XCTAssert and related functions to verify your tests produce the correct
		// results.

		let file = url(named: "data", extention: "txt")

		let fooBinary = productsDirectory.appendingPathComponent("checksum")

		let process = Process()
		process.executableURL = fooBinary
		process.arguments = [file.path]

		let pipe = Pipe()
		process.standardOutput = pipe

		try process.run()
		process.waitUntilExit()

		let data = pipe.fileHandleForReading.readDataToEndOfFile()
		let output = String(data: data, encoding: .utf8)

		XCTAssertEqual(output,
					   "SHA256 digest: aefbd00d41f91991b65e5c175ba62baade41143263a28d813099ab2825b7031e\n")
	}

	/// Returns path to the built products directory.
	var productsDirectory: URL {
		#if os(macOS)
		for bundle in Bundle.allBundles where bundle.bundleIdentifier == "ChecksumTests" {
			print(bundle.debugDescription)
			return bundle.bundleURL.deletingLastPathComponent()
		}
		fatalError("couldn't find the products directory")
		#else
		return Bundle.main.bundleURL
		#endif
	}

	static var allTests = [
		("testExample", testExample),
	]
}

// MARK: - Tests Data

let testFolder : URL = {
	var url = URL(fileURLWithPath: #file)
	url.deletePathExtension()
	url.deleteLastPathComponent()
	url.appendPathComponent("Data")
	return url
}()

func url(named name: String, extention: String? = nil,
		 folder: URL = testFolder) -> URL {
	var url = folder
	url.appendPathComponent(name)
	if let extention = extention {
		url.appendPathExtension(extention)
	}
	return url
}
