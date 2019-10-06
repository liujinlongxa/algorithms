//
//  Problem#7.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/10/6.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

struct StackQueue<Element: CustomStringConvertible & Equatable>: Queue {
    typealias E = Element
    private var stack1 = ArrayStack<Element>()
    private var stack2 = ArrayStack<Element>()
    func getSize() -> Int {
        return stack1.getSize() + stack2.getSize()
    }
    
    func isEmpty() -> Bool {
        return getSize() == 0
    }
    
    func enqueue(e: Element) {
        stack1.push(e: e)
    }
    
    func dequeue() throws -> Element {
        while !stack1.isEmpty() {
            if let e = stack1.pop() {
                stack2.push(e: e)
            }
        }
        if let e = stack2.pop() {
            return e
        } else {
            throw ArrayError.indexOutOfRange
        }
    }
    
    func getFront() throws -> Element {
        return try stack2.peek()
    }
}
