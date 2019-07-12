//
//  Helper.swift
//  Algorithm
//
//  Created by Liujinlong on 2019/7/13.
//  Copyright © 2019 com.ljl. All rights reserved.
//

import Foundation

extension Int {
    var parent: Int {
        return (self - 1) / 2
    }
    
    var leftChild: Int {
        return self * 2
    }
    
    var rightChild: Int {
        return self * 2 + 1
    }
}
