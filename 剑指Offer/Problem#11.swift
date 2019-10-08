//
//  Problem#11.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/10/8.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

func jzOfferP11(base: Int, exponent: Int) -> Int {
    if exponent == 0 {
        return 1
    }
    
    if exponent == 1 {
        return base
    }
    
    var result = jzOfferP11(base: base, exponent: exponent >> 1)
    result *= result
    if exponent & 0x1 == 1 {
        result *= base
    }
    
    return result
}
