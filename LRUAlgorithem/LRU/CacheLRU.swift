//
//  CacheLRU.swift
//  LRUAlgorithem
//
//  Created by 许巍杰 on 2019/5/6.
//  Copyright © 2019 许巍杰. All rights reserved.
//

import Foundation

class CacheLRU<T: Equatable> {
    var limit: Int
    var cache: LinkedList<T>
    
    init(cacheNumber: Int) {
        self.limit = cacheNumber
        self.cache = LinkedList<T>()
    }
    /// 增
    func add(_ obj: T) {
        if cache.count == limit{
//            cache.removeLast()
            return
        }
        cache.append(obj)
    }
    
    /// 清空
    func clearCache() {
        cache.removeAll()
    }
    
    /// 移到最上层
    func move(value: LinkedNode<T>) {
        cache.moveToHead(node: value)
    }
    
    /// 查询
    func query(_ obj: T) -> LinkedNode<T>? {
        var next = self.cache.head
        var index = 0
        
        while index < self.cache.count {
            
            if obj == next?.value {
                guard let pNext = next else {return nil}
                move(value: pNext)
                return pNext
            }
            
            index += 1
            next = next?.next
        }
        
        return nil
        
    }
}
