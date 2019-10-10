//
//  Problem#12.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/10/10.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

/// 打印从1到最大的n位数
func jzOfferP12(n: Int) {
    var num = String(repeating: "0", count: n)
    let max = String(repeating: "9", count: n)
    while true {
        guard let newNum = incremnet(num: num) else {
            break
        }
        
        printNum(newNum)
        num = newNum
        if max == newNum {
            break
        }
    }
}

func printNum(_ num: String) {
    let newString = Int(num)!
    print(newString)
}

func incremnet(num: String) -> String? {
    var needUp = true
    var newNum = ""
    for c in num.reversed() {
        let add = needUp ? 1 : 0
        guard add > 0 else {
            newNum.insert(c, at: newNum.startIndex)
            continue
        }
        
        let value = Int(String(c))!
        if value + add >= 10 {
            needUp = true
            newNum.insert("0", at: newNum.startIndex)
        } else {
            needUp = false
            let valueString = String(value + add)
            newNum.insert(valueString[valueString.startIndex], at: newNum.startIndex)
        }
    }
    return newNum
}
