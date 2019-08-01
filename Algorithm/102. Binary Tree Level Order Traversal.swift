//
//  102. Binary Tree Level Order Traversal.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/8/1.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

func levelOrder(_ root: TreeNode?) -> [[Int]] {
    guard let root = root else {
        return []
    }
    
    var queue = [root]
    var ret = [[Int]]()
    
    while queue.count > 0 {
        var temp = [Int]()
        var nextLevel = [TreeNode]()
        
        for node in queue {
            temp.append(node.val)
            if let left = node.left {
                nextLevel.append(left)
            }
            if let right = node.right {
                nextLevel.append(right)
            }
        }
        
        ret.append(temp)
        queue = nextLevel
    }
    
    return ret
}
