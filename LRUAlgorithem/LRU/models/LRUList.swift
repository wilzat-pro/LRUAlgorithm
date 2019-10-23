//
//  LRUList.swift
//  LRUAlgorithem
//
//  Created by 许巍杰 on 2019/5/6.
//  Copyright © 2019 许巍杰. All rights reserved.
//

import Foundation

class LinkedList<T: Equatable> {
    typealias Node = LinkedNode<T>
    
    private(set) var head: Node?
    private(set) var tail: Node?
    
    ///判断是否为空
    var isEmpty: Bool {
        return head == nil
    }
    
    ///获取头结点
    var first: Node? {
        return head
    }
    
    ///获取尾节点
    var last: Node? {
        return tail
    }
    
    ///获取 链表数量
    var count: Int = 0
    // 下标语法糖
    subscript(index: Int) -> T? {
        var i = index
        var next = head
        
        while i > 0 {
            i -= 1
            next = next?.next
        }
        
        return next?.value
    }
    
    
/// 尾插法
    func append(_ value: T) {
        
        let newNode = Node(value)
        
        if let lastNode = tail {
            lastNode.next = newNode
            newNode.previous = lastNode
            tail = newNode
        }else {
            head = newNode
            tail = newNode
        }
        
        // 修改数量
        count += 1
    }
    
/// 中插法 插入 node
    func insert(value: T, atIndex index: Int) {
        
        let (pre, next) = nodesBeforeAndAfter(index: index)
        let newNode = Node(value)
        
        pre?.next = newNode
        next?.previous = newNode
        
        newNode.previous = pre
        newNode.next = next
        
        if pre == nil {
            head = newNode
        }
        
        if count == index - 1 {
            tail = newNode
        }
        
        count += 1
    }
    
/// 获取某节点的头尾节点
    func nodesBeforeAndAfter(index: Int) -> (Node?, Node?) {
        
        var next = head
        var previous: Node?
        var i = index
        
        while i > 0 && next?.next != nil{
            i -= 1
            
            previous = next
            next = next?.next
        }
        
        return (previous, next)
        
    }
    
/// 删除最后一个
    func removeLast() {
        guard let lastNode = last else { return }
        removeNode(node: lastNode)
    }
    
/// 删除全部
    func removeAll() {
        head = nil
        tail = nil
        count = 0
    }
    
    /// 移除某一个node
    func removeNode(node: Node) {
        let pre = node.previous
        let next = node.next
        
        pre?.next = next
        next?.previous = pre
        
        if pre == nil {
            head = node.next
        }
        
        if next == nil {
            tail = node.previous
        }
        
        count -= 1
    }
    
/// 移动到头结点
    func moveToHead(node: Node) {
        
        guard let head = head else {return}
        
        if node.value == head.value {
            return
        }
        
        let pre = node.previous
        let next = node.next
        
        pre?.next = next
        next?.previous = pre
        
        node.next = head
        head.previous = node
        
        self.head = node
        
        if pre == nil {
            return
        }
        
        if next == nil {
            tail = pre
        }
    }
}
