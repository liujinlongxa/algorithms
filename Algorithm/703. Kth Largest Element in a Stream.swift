//
//  703. Kth Largest Element in a Stream.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/7/11.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

// MARK: - Solution1, Time Limit Exceeded

class KthLargest {
    
    let k: Int
    var nums: [Int]
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.nums = nums
    }
    
    func add(_ val: Int) -> Int {
        nums.append(val)
        nums.sort()
        if nums.count > k {
            nums.removeFirst(nums.count - k)
        }
        return nums.first ?? 0
    }
}
