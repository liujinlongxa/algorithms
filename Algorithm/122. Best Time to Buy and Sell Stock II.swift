//
//  122. Best Time to Buy and Sell Stock II.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/7/29.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

func maxProfit(_ prices: [Int]) -> Int {
    
    guard prices.count > 0 else {
        return 0
    }
    
    var max = 0
    for idx in 0..<(prices.count - 1) {
        if prices[idx] < prices[idx + 1] {
            max += prices[idx + 1] - prices[idx]
        }
    }
    return max
}
