partial-swift
=============

partial application (currying) for Swift

## Features

- Partial application for the normal functions
- lazy evalution

## Simple Usage

```swift
func add(a: Int, b: Int -> Int {
    return a + b
}

let add1 = partial(add, 1) //< partial application
add1(2) //< 3
```

## Lazy Evalution

```swift
let addSomething100 = partial(add, something(100)) //< something() is not evaluated at this time

addSomething100(10) //< something() is evaluated!
```

## Restriction

- It have only supports the functions that has 1...3 arguments
