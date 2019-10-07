//
//  Problem#8.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/10/7.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

func jzOfferP8(nums: [Int]) -> Int {
    
    guard nums.count > 0 else {
        return 0
    }
    
    var start = 0
    var end = nums.count - 1
    var mid = start
    while nums[start] >= nums[end] {
        
        if end - start == 1 {
            mid = end
            break
        }
        
        mid = (start + end) / 2
        if nums[mid] > nums[start] {
            start = mid
        } else if nums[mid] < nums[end] {
            end = mid
        }
    }
    
    return nums[mid]
}
