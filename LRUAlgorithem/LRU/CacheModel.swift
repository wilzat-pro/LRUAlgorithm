//
//  File.swift
//  LRUAlgorithem
//
//  Created by 许巍杰 on 2019/10/23.
//  Copyright © 2019 许巍杰. All rights reserved.
//

import Foundation

class CacheModel: Equatable {
    
    var id : Int?
    
    var text = ""
    
    convenience init(_ id: Int, txt: String) {
        
        self.init()
        
        self.id = id
        self.text = txt
    }
    
    
    static func == (lhs: CacheModel, rhs: CacheModel) -> Bool {
        
        if lhs.id == rhs.id {
            return true
        }else {
            return false
        }
    }
}
