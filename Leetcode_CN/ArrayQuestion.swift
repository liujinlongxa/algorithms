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
//        print(twoSum([3, 3], 6))
        print(isValid2("(([{}]))[]"))
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
    
    /// 合并两个有序数组
    func merge(_ nums1: inout [Int], _ m: Int, _ nums2: [Int], _ n: Int) {
        nums1.insert(contentsOf: nums2, at: m)
        nums1 = Array(nums1[0..<(m + n)])
        nums1.sort()
    }
    
    /// 20. 有效的括号
    /// https://leetcode-cn.com/problems/valid-parentheses/
    func isValid(_ s: String) -> Bool {
        let validPair = [
            ")": "(",
            "]": "[",
            "}": "{"
        ]
        var stack = [String]()
        let leftPair = "([{"
        for c in s {
            if leftPair.contains(c) {
                stack.append(String(c))
            } else {
                if let last = stack.last, validPair[String(c)] == last {
                    stack.removeLast()
                } else {
                    return false
                }
            }
        }
        return stack.isEmpty
    }
    
    /// 20. 有效的括号
    /// https://leetcode-cn.com/problems/valid-parentheses/
    func isValid2(_ s: String) -> Bool {
        var s = s
        while s.contains("()") ||
            s.contains("[]") ||
            s.contains("{}") {
                s = s.replacingOccurrences(of: "[]", with: "")
                s = s.replacingOccurrences(of: "{}", with: "")
                s = s.replacingOccurrences(of: "()", with: "")
        }
        return s.isEmpty
    }
    
    /// 1431. 拥有最多糖果的孩子
    /// https://leetcode-cn.com/problems/kids-with-the-greatest-number-of-candies/
    func kidsWithCandies(_ candies: [Int], _ extraCandies: Int) -> [Bool] {
        let max = candies.max()!
        var result = [Bool]()
        for candy in candies {
            result.append(candy + extraCandies >= max)
        }
        return result
    }
    
    /// 1450. 在既定时间做作业的学生人数
    /// https://leetcode-cn.com/problems/number-of-students-doing-homework-at-a-given-time/
    func busyStudent(_ startTime: [Int], _ endTime: [Int], _ queryTime: Int) -> Int {
        
        let length = startTime.count
        var result = 0
        
        for idx in 0..<length where startTime[idx] <= queryTime && endTime[idx] >= queryTime {
            result += 1
        }
        
        return result
    }
}
