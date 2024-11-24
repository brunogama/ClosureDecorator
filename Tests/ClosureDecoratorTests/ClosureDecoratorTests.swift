import Testing

@testable import ClosureDecorator

@Test func test() async throws {
    let operation: (Int, Int) -> Int = { $0 + $1 }

    let decoratedOperation = ClosureDecorator.decorate(operation) { closure, valueA, valueB in
        let injectedValueA = valueA + 1
        let injectedValueB = valueB + 1

        return closure(injectedValueA, injectedValueB)
    }

    let result = decoratedOperation(1, 2)

    #expect(result == 5)
}
