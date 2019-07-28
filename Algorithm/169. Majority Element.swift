//
//  169. Majority Element.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/7/28.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

func majorityElement1(_ nums: [Int]) -> Int {
    var map = [Int: Int]()
    for num in nums {
        map[num] = (map[num] ?? 0) + 1
    }
    
    let max = map.max(by: {$0.value > $1.value})
    return max?.key ?? 0
}
