//
//  50. Pow(x, n).swift
//  Algorithm
//
//  Created by Liujinlong on 2019/7/28.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

func myPow(_ x: Double, _ n: Int) -> Double {
    guard n != 0 else {
        return 1
    }
    
    if n < 0 {
        return 1 / myPow(x, -n)
    }
    
    if n % 2 == 0 {
        return x * myPow(x, n - 1)
    }
    
    return myPow(x * x, n / 2)
}
