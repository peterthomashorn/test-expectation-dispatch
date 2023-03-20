import XCTest

extension XCTestCase {
    ///
    /// Dispatches fulfillments of `XCTestExpectation` to the main dispatch queue and waits for them.
    ///
    /// This is supposed to be called after calling a function under test which dispatches tasks to the main dispatch queue.
    /// Otherwise tests would likely fail due to race conditions.
    /// Assertions would be executed and fail before the code under test has been executed.
    ///
    /// Because some functions under test dispatch asynchronous tasks which themselves dispatch asynchronous code two iterations of expectation dispatches are necessary.
    ///
    func waitForTasksDispatchedToMainQueue() {
        for _ in 1...2 {
            let expectation = expectation(description: UUID().uuidString)

            // Because this dispatch is called after the code under test, it is added to the end of the main dispatch queue.
            DispatchQueue.main.async {
                // When the expectation is fulfilled, it can be assumed that all tasks dispatched by the code under test have completed.
                expectation.fulfill()
            }

            wait(for: [expectation], timeout: 1)
        }
    }
}
