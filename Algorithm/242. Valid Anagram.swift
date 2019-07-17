//
//  242. Valid Anagram.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/7/17.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

// MARK: - Solution1

func isAnagram1(_ s: String, _ t: String) -> Bool {
    return s.sorted() == t.sorted()
}

// MARK: - Solution2

func isAnagram2(_ s: String, _ t: String) -> Bool {
    var sDict = [Character: Int]()
    var tDict = [Character: Int]()
    for c in s {
        sDict[c] = (sDict[c] ?? 0) + 1
    }
    for c in t {
        tDict[c] = (tDict[c] ?? 0) + 1
    }
    return sDict == tDict
}
