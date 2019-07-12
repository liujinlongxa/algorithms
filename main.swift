//
//  main.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/7/10.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

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
    data.add(element: 12)
    data.add(element: 13)
    data.add(element: 3)
    data.add(element: 133)
    assert(data.extractMin() == 3)
    data.add(element: 4)
    assert(data.extractMin() == 4)
}

func test703KthLargestElementInAStream() {
    let kth = KthLargest2(3, [4,5,8,2])
    assert(kth.add(3) == 4)
    assert(kth.add(5) == 5)
    assert(kth.add(10) == 5)
    assert(kth.add(9) == 8)
    assert(kth.add(4) == 8)
}

testMaxHeap()
testMinHeap()
test703KthLargestElementInAStream()

