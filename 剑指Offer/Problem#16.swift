//
//  Problem#16.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/10/15.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

extension LinkedList {
    func myReversed() -> LinkedList.Node? {
        guard let head = dummyHead?.next else {
            return dummyHead
        }
        
        var node: LinkedList.Node? = head
        while node != nil {
            
            if node?.next == nil {
                node?.next = dummyHead?.next
                dummyHead?.next = node
                break
            }
            
            let next = node?.next
            if node !== head {
                node?.next = dummyHead?.next
            }
            
            dummyHead?.next = next
            let newNode = next?.next
            next?.next = node
            if node === head {
                node?.next = nil
            }
            node = newNode
            
        }
        
        return dummyHead
    }
}
