//
//  36. Valid Sudoku.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/8/11.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

func isValidSudoku(_ board: [[Character]]) -> Bool {
    var temp = Set<Character>()
    
    // Check Row
    for i in 0..<9 {
        for j in 0..<9 {
            if temp.contains(board[i][j]) {
                return false
            }
            
            if board[i][j] != "." {
                temp.insert(board[i][j])
            }
        }
        temp.removeAll()
    }
    
    // Check Column
    for i in 0..<9 {
        for j in 0..<9 {
            if temp.contains(board[j][i]) {
                return false
            }
            
            if board[j][i] != "." {
                temp.insert(board[j][i])
            }
        }
        temp.removeAll()
    }
    
    // Check 3x3
    for i in 0..<3 {
        for j in 0..<3 {
            for k in 0..<9 {
                let x = i * 3 + k / 3
                let y = j * 3 + k % 3
                if temp.contains(board[x][y]) {
                    return false
                }
                if board[x][y] != "." {
                    temp.insert(board[x][y])
                }
            }
            temp.removeAll()
        }
    }
    
    return true
}
