//
//  Problem32.swift
//  Algorithm
//
//  Created by 刘晋龙 on 2020/5/14.
//  Copyright © 2020 com.ljl. All rights reserved.
//

import Foundation
 
func levelOrder(_ root: TreeNode?) -> [Int] {
    
    guard root != nil else {
        return []
    }
    
    var queue = [root]
    var result = [Int]()
    
    while queue.count > 0 {
        let node = queue.removeFirst()!
        result.append(node.val)
        
        if let left = node.left {
            queue.append(left)
        }
        if let right = node.right {
            queue.append(right)
        }
    }
    
    return result
}
