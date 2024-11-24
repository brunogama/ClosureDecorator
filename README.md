# Closure Decorator

Just a experiment using swift parameter packs that wraps a closure with another closure.

## Usage

### Sample 1

```swift

let operation: (Int, Int) -> Int = { $0 + $1 }

let decoratedOperation = ClosureDecorator.decorate(operation) { closure, valueA, valueB in
    let injectedValueA = valueA + 1
    let injectedValueB = valueB + 1
    
    return closure(injectedValueA, injectedValueB)
}

let result = decoratedOperation(1, 2)

print("Result: \(result)") // Prints 5

```

### Sample 2

```swift
struct EquatableTypeHandler {
    let canHandle: (Any, Any) -> Bool
    let areEqual: (Any, Any) -> Bool

    init(
        canHandle: @escaping (Any, Any) -> Bool,
        areEqual: @escaping (Any, Any) -> Bool
    ) {
        self.canHandle = ClosureDecorator.decorate(canHandle) { closure, a, b in
            print("🚨 Checking if can handle ")
            // Perform more stuff 
            return closure(a, b)
        }

        self.areEqual = ClosureDecorator.decorate(canHandle) { closure, a, b in
            print("🚨 Checking if are equal ")
            // Perform more stuff 
            return closure(a, b)
        }
    }
}
```

