//
//  ArrayQuestion.swift
//  Algorithm
//
//  Created by 刘晋龙 on 2020/5/15.
//  Copyright © 2020 com.ljl. All rights reserved.
//

import Foundation

struct ArrayQuestion {
    
    func test() {
//        print(findDuplicate([2, 3, 4, 1, 2, 5]))
        print(twoSum([3, 3], 6))
    }
    
    /// How do you find the missing number in a given integer array of 1 to 100?
    func missingNumber(_ nums: [Int]) -> Int {
        let set = Set(nums)
        for i in 0..<(nums.count + 1) {
            if !set.contains(i) {
                return i
            }
        }
        
        return -1
    }
    
    /// How do you find the duplicate number on a given integer array?
    func findDuplicate(_ nums: [Int]) -> Int {
        guard nums.count > 0 else {
            return 0
        }
        
        var values = nums
        while values[0] != values[values[0]] {
            values.swapAt(0, values[0])
        }
        
        return values[0]
    }
    
    /// How do you find all pairs of an integer array whose sum is equal to a given number?
    func twoSum(_ nums: [Int], _ target: Int) -> [Int] {
        var map = [Int: Int]()
        for (idx, num) in nums.enumerated() {
            map[num] = idx
        }
        
        for i in 0..<nums.count {
            let val = target - nums[i]
            if map.keys.contains(val) && i != map[val]! {
                return [i, map[val]!]
            }
            
        }
        return []
    }
}
