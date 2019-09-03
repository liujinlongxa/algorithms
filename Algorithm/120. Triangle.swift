//
//  120. Triangle.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/9/3.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

func minimumTotal(_ triangle: [[Int]]) -> Int {
    guard triangle.count > 0 else {
        return 0
    }
    
    var dp = [Int](repeatElement(0, count: triangle.count))
    for i in stride(from: triangle.count - 1, through: 0, by: -1) {
        for j in 0..<triangle[i].count {
            dp[j] = min(dp[j], dp[j + 1]) + triangle[i][j]
            print(dp)
        }
    }
    return dp[0]
}
