//
//  152. Maximum Product Subarray.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/9/5.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

func maxProduct(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    
    var res = nums[0], curMax = nums[0], curMin = nums[0]
    
    for i in 1..<nums.count {
        var tempMax = curMax * nums[i]
        var tempMin = curMin * nums[i]
        curMax = max(nums[i], max(tempMax, tempMin))
        curMin = min(nums[i], min(tempMax, tempMin))
        res = res > curMax ? res : curMax
        print("curMax: \(curMax), curMin: \(curMin), res: \(res)")
    }
    
    return res
}
