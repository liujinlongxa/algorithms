//
//  1. Two Sum.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/7/10.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

// MARK: - Solution1

func twoSum1(_ nums: [Int], _ target: Int) -> [Int] {
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

// MARK: - Solution2
func twoSum2(_ nums: [Int], _ target: Int) -> [Int] {
    var map: [Int: Int] = [:]
    for i in 0..<nums.count {
        map[nums[i]] = i
    }

    for i in 0..<nums.count {
        let right = target - nums[i]
        if let rightIdx = map[right], rightIdx != i {
            return [i, rightIdx]
        }
    }

    return []
}
