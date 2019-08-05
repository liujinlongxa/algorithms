//
//  104. Maximum Depth of Binary Tree.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/8/5.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

func maxDepth(_ root: TreeNode?) -> Int {
    guard let root = root else {
        return 0
    }
    
    return 1 + max(maxDepth(root.left), maxDepth(root.right))
}
