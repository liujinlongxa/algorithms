//
//  Stack.swift
//  DataStructure
//
//  Created by Liujinlong on 2018/8/8.
//  Copyright © 2018 lazyaudio. All rights reserved.
//

import Foundation

protocol Stack {
    associatedtype E
    func getSize() -> Int
    func isEmpty() -> Bool
    func push(e: E)
    func pop() -> E?
    func peek() throws -> E
}
