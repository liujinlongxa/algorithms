//
//  BST.swift
//  DataStructure
//
//  Created by Liujinlong on 2018/8/10.
//  Copyright © 2018 lazyaudio. All rights reserved.
//

import Foundation

enum BSTError: Error {
    case outOfIndex
}

class BST<E: Comparable> {
    class Node: CustomStringConvertible & Comparable {
        
        
        var e: E
        var left: Node?
        var right: Node?
        init(e: E) {
            self.e = e
        }
        
        var description: String {
            return "\(e)"
        }
        
        public static func == (lhs: Node, rhs: Node) -> Bool {
            return lhs.e == rhs.e
        }
        
        public static func < (lhs: Node, rhs: Node) -> Bool {
            return lhs.e < rhs.e
        }
        
    }
    
    var node: Node?
    var size: Int = 0
    
    func getSize() -> Int {
        return size
    }
    
    func isEmpty() -> Bool {
        return size == 0
    }
    
    /// 层序遍历
    func levelOrder()  {
        guard let root = node else {
            return
        }
        
        let list = LinkedList<Node>()
        list.addFirst(e: root)
        while !list.isEmpty() {
            let head = try! list.removeFirst()
            print(head!.e)
            if let left = head?.left {
                list.addLast(e: left)
            }
            if let right = head?.right {
                list.addLast(e: right)
            }
        }
    }
    
    /// 添加元素
    func add(e: E) {
        if let node = node {
            add(node: node, e: e)
        } else {
            node = Node.init(e: e)
        }
    }
    
    /// 是否包含元素
    func contains(e: E) -> Bool {
        return false
    }
    
    /// 前序遍历
    func preOrder() {
        preOrder(node: node)
    }
    
    /// 先跟遍历非递归方法
    func preOrderNR() {
        guard let node = node else {
            return
        }
        
        let stack = ArrayStack<Node>.init()
        stack.push(e: node)
        
        while !stack.isEmpty() {
            let n = stack.pop()
            if let n = n {
                print(n.e)
                if let right = n.right {
                    stack.push(e: right)
                }
                if let left = n.left {
                    stack.push(e: left)
                }
            }
        }
    }
    
    /// 中序遍历
    func inOrder() {
        inOrder(node: node)
    }
    
    /// 后序遍历
    func postOrder() {
        postOrder(node: node)
    }
    
    /// 最大元素
    func maximum() throws -> E {
        guard let node = node else {
            throw BSTError.outOfIndex
        }
        
        var temp = node
        while let right = temp.right {
            temp = right
        }
        return temp.e
    }
    
    /// 最小元素
    func minimum() throws -> E {
        guard let node = node else {
            throw BSTError.outOfIndex
        }
        
        var temp = node
        while let left = temp.left {
            temp = left
        }
        return temp.e
    }
    
    /// 删除最小元素
    @discardableResult
    func removeMin() -> E? {
        return removeMin(node: node)?.e
    }
    
    /// 删除最大元素
    @discardableResult
    func removeMax() -> E? {
        return removeMax(node: node)?.e
    }
    
    /// 删除元素
    func remove(e: E) {
        node = remove(node: node, e: e)
    }
}

extension BST {
    /// 添加元素e到以node为根的树中
    private func add(node: Node, e: E) {
        if e < node.e {
            if let left = node.left {
                add(node: left, e: e)
            } else {
                node.left = Node.init(e: e)
            }
        } else if e > node.e {
            if let right = node.right {
                add(node: right, e: e)
            } else {
                node.right = Node.init(e: e)
            }
        }
    }
    
    /// 先根遍历
    private func preOrder(node: Node?) {
        guard let node = node else {
            return
        }
        
        print(node.e)
        preOrder(node: node.left)
        preOrder(node: node.right)
    }
    
    /// 中跟遍历
    private func inOrder(node: Node?) {
        guard let node = node else {
            return
        }
        
        inOrder(node: node.left)
        print(node.e)
        inOrder(node: node.right)
    }
    
    /// 后跟遍历
    private func postOrder(node: Node?) {
        guard let node = node else {
            return
        }
        
        postOrder(node: node.left)
        postOrder(node: node.right)
        print(node.e)
    }
    
    /// 删除已node为根的二叉树中的最小元素，并返回删除后新的根节点
    private func removeMin(node: Node?) -> Node? {
        guard let node = node else {
            return nil
        }
        
        if let left = node.left {
            if left.left == nil {
                node.left = nil
                return node
            }
            else {
                return removeMin(node: left)
            }
        }
        return node
    }
    
    /// 删除已node为根的二叉树中的最大元素，并返回删除后新的根节点
    private func removeMax(node: Node?) -> Node? {
        guard let node = node else {
            return nil
        }
        
        if let right = node.right {
            if right.right == nil {
                node.right = nil
                return node
            } else {
                return removeMax(node: right)
            }
        }
        return node
    }
    
    /// 删除已node为根节点的二叉树中的值为e的元素，并且返回新的根节点
    private func remove(node: Node?, e: E) -> Node? {
        guard let node = node else {
            return nil
        }
        
        if node.e > e {
            node.left = remove(node: node.left, e: e)
        } else if node.e < e {
            node.right = remove(node: node.right, e: e)
        } else {
            
            if node.left == nil {
                let temp = node.right
                node.right = nil
                size -= 1
                return temp
            }
            
            if node.right == nil {
                let temp = node.left
                node.left = nil
                size -= 1
                return temp
            }
            
            let temp = removeMin(node: node.right)
            temp?.left = node.left
            temp?.right = node.right
            node.left = nil
            node.right = nil
            return temp
        }
        return node
    }
    
}
