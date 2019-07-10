//
//  977. Squares of a Sorted Array.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/7/10.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

func sortedSquares(_ A: [Int]) -> [Int] {
    return A.map({$0 * $0}).sorted()
}
