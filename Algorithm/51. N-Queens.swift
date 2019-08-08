//
//  51. N-Queens.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/8/8.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

func solveNQueens(_ n: Int) -> [[String]] {

    guard n >= 1 else {
        return []
    }

    var ret = [[Int]]()
    var cols = Set<Int>()
    var pie = Set<Int>()
    var na = Set<Int>()
    
    func DFS(n: Int, row: Int, state: [Int]) {
        guard row < n else {
            ret.append(state)
            return
        }
        
        for col in 0..<n {
            if cols.contains(col) || pie.contains(row + col) || na.contains(row - col) {
                continue
            }
            
            cols.insert(col)
            pie.insert(row + col)
            na.insert(row - col)
            
            DFS(n: n, row: row + 1, state: state + [col])
            
            cols.remove(col)
            pie.remove(row + col)
            na.remove(row - col)
        }
    }
    DFS(n: n, row: 0, state: [])
    print(ret)
    return ret.map({$0.map({ (idx) -> String in
        var string = String(repeating: ".", count: n - 1)
        string.insert("Q", at: String.Index(utf16Offset: idx, in: string))
        return string
    })})
}
