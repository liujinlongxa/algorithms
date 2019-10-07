//
//  Problem#10.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/10/7.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

func jzOfferP10(num: Int) -> Int {
    var temp = num
    var count = 0
    while temp > 0 {
        if temp | 1 == temp {
            count += 1
        }
        temp >>= 1
    }
    return count
}

func jzOfferP10_2(num: Int) -> Int {
    var count = 0
    var flag = 1
    while flag <= num {
        if flag & num == flag {
            count += 1
        }
        flag <<= 1
    }
    return count
}
