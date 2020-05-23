//
//  LinkedListQuestion.swift
//  Algorithm
//
//  Created by 刘晋龙 on 2020/5/15.
//  Copyright © 2020 com.ljl. All rights reserved.
//

import Foundation

struct LinkedListQuestion {
    
    func hasCycle(_ head: ListNode?) -> Bool {
        
        guard head != nil, head?.next != nil else {
            return false
        }
        
        var fast = head, slow = head
        
        while slow != nil && fast != nil {
            fast = fast?.next?.next
            slow = slow?.next
            if fast === slow {
                return true
            }
        }
        
        return false
    }
    
    func isPalindrome(_ head: ListNode?) -> Bool {
        guard head != nil, head?.next != nil else {
            return true
        }
        
        var slow = head, fast = head
        while fast != nil {
            slow = slow?.next
            if fast?.next == nil || fast?.next?.next == nil {
                break
            } else {
                fast = fast?.next?.next
            }
        }
        
        var cur = slow?.next
        var prev: ListNode? = nil
        while prev != nil {
            let temp = cur?.next
            cur?.next = prev
            prev = cur
            cur = temp
        }
        

        slow = slow?.next
        if slow == nil {
            return false
        }
        
        var temp = head
        while slow != nil {
            if slow?.val != temp?.val {
                return false
            }
            slow = slow?.next
            temp = temp?.next
        }
        
        return true
    }
}
