//
//  11. Container With Most Water.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/7/10.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

// MARK: - Solution1

func maxArea1(_ height: [Int]) -> Int {
    var maxA = 0
    let len = height.count
    for i in 0..<len {
        for j in (i + 1)..<len {
            let area = min(height[i], height[j]) * (j - i)
            maxA = maxA > area ? maxA : area
        }
    }
    return maxA
}

// MARK: - Solution2

func maxArea2(_ height: [Int]) -> Int {
    var left = 0, right = height.count - 1
    var maxA = (right - left) * min(height[left], height[right])
    while left < right {
        if height[left] < height[right] {
            left += 1
        } else {
            right -= 1
        }
        
        let area = (right - left) * min(height[left], height[right])
        maxA = max(area, maxA)
    }
    return maxA
}


