//
//  111. Minimum Depth of Binary Tree.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/8/5.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation
func minDepth(_ root: TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }
    
    let left = minDepth(root.left)
    let right = minDepth(root.right)
    return left == 0 || right == 0 ? (left + right + 1) : min(left, right) + 1
}
