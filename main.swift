//
//  main.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/7/10.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

func testTwoSum() {
    assert(twoSum1([2, 7, 11, 15], 9) == [0, 1])
    assert(twoSum2([2, 7, 11, 15], 9) == [0, 1])
    assert(twoSum2([3, 2, 4], 6) == [1, 2])
    assert(twoSum2([2, 5, 5, 11], 10) == [1, 2])
}

func testMaxHeap() {
    var data = MaxHeap<Int>()
    data.add(element: 12)
    data.add(element: 13)
    data.add(element: 3)
    data.add(element: 133)
    assert(data.extractMax() == 133)
    data.add(element: 4)
    assert(data.extractMax() == 13)
}

func testMinHeap() {
    var data = MinHeap<Int>()
    for _ in 0..<10000 {
        data.add(element: Int.random(in: ClosedRange(uncheckedBounds: (-5000, 5000))))
    }
    
    let pre = data.extractMin()
    for _ in 0..<data.size() {
        let current = data.extractMin()
        assert(pre <= current)
    }
}

func test703KthLargestElementInAStream() {
    let kth = KthLargest2(3, [4,5,8,2])
    assert(kth.add(3) == 4)
    assert(kth.add(5) == 5)
    assert(kth.add(10) == 5)
    assert(kth.add(9) == 8)
    assert(kth.add(4) == 8)
}

func test703KthLargestElementInAStream1() {
    let kth = KthLargest2(1, [])
    assert(kth.add(-3) == -3)
    assert(kth.add(-2) == -2)
    assert(kth.add(-4) == -2)
    assert(kth.add(0) == 0)
    assert(kth.add(4) == 4)
}

func test703KthLargestElementInAStream2() {
    let kth = KthLargest2(2, [0])
    assert(kth.add(-1) == -1)
    assert(kth.add(1) == 0)
}

func testMaxSlidingWindow( ) {
    var ret = maxSlidingWindow1([1,3,-1,-3,5,3,6,7], 3)
    assert(ret == [3,3,5,5,6,7])
    ret = maxSlidingWindow1([3,-1,-3,5,3,6,7,8,3,7,5], 3)
    assert(ret == [3,5,5,6,7,8,8,8,7])
    ret = maxSlidingWindow1([1,3,1,2,0,5], 3)
    assert(ret == [3,3,2,5])
    
    ret = maxSlidingWindow2([1,3,-1,-3,5,3,6,7], 3)
    assert(ret == [3,3,5,5,6,7])
    ret = maxSlidingWindow2([3,-1,-3,5,3,6,7,8,3,7,5], 3)
    assert(ret == [3,5,5,6,7,8,8,8,7])
    ret = maxSlidingWindow2([1,3,1,2,0,5], 3)
    assert(ret == [3,3,2,5])
    ret = maxSlidingWindow2([1,-1], 1)
    assert(ret == [1, -1])
    ret = maxSlidingWindow2([7,2,4], 2)
    assert(ret == [7, 4])
}

func testIsAnagram() {
    assert(isAnagram1("abc", "cba"))
    assert(isAnagram2("abc", "cba"))
    assert(isAnagram1("acbbc", "bcabc"))
    assert(isAnagram2("acbbc", "bcabc"))
    assert(!isAnagram1("acbbceefs", "bcabcefsf"))
    assert(!isAnagram2("acbbceefs", "bcabcefsf"))
}

func test3Sum() {
//    assert(threeSum([-1, 0, 1, 2, -1, -4]) == [[-1, 0, 1], [-1, 2, -1]])
    assert(threeSum([-2, 0, 1, 1, 2]) == [[-2, 0, 2],[-2, 1, 1]])
}

func testGenerateParenthesis() {
    let ret = generateParenthesis(3)
    assert(ret == ["((()))", "(()())", "(())()", "()(())", "()()()"])
}

func testSolveNQueens() {
    let ret = solveNQueens(5)
    print(ret)
    
}

//testTwoSum()
//testMaxHeap()
//testMinHeap()
//test703KthLargestElementInAStream()
//test703KthLargestElementInAStream1()
//test703KthLargestElementInAStream2()
//testMaxSlidingWindow()
//testIsAnagram()
//test3Sum()
//testGenerateParenthesis()
testSolveNQueens()
