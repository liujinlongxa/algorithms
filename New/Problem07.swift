//
//  Problem07.swift
//  Algorithm
//
//  Created by 刘晋龙 on 2020/5/12.
//  Copyright © 2020 com.ljl. All rights reserved.
//

import Foundation

func buildTree(_ preorder: [Int], _ inorder: [Int]) -> TreeNode? {

    guard preorder.count > 0 else {
        return nil
    }
    
    let root = TreeNode(preorder[0])
    if preorder.count == 1 {
        return root
    }
    
    var leftInorder = [Int]()
    var rightInorder = [Int]()
    var leftPreorder = [Int]()
    var rightPreorder = [Int]()
    
    let inorderArr = inorder.split(separator: root.val)
    if inorder.first! == root.val {
        rightInorder = Array(inorderArr[0])
        rightPreorder = Array(preorder[(preorder.count - rightInorder.count)...])
    } else if inorder.last! == root.val {
        leftInorder = Array(inorderArr[0])
        leftPreorder = Array(preorder[1...(leftInorder.count)])
    } else {
        leftInorder = Array(inorderArr.first!)
        rightInorder = Array(inorderArr.last!)
        leftPreorder = Array(preorder[1...(leftInorder.count)])
        rightPreorder = Array(preorder[(preorder.count - rightInorder.count)...])
    }
    
    root.left = buildTree(leftPreorder, leftInorder)
    root.right = buildTree(rightPreorder, rightInorder)

    return root
    
}
