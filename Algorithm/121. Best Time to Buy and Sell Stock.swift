//
//  121. Best Time to Buy and Sell Stock.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/9/18.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation
func maxProfit2(_ prices: [Int]) -> Int {
    
    guard prices.count > 0 else {
        return 0
    }
    
    var maxProfit = 0
    var minPrice = prices[0]
    for i in 1..<prices.count {
        minPrice = min(minPrice, prices[i])
        maxProfit = max(maxProfit, prices[i] - minPrice)
    }
    return maxProfit
}
