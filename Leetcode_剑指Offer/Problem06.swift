//
//  Problem06.swift
//  Algorithm
//
//  Created by 刘晋龙 on 2020/5/12.
//  Copyright © 2020 com.ljl. All rights reserved.
//

import Foundation
func reversePrint(_ head: LinkedList<Int>.Node?) -> [Int] {
    
    guard let head = head else {
        return []
    }

    let dummyHead = LinkedList<Int>.Node()
    var tmp: LinkedList<Int>.Node? = head
    var ret = [Int]()
    
    while tmp != nil {
        let node = LinkedList<Int>.Node()
        node.e = tmp!.e
        node.next = dummyHead.next
        dummyHead.next = node
        tmp = tmp?.next
    }
    
    tmp = dummyHead.next
    while tmp != nil {
        ret.append(tmp!.e!)
        tmp = tmp?.next
    }
    
    return ret
}
