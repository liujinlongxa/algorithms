//
//  22. Generate Parentheses.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/8/5.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

var list = [String]()
func generateParenthesis(_ n: Int) -> [String] {
    generate(n, 0, 0, "")
    return list
}

func generate(_ n: Int, _ left: Int, _ right: Int, _ result: String) {
    print(result)
    if left == n && right == n {
        print("finish: \(result)")
        list.append(result)
        return
    }
    
    if left < n {
        generate(n, left + 1, right, result + "(")
    }
    
    if left > right && right < n {
        generate(n, left, right + 1, result + ")")
    }
}
