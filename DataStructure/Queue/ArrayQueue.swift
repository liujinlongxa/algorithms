//
//  ArrayQueue.swift
//  DataStructure
//
//  Created by Liujinlong on 2018/8/8.
//  Copyright © 2018 lazyaudio. All rights reserved.
//

import Foundation

class ArrayQueue<Element: CustomStringConvertible & Equatable>: Queue, CustomStringConvertible {
    
    typealias E = Element
    private let data: CustomArray<Element>
    
    init() {
        data = CustomArray<Element>()
    }
    
    func getSize() -> Int {
        return data.getSize()
    }
    
    func isEmpty() -> Bool {
        return data.isEmpty()
    }
    
    func enqueue(e: Element) {
        data.addLast(e: e)
    }
    
    func dequeue() throws -> Element {
        return try data.removeFirst()
    }
    
    func getFront() throws -> Element {
        return try data.getFirst()
    }
    
    var description: String {
        var ret = ""
        for index in 0..<data.getSize() {
            do {
                let item = try data.get(index: index)
                if index == data.getSize() - 1 {
                    ret += "\(item)"
                } else {
                    ret += "\(item)->"
                }
            } catch {
                print("error")
            }
        }
        return ret
    }
    
}
