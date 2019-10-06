//
//  Problem#6.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/10/6.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

func jzOfferP6(preOrder: [Int], inOrder: [Int]) -> BST<Int>? {
    guard preOrder.count > 0, inOrder.count > 0 else {
        return nil
    }
    
    let bst = BST<Int>()
    
    func construct(preOrder: [Int], inOrder: [Int]) -> BST<Int>.Node? {
        guard preOrder.count > 0 && inOrder.count > 0 else {
            return nil
        }
        
        if preOrder.count == 1 && inOrder.count == 1 {
            let node = BST<Int>.Node(e: preOrder[0])
            return node
        }
        
        let root = preOrder.first!
        
        let node = BST<Int>.Node(e: root)
        let subTrees = inOrder.split(separator: root)
        if subTrees.count == 2 {
            node.left = construct(preOrder: preOrder.filter({subTrees[0].contains($0)}), inOrder: Array(subTrees[0]))
            node.right = construct(preOrder: preOrder.filter({subTrees[1].contains($0)}), inOrder: Array(subTrees[1]))
        } else if inOrder.first! == root {
            node.right = construct(preOrder: preOrder.filter({subTrees[0].contains($0)}), inOrder: Array(subTrees[0]))
        } else {
            node.left = construct(preOrder: preOrder.filter({subTrees[0].contains($0)}), inOrder: Array(subTrees[0]))
        }
        
        return node
    }
    
    bst.node = construct(preOrder: preOrder, inOrder: inOrder)
    
    return bst
}
