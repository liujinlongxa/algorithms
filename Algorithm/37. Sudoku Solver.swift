//
//  37. Sudoku Solver.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/8/11.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation
func solveSudoku(_ board: inout [[Character]]) {
    
    class Item {
        var row: Int;
        var column: Int;
        var available: [Character];
        var next: Item?
        
        init(row: Int, column: Int, available: [Character]) {
            self.row = row
            self.column = column
            self.available = available
        }
    }
    
    // Pretreatment
    var temp: [Item] = []
    for i in 0..<9 {
        for j in 0..<9 {
            if board[i][j] == "." {
                var avaliable: [Character] = []
                for k in 0..<9 {
                    let value = Character("\(k + 1)")
                    board[i][j] = value
                    if isValidSudoku(board) {
                        avaliable.append(value)
                    }
                }
                board[i][j] = "."
                temp.append(Item(row: i, column: j, available: avaliable))
            }

        }
    }
    
    // Link List
    var sorted = temp.sorted(by: {$0.available.count < $1.available.count})
    for i in 0..<(sorted.count - 1) {
        let item = sorted[i]
        item.next = sorted[i + 1]
    }
    
    func DFS(current: Item) -> Bool {
        for char in current.available {
            board[current.row][current.column] = char
            if isValidSudoku(board) {
                print("OK: x:\(current.row), y:\(current.column), value:\(char)")
                guard let next = current.next else {
                    return true
                }
                
                if DFS(current: next) {
                    return true
                }
            }
        }
        print("FAIL: x:\(current.row), y:\(current.column)")
        board[current.row][current.column] = "."
        return false
    }
    
    _ = DFS(current: sorted[0])
}
