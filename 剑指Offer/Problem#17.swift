//
//  Problem#17.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/10/20.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

// 合并两个排序的链表
extension LinkedList {
    func merge(_ other: LinkedList<E>) -> LinkedList<E> {
//        guard self.dummyHead?.next != nil else {
//            return other
//        }
//
//        guard other.dummyHead?.next != nil else {
//            return self
//        }
        
        var head = dummyHead?.next
        var otherHead = other.dummyHead?.next
        let newList = LinkedList<E>()
        while head != nil && otherHead != nil {
            if let value = head?.e, let otherValue = otherHead?.e {
                if value > otherValue {
                    newList.addLast(e: otherValue)
                    otherHead = otherHead?.next
                } else if otherValue >= value {
                    newList.addLast(e: value)
                    head = head?.next
                }
            }
        }
        
        if head == nil {
            while otherHead != nil {
                if let value = otherHead?.e {
                    newList.addLast(e: value)
                    otherHead = otherHead?.next
                }
            }
        } else if otherHead == nil {
            while head != nil {
                if let value = head?.e {
                    newList.addLast(e: value)
                    head = head?.next
                }
            }
        }
        
        return newList
    }
}
