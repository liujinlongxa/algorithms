//
//  LinkedList.swift
//  DataStructure
//
//  Created by Liujinlong on 2018/8/9.
//  Copyright © 2018 lazyaudio. All rights reserved.
//

import Foundation

enum LinkedListError: Error {
    case indexOutOfRange
}

class LinkedList<E: Equatable> {
    class Node {
        public var e: E?;
        public var next: Node?;
        init(e: E?, next: Node?) {
            self.e = e
            self.next = next
        }
        
        convenience init(next: Node) {
            self.init(e: nil, next: next)
        }
        
        convenience init() {
            self.init(e: nil, next: nil)
        }
    }
    
    struct LinkedListIterator: IteratorProtocol {
        typealias Element = E
        var head: Node?
        mutating func next() -> E? {
            if let next = head?.next {
                head = head?.next
                return next.e
            } else {
                return nil
            }
        }
    }
    
    private var dummyHead: Node?
    private var size: Int
    
    init() {
        dummyHead = Node.init()
        size = 0
    }
    
    required init(arrayLiteral elements: E...) {
        dummyHead = Node.init()
        var prev = dummyHead
        for e in elements {
            let node = Node.init(e: e, next: nil)
            prev?.next = node
            prev = prev?.next
        }
        size = elements.count
    }

    func getSize() -> Int {
        return size
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    func addFirst(e: E) {
        return try! add(index: 0, e: e)
    }
    
    func addLast(e: E) {
        return try! add(index: size, e: e)
    }
    
    func add(index: Int, e: E) throws {
        guard checkIndex(index: index) else {
            throw LinkedListError.indexOutOfRange
        }
        
        var prev = dummyHead
        for _ in 0..<index {
            prev = prev?.next
        }
        prev?.next = Node.init(e: e, next: prev?.next)
        size += 1
    }
    
    func get(index: Int) throws -> E? {
        guard checkIndex(index: index) else {
            throw LinkedListError.indexOutOfRange
        }
        
        var prev = dummyHead
        for _ in 0..<index {
            prev = prev?.next
        }
        return prev?.next?.e
    }
    
    func getFirst() throws -> E? {
        return try get(index: 0)
    }
    
    func getLast() throws -> E? {
        return try get(index: size - 1)
    }
    
    func set(index: Int, e: E) throws  {
        guard checkIndex(index: index) else {
            throw LinkedListError.indexOutOfRange
        }
        
        var temp = dummyHead
        for _ in 0...index {
            temp = temp?.next
        }
        temp?.e = e
    }
    
    func contains(e: E) -> Bool {
        var temp = dummyHead?.next
        while temp != nil {
            if temp?.e == e {
                return true
            }
            temp = temp?.next
        }
        return false
    }
    
    func remove(index: Int) throws -> E? {
        guard checkIndex(index: index) else {
            throw LinkedListError.indexOutOfRange
        }
        
        if index == 0 {
            let removeNode = dummyHead?.next
            let ret = removeNode?.e
            dummyHead?.next = dummyHead?.next?.next
            removeNode?.next = nil
            size -= 1
            return ret
        }
        
        var prev = dummyHead
        for _ in 0..<index {
            prev = prev?.next
        }
        let ret = prev?.next?.e
        let removeNode = prev?.next
        prev = prev?.next?.next
        removeNode?.next = nil
        size -= 1
        return ret
    }
    
    func removeFirst() throws -> E? {
        return try remove(index: 0)
    }
    
    func removeLast() throws -> E? {
        return try remove(index: size - 1)
    }
    
    func removeElement(e: E) {
        var prev = dummyHead
        while prev?.next != nil {
            if let e1 = prev?.next?.e, e1 == e {
                let removeNode = prev?.next
                prev?.next = prev?.next?.next
                removeNode?.next = nil
                break
            }
            prev = prev?.next
        }
        size -= 1
    }
    
    private func checkIndex(index: Int) -> Bool {
        if index < 0 || index > size {
            return false
        }
        return true
    }

}

extension LinkedList: CustomStringConvertible {
    var description: String {
        var ret = ""
        var prev = dummyHead?.next
        while prev != nil {
            if let e = prev?.e {
                if prev?.next == nil {
                    ret += "\(e)"
                } else {
                    ret += "\(e)->"
                }
            }
            prev = prev?.next
        }
        return ret
    }
}

extension LinkedList: Sequence {
    __consuming func makeIterator() -> LinkedListIterator {
        return LinkedListIterator(head: self.dummyHead)
    }
}

extension LinkedList: ExpressibleByArrayLiteral {}
