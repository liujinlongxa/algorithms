//
//  1. Two Sum.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/7/10.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
    let len = nums.count
    for i in 0..<len {
        for j in (i + 1)..<len {
            if nums[i] + nums[j] == target {
                return [i, j]
            }
        }
    }
    return []
}
