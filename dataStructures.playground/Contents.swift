//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

//MARK: - LINKED LIST

//node class that can be used to build a linked list. the node just stores an int value.
class Node
{
    var value : Int
    var next : Node?
    
    init(value: Int, nextNode: Node?)
    {
        self.value = value
        self.next = nextNode
    }
}


// create nodes
let root = Node(value: 5, nextNode: nil)
let second = Node(value: 9, nextNode: nil)
let third = Node(value: 2, nextNode: nil)
let fourth = Node(value: 8, nextNode: nil)

root.next = second
second.next = third
third.next = fourth


// print out the values via a loop
var currentNode = root

while currentNode.next != nil
{
    print(currentNode.value)
    currentNode = currentNode.next!
}
print(currentNode.value)


// a more elegant solution - create a linked list class
class Linkedlist
{
    var root : Node?
    
    func add(node: Node)
    {
        if root == nil
        {
            self.root = node
        }
        else
        {
            var currentNode = self.root!
            while currentNode.next != nil
            {
                currentNode = currentNode.next!
            }
            currentNode.next = node
        }
    }
    
    func printNodes() -> String
    {
        var result = ""
        if self.root == nil
        {
            result = "linked list is empty"
        }
        else
        {
            var currentNode = self.root!
            result = "\(currentNode.value)"
            while currentNode.next != nil
            {
                currentNode = currentNode.next!
                result += " \(currentNode.value)"
            }
        }
        return result
    }
}


let list = Linkedlist()
let root2 = Node(value: 5, nextNode: nil)
let second2 = Node(value: 9, nextNode: nil)
let third2 = Node(value: 2, nextNode: nil)
let fourth2 = Node(value: 8, nextNode: nil)
list.add(node: root2)
list.add(node: second2)
list.add(node: third2)
list.add(node: fourth2)
print(list.printNodes())

