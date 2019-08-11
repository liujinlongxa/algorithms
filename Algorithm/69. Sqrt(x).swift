//
//  69. Sqrt(x).swift
//  Algorithm
//
//  Created by Liujinlong on 2019/8/11.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

func mySqrt(_ x: Int) -> Int {
    var left = 0, right = x
    while left < right {
        let mid = (left + right) / 2
        if mid * mid == x {
            return mid
        } else if mid * mid > x {
            right = mid - 1
        } else {
            left = mid + 1
        }
    }
    return Int(floor(Double((left + right) / 2)))
}
