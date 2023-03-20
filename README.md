# Test Expectation Dispatch

A small Swift package which publicly extends `XCTestCase` with a convenience function to wait for the completion of code blocks which were dispatched ot the main thread before continueing with tests.

## What Problem Does It Solve?

Let's assume there is a function under test which dispatches a code block onto the main thread.

```swift
func myFunction() {
    DispatchQueue.main.async {
        codeBlockWasExecuted = true
    }
}
```

When calling this function in a unit test, the test would complete and assertions following the function call fail because the block has not been executed yet.

```swift
func testMyFunction() {
    myFunction()
    XCTAssertTrue(codeBlockWasExecuted) // This fails because the dispatched block was not called yet.
}
```

A popular solution is to use expectations which are a feature already available through `XCTestCase`.
This package does nothing else but wraps it in a convenient function call.
I just got tired of writing the same boilerplate code over and over again.
So, when calling `myFunction` in tests, then only the convenience function provided by this package must be called after calling the function under test.

```swift
func testMyFunction() {
    myFunction()
    waitForTasksDispatchedToMainQueue()
    XCTAssertTrue(codeBlockWasExecuted) // Succeeds because the dispatched block is called before this.
}
```

## License

See [LICENSE](LICENSE.md) document.
