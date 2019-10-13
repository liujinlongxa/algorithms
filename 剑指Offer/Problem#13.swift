//
//  Problem#13.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/10/13.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

extension LinkedList {
    func remove(node: LinkedList.Node) {
        
        guard let headNode = dummyHead?.next else {
            return
        }
        
        if node === headNode {
            dummyHead?.next = nil
            return
        }
        
        node.e = node.next?.e
        node.next = node.next?.next
    }
}
