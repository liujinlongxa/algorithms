//
//  QuickSort.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/10/7.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

func quickSort(nums: [Int]) -> [Int] {
    
    func partition(nums: inout [Int])  {
        guard nums.count > 1 else {
            return
        }
        
        let e = nums.randomElement()!
        let p = nums.partition(by: {$0 > e})
        var left = Array(nums[..<p])
        var right = Array(nums[p...])
        partition(nums: &left)
        partition(nums: &right)
        
        nums = left + right
    }
    
    var temp = nums
    partition(nums: &temp)
    return temp
    
}
