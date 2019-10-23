//
//  LRUNode.swift
//  LRUAlgorithem
//
//  Created by 许巍杰 on 2019/5/6.
//  Copyright © 2019 许巍杰. All rights reserved.
//

import Foundation

class LinkedNode<T>{
    var value : T
    
    var previous: LinkedNode?
    var next: LinkedNode?
    
    init(_ value: T) {
        self.value = value
    }
}
