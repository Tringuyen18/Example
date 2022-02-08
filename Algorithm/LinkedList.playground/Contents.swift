import UIKit
import Foundation

// MARK: - Node
class Node<Value> {
    var value: Value
    var next: Node?
    
    init(value: Value, next: Node? = nil) {
        self.value = value
        self.next = next
    }
}

extension Node: CustomStringConvertible {
    var description: String {
        guard let next = next else {
            return "\(value)"
        }
        return "\(value) -> " + String(describing: next) + " "
    }
}

let node1 = Node(value: 1)
let node2 = Node(value: 2)
let node3 = Node(value: 3)

node1.next = node2
node2.next = node3



struct LinkedList<Value> {
    
    var head: Node<Value>?
    var tail: Node<Value>?
    
    init() {}
    
    var isEmpty: Bool { // check
        head == nil
    }
    
}

extension LinkedList: CustomStringConvertible {
    
    var description: String {
        guard let head = head else {
            return "Empty List"
        }
        return String(describing: head)
    }
    
    // Push
    mutating func push(_ value: Value) {
        head = Node(value: value, next: head)
        if tail == nil {
            tail = head
        }
    }
    
    // Append
    mutating func append(_ value: Value) {
        guard !isEmpty else {
            push(value)
            return
        }
        
        tail!.next = Node(value: value)
        tail = tail!.next
    }
    
    // Insert
    //1
    @discardableResult
    mutating func insert(_ value: Value, after node: Node<Value>) -> Node<Value> {
       
        // 2
        guard tail !== node else {
            append(value)
            return tail!
        }
        
        // 3
        node.next = Node(value: value, next: node.next)
        return node.next!
    }
    
    // Insert
    // Find
    // inserting New Node
    func node(at index: Int) -> Node<Value>? {
        var currentNode = head
        var currentIndex = 0
        
        while currentNode != nil && currentIndex < index {
            currentNode = currentNode!.next
            currentIndex += 1
        }
        
        return currentNode
    }
}

var list = LinkedList<Int>()
list.push(3)
list.push(2)
list.push(1)

list.append(4)
list.append(5)
list.append(6)

print("Before inserting: \(list)")
var middleNode = list.node(at: 1)!
for _ in 1...4 {
    middleNode = list.insert(-1, after: middleNode)
}
print("After inserting: \(list)")

print(list)
