//
//  MaxHeap.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/7/12.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

struct MaxHeap<Element: Comparable> {
    var data: [Element]

    init() {
        data = [Element]()
    }
    
    func size() -> Int {
        return data.count
    }
    
    func isEmpty() -> Bool {
        return data.count == 0
    }
    
    private mutating func siftUp(_ idx: Int) {
        var k = idx
        while k > 0 && data[k.parent] < data[k] {
            data.swapAt(k, k.parent)
            k = k.parent
        }
    }
    
    mutating func add(element: Element) {
        data.append(element)
        siftUp(data.count - 1)
    }
    
    private mutating func siftDown(_ idx: Int) {
        guard idx < size() else {
            return
        }
        
        while idx.leftChild < size() {
            
            var swapIdx = idx.leftChild
            if idx.rightChild < size() && data[idx.leftChild] < data[idx.rightChild] {
                swapIdx = idx.rightChild
            }
            
            if data[swapIdx] > data[idx] {
                data.swapAt(swapIdx, idx)
                siftDown(swapIdx)
            }
            break;
        }
    }
    
    mutating func extractMax() -> Element {
        let max = getMax()
        data.swapAt(0, data.count - 1)
        data.removeLast()
        siftDown(0)
        
        return max
    }
    
    func getMax() -> Element {
        guard let max = data.first else {
            fatalError()
        }
        return max
    }
    
    mutating func replace(e: Element) -> Element {
        data[0] = e
        siftDown(0)
        return getMax()
    }
}
