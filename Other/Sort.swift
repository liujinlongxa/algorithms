//
//  Sort.swift
//  Algorithm
//
//  Created by 刘晋龙 on 2020/5/14.
//  Copyright © 2020 com.ljl. All rights reserved.
//

import Foundation

struct Sort {
    
    static func test() {
        let arr = [3, 1, 2, 5, 4]
//        print(bubbleSort(arr))
//        print(selectionSort(arr))
//        print(insertionSort(arr))
//        print(shellSort(arr))
//        print(mergeSort(arr))
//        print(quickSort(arr))
        print(heapSort(arr))
    }
    
    static func bubbleSort(_ nums: [Int]) -> [Int] {
        
        guard nums.count > 1 else {
            return nums
        }
        
        var values = nums, count = nums.count
        
        for i in 0..<count {
            for j in 0..<(count - i - 1) {
                if values[j] > values[j + 1] {
                    let t = values[j]
                    values[j] = values[j + 1]
                    values[j + 1] = t
                }
            }
        }
        
        return values
    }
    
    static func selectionSort(_ nums: [Int]) -> [Int] {
        
        guard nums.count > 1 else {
            return nums
        }
        
        var values = nums, count = values.count
        
        var min = 0
        for i in 0..<count {
            min = i
            for j in i..<count {
                if values[j] < values[min] {
                    min = j
                }
            }
            
            if i != min {
                let temp = values[i]
                values[i] = values[min]
                values[min] = temp
            }
            print(values)
        }
        
        return values
    }
    
    static func insertionSort(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        
        var values = nums, count = values.count
        
        for i in 1..<count {
            var j = i
            while j > 0 && values[j] < values[j - 1] {
                let temp = values[j]
                values[j] = values[j - 1]
                values[j - 1] = temp
                j -= 1
            }
            print(values)
        }
        
        return values
    }
    
    static func shellSort(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        
        var values = nums, count = values.count
        var subCount = Int(floor(Double(count) / 2.0))
        
        while subCount > 0 {
            for i in subCount..<count {
                var j = i
                while j - subCount >= 0 && values[j] < values[j - subCount] {
                    print(values)
                    let temp = values[j]
                    values[j] = values[j - subCount]
                    values[j - subCount] = temp
                    j -= subCount
                }
            }
            subCount = Int(floor(Double(subCount) / 2.0))
        }
        return values
        
    }
    
    static func mergeSort(_ nums: [Int]) -> [Int] {
        
        func merge(_ leftNums: [Int], _ rightNums: [Int]) -> [Int] {
            var result = [Int]()
            var leftIndex = 0, rightIndex = 0
            
            while leftIndex < leftNums.count && rightIndex < rightNums.count {
                
                if leftNums[leftIndex] < rightNums[rightIndex] {
                    result.append(leftNums[leftIndex])
                    leftIndex += 1
                } else {
                    result.append(rightNums[rightIndex])
                    rightIndex += 1
                }
                
            }
            
            if leftIndex == leftNums.count {
                result.append(contentsOf: Array(rightNums[rightIndex...]))
            } else if rightIndex == rightNums.count {
                result.append(contentsOf: Array(leftNums[leftIndex...]))
            }
            
            return result
        }
        
        guard nums.count > 1 else {
            return nums
        }
        
        let count = nums.count
        let midIndex = count / 2
        
        let leftValues = mergeSort(Array(nums[0..<midIndex]))
        let rightValues = mergeSort(Array(nums[midIndex..<count]))
        
        return merge(leftValues, rightValues)
    }
    
    static func quickSort(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }
        
        let pivot = nums[nums.count / 2]
        let less = nums.filter({$0 < pivot})
        let equal = nums.filter({$0 == pivot})
        let greater = nums.filter({$0 > pivot})
        
        return quickSort(less) + equal + quickSort(greater)
    }
    
    static func heapSort(_ nums: [Int]) -> [Int] {
        guard nums.count > 1 else {
            return nums
        }

        var heap = MaxHeap<Int>()
        nums.forEach({heap.add(element: $0)})
        
        var result = [Int]()
        while heap.size() > 0 {
            result.insert(heap.extractMax(), at: 0)
        }
        
        return result
    }
}
