//
//  Problem#18.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/10/20.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

// 树的子结构
func jzOfferP18(bst1: BST<Int>, bst2: BST<Int>) -> Bool {
    
    func hasSubTree(root1: BST<Int>.Node?, root2: BST<Int>.Node?) -> Bool {
        guard let root2 = root2 else {
            return true
        }
        
        guard let root1 = root1 else {
            return false
        }
        
        guard root1.e == root2.e else {
            return false
        }
        
        return hasSubTree(root1: root1.left, root2: root2.left) && hasSubTree(root1: root1.right, root2: root2.right)
    }
    
    func subtree(root1: BST<Int>.Node?, root2: BST<Int>.Node?) -> Bool{
        var ret = false

        guard let root1 = root1, let root2 = root2 else {
            return ret
        }
        
        if root1.e == root2.e {
            ret = hasSubTree(root1: root1, root2: root2)
        }
        if !ret {
            ret = subtree(root1: root1.left, root2: root2)
        }
        if !ret {
            ret = subtree(root1: root1.right, root2: root2)
        }
        
        return ret
    }

    return subtree(root1: bst1.node, root2: bst2.node)
}
