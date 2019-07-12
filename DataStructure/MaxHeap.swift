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
    
    private func parent(_ idx: Int) -> Int {
        if idx == 0 {
            fatalError()
        }
        return (idx - 1) / 2
    }
    
    private func leftChild(_ idx: Int) -> Int {
        return idx * 2
    }
    
    private func rightChild(_ idx: Int) -> Int {
        return idx * 2 + 1
    }
    
    private mutating func siftUp(_ idx: Int) {
        var k = idx
        while k > 0 && data[parent(k)] < data[k] {
            data.swapAt(k, parent(k))
            k = parent(k)
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
        
        while leftChild(idx) < size() {
            
            var swapIdx = leftChild(idx)
            if rightChild(idx) < size() && data[leftChild(idx)] < data[rightChild(idx)] {
                swapIdx = rightChild(idx)
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
}
