//
//  239. Sliding Window Maximum.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/7/15.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

// MARK: - Solution1

func maxSlidingWindow1(_ nums: [Int], _ k: Int) -> [Int] {
    let len = nums.count
    
    guard len > 0 else {
        return []
    }
    
    guard len > k else {
        return [nums.max()!]
    }
    
    var result = [Int]()
    var idxs = [Int]()
    var queue = [Int]()
    for idx in 0..<len {
        
        idxs.append(idx)
        queue.append(nums[idx])
        
        if idxs.last! >= k - 1 && idxs.last! - idxs.first! >= k {
            idxs.removeFirst()
            queue.removeFirst()
        }
        
        let val = nums[idx]
        var i = queue.count - 2
        var temp = queue
        while i >= 0 {
            if val >= temp[i] {
                queue.remove(at: i)
                idxs.remove(at: i)
            }
            i -= 1
        }
        
        if idxs.last! >= k - 1 {
            result.append(queue[0])
        }
        
    }
    
    return result
}

// MARK: - Solution2

func maxSlidingWindow2(_ nums: [Int], _ k: Int) -> [Int] {
    guard nums.count > 0, k > 0 else {
        return []
    }
    var ret = [Int].init(repeating: 0, count: nums.count - k + 1)
    var maxIdx = 0
    for i in 0..<nums.count {
        if nums[i] > nums[maxIdx] {
            maxIdx = i
        }
        if i - maxIdx >= k {
            maxIdx = i - k + 1
            if i - k + 2 <= i {
                for j in (i - k + 2)...i {
                    if nums[j] > nums[maxIdx] {
                        maxIdx = j
                    }
                }
            }
        }
        if i - k + 1 >= 0 {
            ret[i - k + 1] = nums[maxIdx]
        }
    }
    
    return ret
}
