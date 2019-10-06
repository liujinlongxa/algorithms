//
//  Array.swift
//  DataStructure
//
//  Created by Liujinlong on 2018/8/6.
//  Copyright © 2018 lazyaudio. All rights reserved.
//

import Foundation

protocol ArrayProtocol {
    associatedtype E: Equatable & CustomStringConvertible
    func getSize() -> Int
    func isEmpty() -> Bool
    func addLast(e: E)
    func addFirst(e: E)
    func add(index: Int, e: E)
    func get(index: Int) throws -> E
    func getLast() throws -> E
    func getFirst() throws -> E
    func set(index: Int, e: E) throws
    func contains(e: E) -> Bool
    func find(e: E) -> Int
    func remove(index: Int) throws -> E
    func remove(e: E) throws -> Bool
    func removeFirst() throws -> E
    func removeLast() throws -> E
    func swap(i: Int, j: Int) throws
}

enum ArrayError: Error {
    case indexOutOfRange
}

class CustomArray<Element>: ArrayProtocol where Element: Equatable & CustomStringConvertible {

    private var data: [Element]

    init() {
        data = [Element]()
    }
    
    required init(arrayLiteral elements: Element...) {
        data = elements
    }
    
    init(data: [Element]) {
        self.data = data
    }
    
    func getSize() -> Int {
        return data.count
    }
    
    func isEmpty() -> Bool {
        return data.count == 0
    }
    
    func addLast(e: Element) {
        data.append(e)
    }
    
    func addFirst(e: Element) {
        data.insert(e, at: 0)
    }
    
    func add(index: Int, e: Element) {
        data.insert(e, at: index)
    }
    
    func get(index: Int) throws -> Element {
        if index < 0 || index >= data.count {
            throw ArrayError.indexOutOfRange
        }
        return data[index]
    }
    
    func getLast() throws -> Element {
        return try get(index: data.count - 1)
    }
    
    func getFirst() throws -> Element {
        return try get(index: 0)
    }
    
    func set(index: Int, e: Element) throws {
        if index < 0 || index >= data.count {
            throw ArrayError.indexOutOfRange
        }
        data[index] = e
    }
    
    func contains(e: Element) -> Bool {
        return data.contains(e)
    }
    
    func find(e: Element) -> Int {
        for i in 0...data.count {
            let item = data[i]
            if e == item {
                return i
            }
        }
        return -1
    }
    
    @discardableResult
    func remove(index: Int) throws -> Element {
        if index < 0 || index >= data.count {
            throw ArrayError.indexOutOfRange
        }
        return data.remove(at: index)
    }
    
    func remove(e: Element) throws -> Bool {
        var ret: Int = -1
        for i in 0...data.count {
            let item = data[i]
            if e == item {
                ret = i
                break
            }
        }
        if ret >= 0 {
            do {
                try remove(index: ret)
            } catch {
                throw ArrayError.indexOutOfRange
            }
            return true
        }
        return false
    }
    
    @discardableResult
    func removeFirst() throws -> Element {
        return try remove(index: 0)
    }
    
    @discardableResult
    func removeLast() throws -> Element {
        return try remove(index: data.count - 1)
    }
    
    func swap(i: Int, j: Int) throws {
        if i < 0 || i >= data.count || j < 0 || j > data.count {
            throw ArrayError.indexOutOfRange
        }
        let temp = data[i]
        data[i] = data[j]
        data[j] = temp
    }

    typealias E = Element

}

extension CustomArray: Sequence {
    func makeIterator() -> IndexingIterator<[Element]>{
        return data.makeIterator()
    }
}

extension CustomArray: CustomStringConvertible {
    var description: String {
        var ret = ""
        for item in data {
            ret += item.description
            ret += " "
        }
        return ret
    }
}

extension CustomArray: ExpressibleByArrayLiteral {
}

