//
//  Problem#13.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/10/13.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

/// 在O(1)的时间内删除链表节点
extension LinkedList {
    func remove(node: LinkedList.Node) {
        
        guard let headNode = dummyHead?.next else {
            return
        }
        
        if node === headNode {
            dummyHead?.next = nil
            return
        }
        
        if node.next == nil {
            var temp = dummyHead?.next
            while temp?.next !== node {
                temp = temp?.next
            }
            temp?.next = nil
        } else {
            node.e = node.next?.e
            node.next = node.next?.next
        }
    
    }
}
