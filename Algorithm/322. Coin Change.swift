//
//  322. Coin Change.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/9/29.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation
func coinChange(_ coins: [Int], _ amount: Int) -> Int {
    
    guard amount >= 1 else {
        return 0
    }
    
    let max = amount + 1
    var dp = [Int](repeating: amount + 1, count: max)
    dp[0] = 0
    for i in 1...amount {
        for j in coins.indices {
            if coins[j] <= i {
                dp[i] = min(dp[i], dp[i - coins[j]] + 1)
            }
        }
    }
    return dp[amount] > amount ? -1 : dp[amount]
}
