import XCTest
@testable import Pragmatics

final class PragmaticsTests: XCTestCase {
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct
        // results.
        XCTAssertEqual(Pragmatics().text, "Hello, World!")
    }

    static var allTests = [
        ("testExample", testExample),
    ]
}
