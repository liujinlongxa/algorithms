//
//  905. Sort Array By Parity.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/7/10.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

// MARK: - Solution1

func sortArrayByParity1(_ A: [Int]) -> [Int] {
    var a = A
    var oddIndexs = [Int]()
    for index in 0..<a.count {
        let item = a[index]
        if item % 2 == 0 {
            if oddIndexs.count <= 0 {
                continue
            }
            
            let oddIndex = oddIndexs.min()!
            if oddIndex > index {
                // sort over
                break
            }
            
            a[index] = a[oddIndex]
            a[oddIndex] = item
            oddIndexs.remove(at: 0)
            oddIndexs.append(index)
        } else {
            oddIndexs.append(index)
        }
    }
    return a
}

// MARK: - Solution2

func sortArrayByParity2(_ A: [Int]) -> [Int] {
    return A.sorted(by: {$0 % 2 == 0 ? true : ($1 % 2 == 0 ? false : true)})
}

// MARK: - Solution3

func sortArrayByParity3(_ A: [Int]) -> [Int] {
    var a = A
    var i = 0, j = a.count - 1
    while i < j {
        if a[i] % 2 > a[j] % 2 {
            let temp = a[i]
            a[i] = a[j]
            a[j] = temp
        }
        if a[i] % 2 == 0 {
            i += 1
        }
        
        if a[j] % 2 == 1 {
            j -= 1
        }
        
    }
    return a
}
