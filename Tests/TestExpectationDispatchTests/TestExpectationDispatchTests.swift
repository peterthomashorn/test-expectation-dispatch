import XCTest
@testable import TestExpectationDispatch

final class TestExpectationDispatchTests: XCTestCase {
    func testCodeBlockWasExecutedBeforeWaitFunction() throws {
        var codeBlockWasExecuted = false

        DispatchQueue.main.async {
            codeBlockWasExecuted = true
        }

        waitForTasksDispatchedToMainQueue()

        XCTAssertTrue(codeBlockWasExecuted)
    }

    func testCodeBlockWasNotExecutedBeforeAssertionWithoutWaitFunction() throws {
        var codeBlockWasExecuted = false

        DispatchQueue.main.async {
            codeBlockWasExecuted = true
        }

        XCTAssertFalse(codeBlockWasExecuted)
    }
}
