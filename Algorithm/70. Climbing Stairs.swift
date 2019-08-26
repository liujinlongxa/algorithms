//
//  70. Climbing Stairs.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/8/26.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation
func climbStairs(_ n: Int) -> Int {
    var first = 1
    var second = 1
    for _ in 2..<n {
        let temp = first
        first = second
        second = temp + second
    }
    return second
}
