//
//  703. Kth Largest Element in a Stream.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/7/11.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

// MARK: - Solution1, Time Limit Exceeded

class KthLargest1 {
    
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

// MARK: - Solution2

class KthLargest2 {
    
    let k: Int
    var heap: MinHeap<Int>
    init(_ k: Int, _ nums: [Int]) {
        self.k = k
        self.heap = MinHeap<Int>()
        for item in nums {
            self.heap.add(element: item)
            if self.heap.size() > k {
                self.heap.extractMin()
            }
        }
    }
    
    func add(_ val: Int) -> Int {
        
        if self.heap.size() <= 0 {
            self.heap.add(element: val)
            return val
        }
        
        self.heap.add(element: val)
        if self.heap.size() > k {
            self.heap.extractMin()
        }
        return self.heap.getMin()
    }
}
