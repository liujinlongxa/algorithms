//
//  Tree.swift
//  Algorithm
//
//  Created by 刘晋龙 on 2020/5/14.
//  Copyright © 2020 com.ljl. All rights reserved.
//

import Foundation


struct TreeQuestion {
    
    func test() {
        print(self.sortedArrayToBST([-10,-3,0,5,9]))
    }
    
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
    
    /// 最大深度
    func maxDepth(_ root: TreeNode?) -> Int {
        if root == nil {
            return 0
        }
        
        return max(maxDepth(root?.left) + 1, maxDepth(root?.right) + 1)
    }
    
    /// 验证二叉树
    func isValidBST(_ root: TreeNode?) -> Bool {
        
        func helper(_ node: TreeNode?, lower: Int?, upper: Int?) -> Bool {
            guard let node = node else {
                return true
            }
            
            let val = node.val
            if lower != nil && val <= lower! {
                return false
            }

            if upper != nil && val >= upper! {
                return false
            }
            
            if !helper(node.right, lower: val, upper: upper) {
                return false
            }
            
            if !helper(node.left, lower: lower, upper: val) {
                return false
            }
            
            return true
            
        }
        
        return helper(root, lower: nil, upper: nil)
        
    }
    
    /// 对称二叉树
    func isSymmetric(_ root: TreeNode?) -> Bool {
        func helper(leftNode: TreeNode?, rightNode: TreeNode?) -> Bool {
            if leftNode == nil && rightNode == nil {
                return true
            }
            
            if let left = leftNode?.val, let right = rightNode?.val, left == right {
                return helper(leftNode: leftNode?.left, rightNode: rightNode?.right) &&
                    helper(leftNode: leftNode?.right, rightNode: rightNode?.left)
            }
            
            return false
            
        }
        
        return helper(leftNode: root?.left, rightNode: root?.right)
    }
    
    /// 层序遍历
    func levelOrder(_ root: TreeNode?) -> [[Int]] {
        guard let root = root else {
            return []
        }
        
        var result = [[Int]]()
        var levels = [root]
        
        while levels.count > 0 {
            var temp = [Int]()
            var tempNodes = [TreeNode]()
            for i in 0..<levels.count {
                let node = levels[i]
                temp.append(node.val)
                if let leftNode = node.left {
                    tempNodes.append(leftNode)
                }
                if let rightNode = node.right {
                    tempNodes.append(rightNode)
                }
            }
            
            levels = tempNodes
            result.append(temp)
        }
        
        return result
    }
    
    /// 将有序数组转换为二叉搜索树
    func sortedArrayToBST(_ nums: [Int]) -> TreeNode? {
        guard nums.count > 0 else {
            return nil
        }
        
        let mid = nums.count / 2
        let val = nums[mid]
        
        let root = TreeNode(val)
        guard nums.count > 1 else {
            return root
        }
        
        let leftNums = nums.filter({$0 < val})
        let rightNums = nums.filter({$0 > val})
        
        root.left = sortedArrayToBST(leftNums)
        root.right = sortedArrayToBST(rightNums)
        
        return root
    }
}
