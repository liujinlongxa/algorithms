//
//  15. 3Sum.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/7/20.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

// MARK: - Solution2
//func threeSum(_ nums: [Int]) -> [[Int]] {
//
//    let count = nums.count
//    if count < 3 {
//        return []
//    }
//
//    var dict = [Int: Int]()
//    var ret = [[Int]]()
//    var temp: Set<Set<Int>> = []
//    for i in 0..<count {
//        dict[nums[i]] = i
//    }
//
//    for i in 0..<count {
//        for j in i + 1..<count {
//            let value = -nums[i] - nums[j]
//            if let idx = dict[value], idx != i, idx != j, !temp.contains(Set([nums[i], nums[j], value])){
//                ret.append([nums[i], nums[j], -nums[i] - nums[j]])
//                temp.insert(Set([nums[i], nums[j], -nums[i] - nums[j]]))
//            }
//        }
//    }
//
//    return ret
//}

func threeSum(_ nums: [Int]) -> [[Int]] {
    
    if nums.count < 3 {
        return []
    }
    
    let sorted = nums.sorted()
    var ret = Set<[Int]>()
    for i in 0..<sorted.count {
        var j = i + 1, k = sorted.count - 1
        while k > j {
            if sorted[j] + sorted[k] == -sorted[i] {
                ret.insert([sorted[i], sorted[j], sorted[k]])
                j += 1
            } else if sorted[j] + sorted[k] > -sorted[i] {
                k -= 1
            } else if sorted[j] + sorted[k] < -sorted[i] {
                j += 1
            }
        }
    }
    
    return Array(ret)
}
