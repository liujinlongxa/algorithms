//
//  832. Flipping an Image.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/7/10.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

// MARK: - Solution1

func flipAndInvertImage1(_ A: [[Int]]) -> [[Int]] {
    let temp = A.map({$0.reversed()})
    return temp.map({$0.map({$0 == 0 ? 1 : 0})})
}

// MARK: - Solution2

func flipAndInvertImage2(_ A: [[Int]]) -> [[Int]] {
    var ret = [[Int]]()
    for var arr in A {
        let len = arr.count
        for index in 0..<len {
            
            if index > len - 1 - index {
                break
            }
            
            let temp = arr[index]
            let last = arr[len - 1 - index]
            arr[index] = last ^ 1
            arr[len - 1 - index] = temp ^ 1
            
        }
        ret.append(arr)
    }
    return ret
}

// MARK: - Solution3

func flipAndInvertImage3(_ A: [[Int]]) -> [[Int]] {
    var ret = [[Int]]()
    for var arr in A {
        let len = arr.count
        for index in 0..<len {
            
            if index > len - 1 - index {
                break
            }
            
            let temp = arr[index]
            let last = arr[len - 1 - index]
            arr[index] = last ^ 1
            arr[len - 1 - index] = temp ^ 1
            
        }
        ret.append(arr)
    }
    return ret
}

// MARK: - Solution4

func flipAndInvertImage4(_ A: [[Int]]) -> [[Int]] {
    var a = A
    for i in 0..<a.count {
        var arr = A[i]
        let len = arr.count
        for index in 0..<len {
            
            if index > len - 1 - index {
                break
            }
            
            let temp = arr[index]
            let last = arr[len - 1 - index]
            arr[index] = last ^ 1
            arr[len - 1 - index] = temp ^ 1
            
        }
        a[i] = arr
    }
    return a
}
