//
//  Problem43.swift
//  Algorithm
//
//  Created by 刘晋龙 on 2020/5/14.
//  Copyright © 2020 com.ljl. All rights reserved.
//

import Foundation

func maxSubArray(_ nums: [Int]) -> Int {
    var values = nums
    for i in 1..<values.count {
        values[i] += max(values[i - 1], 0)
    }
    return values.max() ?? 0
}
