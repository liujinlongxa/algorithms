//
//  98. Validate Binary Search Tree.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/7/23.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

public class TreeNode {
    public var val: Int
    public var left: TreeNode?
    public var right: TreeNode?
    public init(_ val: Int) {
        self.val = val
        self.left = nil
        self.right = nil
    }
}

func isValidBST(_ root: TreeNode?) -> Bool {
    let array = inOrder(root)
    if array.count <= 1 {
        return true
    }
    
    for idx in 0..<array.count - 1 {
        if array[idx] >= array[idx + 1] {
            return false
        }
    }
    return true
}

func inOrder(_ root: TreeNode?) -> [Int] {
    guard let root = root else {
        return []
    }
    
    return inOrder(root.left) + [root.val] + inOrder(root.right)
}
