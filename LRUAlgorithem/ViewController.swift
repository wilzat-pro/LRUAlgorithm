//
//  ViewController.swift
//  LRUAlgorithem
//
//  Created by 许巍杰 on 2019/5/6.
//  Copyright © 2019 许巍杰. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let cache = CacheLRU<CacheModel>.init(cacheNumber: 2)
        
        let modelList: [CacheModel] = [CacheModel(0, txt: "image1"), CacheModel(1, txt: "image2"), CacheModel(2, txt: "image3")]
        
        let _ = modelList.map{cache.add($0)}
        
        
        print(cache.query(modelList.first ?? CacheModel())?.value.text ?? "nil")
        print(cache.query(modelList[1])?.value.text ?? "nil")
        print(cache.query(modelList[2])?.value.text ?? "nil")
        print(cache.cache.head?.value.text ?? "nil")
        
    }
    
    


}

