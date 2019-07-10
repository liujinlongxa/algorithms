//
//  20. Valid Parentheses.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/7/10.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

// MARK: - Solution1

func isValid1(_ s: String) -> Bool {
    var stack = [Character]()
    var map = [")": "(", "]": "[", "}": "{"]
    for c in s {
        if map.values.contains(String(c)) {
            stack.append(c)
        } else if let last = stack.last, map[String(c)] == String(last) {
            stack.removeLast()
        } else {
            return false
        }
    }
    return stack.isEmpty
}

// MARK: - Solution2

func isValid2(_ s: String) -> Bool {
    var stack = [Character]()
    var map = [")": "(", "]": "[", "}": "{"]
    for c in s {
        if map.values.contains(String(c)) {
            stack.push(c)
        } else if let last = stack.peek(), map[String(c)] == String(last) {
            stack.pop()
        } else {
            return false
        }
    }
    return stack.isEmpty
}

