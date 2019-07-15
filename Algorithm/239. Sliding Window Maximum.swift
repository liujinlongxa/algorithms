//
//  239. Sliding Window Maximum.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/7/15.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

func maxSlidingWindow(_ nums: [Int], _ k: Int) -> [Int] {
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
