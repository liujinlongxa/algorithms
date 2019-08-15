//
//  212. Word Search II.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/8/15.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation
func findWords(_ board: [[Character]], _ words: [String]) -> [String] {
    
    let maxX = board.count
    let maxY = board[0].count
    var usedPoints: [[Int]] = Array(repeating: Array(repeating: 0, count: maxY), count: maxX)
    
    func dfs(_ x: Int, _ y: Int, word: String?) -> Bool {
        guard let word = word, word.count > 0 else {
            return false
        }
        
        guard usedPoints[x][y] != 1 else {
            return false
        }
        
        if String(board[x][y]) == word {
            return true
        }
        
        guard board[x][y] == word.first! else {
            return false
        }
        
        let index = word.index(word.startIndex, offsetBy: 1)
        let subWord = String(word[index...])
        usedPoints[x][y] = 1
        
        // up
        if x >= 1 && dfs(x - 1, y, word: subWord) {
            usedPoints[x - 1][y] = 1
            return true
        }
        
        // down
        if x < maxX - 1 && dfs(x + 1, y, word: subWord) {
            usedPoints[x + 1][y] = 1
            return true
        }
        
        // left
        if y >= 1 && dfs(x, y - 1, word: subWord) {
            usedPoints[x][y - 1] = 1
            return true
        }
        
        // right
        if y < maxY - 1 && dfs(x, y + 1, word: subWord) {
            usedPoints[x][y + 1] = 1
            return true
        }
        
        usedPoints[x][y] = 0
        return false
    }
    
    func check(word: String) -> Bool {
        defer {
            usedPoints = usedPoints.map({$0.map({_ in 0})})
        }
        
        for x in 0..<maxX {
            for y in 0..<maxY {
                if dfs(x, y, word: word) {
                    return true
                }
            }
        }
        return false
    }
    
    return words.filter({check(word: $0)})
}
