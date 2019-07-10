//
//  155. Min Stack.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/7/10.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation
class MinStack {
    
    /** initialize your data structure here. */
    private var stack: [Int]
    private var minStack: [Int]
    init() {
        stack = [Int]()
        minStack = [Int]()
    }
    
    func push(_ x: Int) {
        stack.append(x)
        if (minStack.isEmpty) {
            minStack.push(x)
        } else {
            minStack.push(min(x, minStack.peek()!))
        }
    }
    
    func pop() {
        stack.pop()
        minStack.pop()
    }
    
    func top() -> Int {
        return stack.peek() ?? 0
    }
    
    func getMin() -> Int {
        return minStack.peek() ?? 0
    }
}

extension Array {
    mutating func push(_ element: Element) {
        self.append(element)
    }
    
    @discardableResult
    mutating func pop() -> Element {
        return self.removeLast()
    }
    
    func peek() -> Element? {
        return self.last
    }
}

/**
 * Your MinStack object will be instantiated and called as such:
 * let obj = MinStack()
 * obj.push(x)
 * obj.pop()
 * let ret_3: Int = obj.top()
 * let ret_4: Int = obj.getMin()
 */
