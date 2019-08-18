//
//  231. Power of Two.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/8/18.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation
func isPowerOfTwo(_ n: Int) -> Bool {
    guard n > 0 else {
        return false
    }
    
    var temp = n
    while temp > 0 {
        guard temp % 2 == 0 else {
            return false
        }
        temp >>= 1
    }
    return true
}

// Another Sulution
func isPowerOfTwo1(_ n: Int) -> Bool {
    guard n > 0 else {
        return false
    }
    
    guard n & (n - 1) == 0 else {
        return false
    }
    
    return true
}
