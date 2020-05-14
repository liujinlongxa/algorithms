//
//  Problem09.swift
//  Algorithm
//
//  Created by 刘晋龙 on 2020/5/14.
//  Copyright © 2020 com.ljl. All rights reserved.
//

import Foundation

func fib(_ n: Int) -> Int {
    guard n > 0 else {
        return 0
    }
    
    var first = 0
    var second = 1
    // 大数越界： 随着 n 增大, f(n) 会超过 Int32 甚至 Int64 的取值范围，导致最终的返回值错误。
    let tag = Int(1e9 + 7)
    for _ in 0..<n {
        let tmp = first
        first = second
        second = (tmp + first) % tag
    }
    
    return second
}
