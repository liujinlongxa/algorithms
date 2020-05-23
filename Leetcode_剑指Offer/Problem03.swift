//
//  Problem03.swift
//  Algorithm
//
//  Created by 刘晋龙 on 2020/5/5.
//  Copyright © 2020 com.ljl. All rights reserved.
//

import Foundation

func findRepeatNumber(_ nums: [Int]) -> Int {
    guard nums.count > 0 else {
        return 0
    }
    
    var tempArr = nums
    let count = tempArr.count
    for idx in 0..<count {
        while tempArr[idx] != idx {
            let current = tempArr[idx]
            let next = tempArr[tempArr[idx]]
            if current == next {
                return current
            }
            
            tempArr[idx] = next
            tempArr[current] = current
        }
    }
    return 0
}
