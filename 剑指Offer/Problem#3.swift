//
//  Problem#3.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/10/4.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

func jzOfferP3(array: [[Int]], num: Int) -> Bool {
    var found = false
    
    guard array.count != 0 else {
        return found
    }
    
    var row = 0
    var column = array[0].count - 1
    while row < array.count && column >= 0 {
        if array[row][column] == num {
            found = true
            break
        } else if array[row][column] > num {
            column -= 1
        } else {
            row += 1
        }
    }
    
    return found
}
