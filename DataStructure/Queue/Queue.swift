//
//  Queue.swift
//  DataStructure
//
//  Created by Liujinlong on 2018/8/8.
//  Copyright © 2018 lazyaudio. All rights reserved.
//

import Foundation

protocol Queue {
    associatedtype E
    func getSize() -> Int
    func isEmpty() -> Bool
    func enqueue(e: E)
    func dequeue() throws -> E
    func getFront() throws -> E
}
