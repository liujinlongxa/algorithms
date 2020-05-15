//
//  Tree.swift
//  Algorithm
//
//  Created by 刘晋龙 on 2020/5/14.
//  Copyright © 2020 com.ljl. All rights reserved.
//

import Foundation


struct TreeQuestion {
    
    /// 反转二叉树
    static func invertTree(_ root: TreeNode?) -> TreeNode? {
        guard root != nil else {
            return nil
        }
        
        let temp = invertTree(root?.left)
        root?.left = invertTree(root?.right)
        root?.right = temp
        
        return root
    }
}
