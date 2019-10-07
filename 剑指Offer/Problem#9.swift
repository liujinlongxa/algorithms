//
//  Problem#9.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/10/7.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

func jzOfferP9(num: Int) -> Int {
    
    if num <= 0 {
        return 0
    }
    
    if num == 1 {
        return 1
    }
    
    return jzOfferP9(num: num - 1) + jzOfferP9(num: num - 2)
    
}

func jzOfferP9_2(num: Int) -> Int {
    
    var num1 = 0
    var num2 = 1
    for _ in 2...num {
        let value = num1 + num2
        num1 = num2
        num2 = value
    }
    
    return num2
}
