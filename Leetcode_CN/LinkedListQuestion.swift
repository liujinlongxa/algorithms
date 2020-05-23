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
    
    /// 237. 删除链表中的节点
    /// https://leetcode-cn.com/problems/delete-node-in-a-linked-list/
    func deleteNode(_ node: ListNode?) {
        guard let node = node else { return }
        
        if let next = node.next {
            node.val = next.val
            node.next = node.next?.next
        }
        
    }
    
    /// 面试题24. 反转链表；206. 反转链表
    /// https://leetcode-cn.com/problems/reverse-linked-list/
    /// https://leetcode-cn.com/problems/fan-zhuan-lian-biao-lcof/
    /// 递归方案
    func reverseList(_ head: ListNode?) -> ListNode? {
        guard head != nil && head?.next != nil else {
            return head
        }
        
        let temp = reverseList(head?.next)
        head?.next?.next = head
        head?.next = nil
        return temp
    }
    
    /// 面试题24. 反转链表；206. 反转链表
    /// https://leetcode-cn.com/problems/reverse-linked-list/
    /// https://leetcode-cn.com/problems/fan-zhuan-lian-biao-lcof/
    /// 非递归方案
    func reverseList2(_ head: ListNode?) -> ListNode? {
        guard head != nil && head?.next != nil else {
            return head
        }

        let dummyHead = ListNode(0)
        var head = head
        while head != nil {
            let temp = head?.next
            head?.next = dummyHead.next
            dummyHead.next = head
            head = temp
        }
        
        return dummyHead.next
    }
}
