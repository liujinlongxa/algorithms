//
//  Problem#14.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/10/13.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

/// 调整数组顺序，使奇数位于偶数前面
func jzOfferP14(nums: [Int]) -> [Int] {
    
    guard nums.count > 1 else {
        return nums
    }
    
    var ret = nums
    var begin = 0, end = ret.count - 1
    
    while begin <= end {
        if ret[begin] % 2 == 0 && ret[end] % 2 == 1 {
            ret[begin] = ret[begin] ^ ret[end]
            ret[end] = ret[begin] ^ ret[end]
            ret[begin] = ret[begin] ^ ret[end]
        }
        
        if ret[begin] % 2 == 1 {
            begin += 1
        }
        
        if ret[end] % 2 == 0 {
            end -= 1
        }
     }
    
    return ret
}
