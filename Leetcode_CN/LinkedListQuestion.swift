//
//  LinkedListQuestion.swift
//  Algorithm
//
//  Created by 刘晋龙 on 2020/5/15.
//  Copyright © 2020 com.ljl. All rights reserved.
//

import Foundation

struct LinkedListQuestion {
    
    /// 141. 环形链表
    /// https://leetcode-cn.com/problems/linked-list-cycle/
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
    
    /// 2. 两数相加
    /// https://leetcode-cn.com/problems/add-two-numbers/
    func addTwoNumbers(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        var newList: ListNode?

        var temp1 = l1, temp2 = l2
        var flag = 0 // 进位
        while temp1 != nil || temp2 != nil {
            let num1 = temp1?.val ?? 0
            let num2 = temp2?.val ?? 0
            let sum = num1 + num2 + flag
            if sum >= 10 {
                let newNodeVal = sum % 10
                temp1?.val = newNodeVal
                temp2?.val = newNodeVal
                flag = 1
            } else {
                temp1?.val = sum
                temp2?.val = sum
                flag = 0
            }
            
            if temp1?.next == nil && temp2?.next == nil && flag == 1 {
                if temp1 != nil {
                    temp1?.next = ListNode(1)
                } else {
                    temp2?.next = ListNode(1)
                }
                flag = 0
            }
            
            newList = temp1 == nil ? l2 : l1
            temp1 = temp1?.next
            temp2 = temp2?.next
        }
        
        return newList
    }
    
    /// 21. 合并两个有序链表
    /// https://leetcode-cn.com/problems/merge-two-sorted-lists/
    func mergeTwoLists(_ l1: ListNode?, _ l2: ListNode?) -> ListNode? {
        guard let l1 = l1 else {
            return l2
        }
        
        guard let l2 = l2 else {
            return l1
        }
        
        var temp1: ListNode? = l1
        var temp2: ListNode? = l2
        let ret: ListNode? = ListNode(0) // 头结点
        var newList = ret
        
        while temp1 != nil && temp2 != nil {
            var val1 = (temp1?.val)!
            var val2 = (temp2?.val)!
            if val1 > val2 {
                newList?.next = ListNode(val2)
                temp2 = temp2?.next
            } else {
                newList?.next = ListNode(val1)
                temp1 = temp1?.next
            }
            newList = newList?.next
            
        }
        
        newList?.next = temp1 == nil ? temp2 : temp1
        
        return ret?.next
    }
}
