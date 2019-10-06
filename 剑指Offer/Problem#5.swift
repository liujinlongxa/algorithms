//
//  Problem#5.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/10/6.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

func jzOfferP5(list: LinkedList<Int>) {
    let stack = ArrayStack<Int>()
    for i in list {
        stack.push(e: i)
    }
    
    for _ in 0..<stack.getSize() {
        if let p = stack.pop() {
            print(p)
        }
    }
}
