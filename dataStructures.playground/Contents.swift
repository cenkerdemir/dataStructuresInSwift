//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//MARK: - LINKED LIST

//node class that can be used to build a linked list
class Node {
    var value : Int
    var next : Node?
    
    init(value: Int, nextNode: Node?) {
        self.value = value
        self.next = nextNode
    }
}

