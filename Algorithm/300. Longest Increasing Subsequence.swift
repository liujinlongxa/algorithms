//
//  300. Longest Increasing Subsequence.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/9/11.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation
func lengthOfLIS(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    
    var ret = 1
    var dp = Array<Int>(repeating: 1, count: nums.count)
    
    for i in 0..<nums.count {
        for j in 0..<i {
            if nums[j] < nums[i] {
                dp[i] = max(dp[i], dp[j] + 1)
            }
        }
        ret = max(ret, dp[i])
    }
    return ret
}
