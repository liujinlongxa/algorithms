//
//  Problem#15.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/10/15.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

extension LinkedList {
    func kthToTail(k: Int) -> E? {
        
        guard let head = self.dummyHead?.next else {
            return nil
        }
        
        guard k > 0 else {
            return nil
        }
        
        var pAhead: LinkedList.Node? = head
        var pBehind: LinkedList.Node? = head
        var step = 1
        while pAhead?.next != nil {
            pAhead = pAhead?.next
            step += 1
            if step > k {
                pBehind = pBehind?.next
            }
        }

        guard pBehind !== head else {
            return nil
        }
        
        return pBehind?.e
    }
}
