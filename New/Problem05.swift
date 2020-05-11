//
//  Problem05.swift
//  Algorithm
//
//  Created by 刘晋龙 on 2020/5/12.
//  Copyright © 2020 com.ljl. All rights reserved.
//

import Foundation

func replaceSpace(_ s: String) -> String {
    let chars = Array(s)
    var newChars = Array<Character>(repeating: "0", count: chars.count * 3)
    var size = 0
    for (idx, c) in chars.enumerated() {
        if c == " " {
            newChars[size] = "%"
            newChars[size + 1] = "%"
            newChars[size + 2] = "%"
            size += 3
        } else {
            newChars[size] = Character(extendedGraphemeClusterLiteral: c)
            size += 1
        }
    }
    
    return String(newChars[...size])
}

func replaceSpace2(_ s: String) -> String {
    return s.replacingOccurrences(of: " ", with: "%20")
}
