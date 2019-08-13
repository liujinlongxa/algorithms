//
//  208. Implement Trie (Prefix Tree).swift
//  Algorithm
//
//  Created by Liujinlong on 2019/8/13.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation
class Trie {
    
    class TrieNode {
        var children: [TrieNode]
        var char: Character?
        var isWord: Bool
        
        init(children: [TrieNode], char: Character?, isWord: Bool) {
            self.children = children
            self.char = char
            self.isWord = isWord
        }
    }
    
    var head: TrieNode = TrieNode(children: [], char: nil, isWord: false)
    init() {}
    
    func insert(_ word: String) {
        var node = self.head
        for char in word {
            if let child = node.children.first(where: {$0.char == char}) {
                node = child
                continue
            } else {
                let newNode = TrieNode(children: [], char: char, isWord: false)
                node.children.append(newNode)
                node = newNode
            }
        }
        
        node.isWord = true
    }
    
    /** Returns if the word is in the trie. */
    func search(_ word: String) -> Bool {
        var node = self.head
        for char in word {
            if let ret = node.children.first(where: {$0.char == char}) {
                node = ret
            } else {
                return false
            }
        }
        return node.isWord
    }
    
    /** Returns if there is any word in the trie that starts with the given prefix. */
    func startsWith(_ prefix: String) -> Bool {
        var node = self.head
        for char in prefix {
            if let ret = node.children.first(where: {$0.char == char}) {
                node = ret
            } else {
                return false
            }
        }
        return true
    }
}
