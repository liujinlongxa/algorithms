//
//  Problem04.swift
//  Algorithm
//
//  Created by 刘晋龙 on 2020/5/12.
//  Copyright © 2020 com.ljl. All rights reserved.
//

import Foundation

func findNumberIn2DArray(_ matrix: [[Int]], _ target: Int) -> Bool {
    guard matrix.count > 0 else {
        return false
    }
    
    guard matrix[0].count > 0 else {
        return false
    }
    
    let h = matrix.count
    let w = matrix[0].count
    var i = 0, j = w - 1
    while i < h && j >= 0 {
        let value = matrix[i][j]
        if value > target {
            j -= 1
        } else if value < target {
            i += 1
        } else {
            return true
        }
    }
    
    return false
}
