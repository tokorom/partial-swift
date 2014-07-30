//
//  partial_swiftTests.swift
//  partial-swiftTests
//
//  Created by ytokoro on 7/30/14.
//  Copyright (c) 2014 tokoro. All rights reserved.
//

import UIKit
import XCTest

func add(a: Int, b: Int) -> Int {
    return a + b
}
    
class partial_swiftTests: XCTestCase {

    private func substract(a: Int, b: Int) -> Int {
        return a - b
    }

    private class func add(a: Int, b: Int) -> Int {
        return a + b
    }

    func testPartialToFunction() {
        let add1 = partial(add, 1)
        XCTAssertEqual(2, add1(1), "add1(1) is failed")
        XCTAssertEqual(3, add1(2), "add1(2) is failed")
    }

    func testPartialToInstanceMethod() {
        let substract10 = partial(self.substract, 10)
        XCTAssertEqual(9, substract10(1), "substract10(1) is failed")
        XCTAssertEqual(-10, substract10(20), "substract10(20) is failed")
    }
    
    func testPartialToClassMethod() {
        let add10 = partial(partial_swiftTests.add, 10)
        XCTAssertEqual(11, add10(1), "add10(1) is failed")
        XCTAssertEqual(12, add10(2), "add10(2) is failed")
    }

    func testPartialWithLazy() {
        class Stub {
            var times = 0
            func call() -> Int {
                ++self.times
                return self.times
            }
        }

        let stub = Stub()
        XCTAssertEqual(0, stub.times, "stub.times is invalid")
        XCTAssertEqual(1, stub.call(), "stub.call() is invalid")
        XCTAssertEqual(2, stub.call(), "stub.call() is invalid")

        let add3 = partial(partial_swiftTests.add, stub.call())
        XCTAssertEqual(2, stub.times, "stub.times is invalid")

        XCTAssertEqual(4, add3(1), "add3(1) is failed")
    }

    func test3Args() {
        func add3Ints(a: Int, b: Int, c: Int) -> Int {
            return a + b + c
        }

        let add1 = partial(add3Ints, 1)
        XCTAssertEqual(6, add1(2, 3), "add1(2, 3) is failed")

        let add1and2 = partial(add1, 2)
        XCTAssertEqual(6, add1and2(3), "add1and2(3) is failed")
    }

    func test3ArgsWith2Args() {
        func add3Ints(a: Int, b: Int, c: Int) -> Int {
            return a + b + c
        }

        let add1and2 = partial(add3Ints, 1, 2)
        XCTAssertEqual(6, add1and2(3), "add1and2(3) is failed")
    }

    func test4Args() {
        func add4Ints(a: Int, b: Int, c: Int, d: Int) -> Int {
            return a + b + c + d
        }

        let add1 = partial(add4Ints, 1)
        XCTAssertEqual(10, add1(2, 3, 4), "add1(2, 3, 4) is failed")

        let add1and2 = partial(add4Ints, 1, 2)
        XCTAssertEqual(10, add1and2(3, 4), "add1and2(3, 4) is failed")

        let add1and2and3 = partial(add4Ints, 1, 2, 3)
        XCTAssertEqual(10, add1and2and3(4), "add1and2and3(4) is failed")
    }
}
