//: Playground - noun: a place where people can play

import Foundation

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


//MARK: - QUEUE  (FIFO : First In First Out)

// it is possible to use linked lists to create a queue but it is faster and easier to use arrays


var queueArray = [2, 5, 7, 8, 9, 12, 6]

//enqueue
queueArray.append(4)
print(queueArray)

//dequeue
queueArray.removeFirst()
print(queueArray)

// a basic queue class
class Queue {
    var queue = [Int]()
    
    func enqueue(value: Int) {
        queue.append(value)
    }
    
    func dequeue() -> Int? {
        if queue.count > 0 {
            return queue.removeFirst()
        }
        return nil
    }
}

let intQueue = Queue()
intQueue.enqueue(value: 5)
intQueue.enqueue(value: 9)
intQueue.enqueue(value: 3)

print(intQueue.queue)

let firstRemovedIntFromQueue = intQueue.dequeue()
print(intQueue.queue)


// a queue using a linked list
class LinkedListQueue {
    
    var linkedListQueue = Linkedlist()
    
    func enqueue(node: Node) {
        linkedListQueue.add(node: node)
    }
    
    func dequeue() -> Node? {
        if linkedListQueue.root != nil {
            let dequeuedNode = linkedListQueue.root
            if linkedListQueue.root?.next == nil {
                linkedListQueue.root = nil
            }
            else {
                linkedListQueue.root = linkedListQueue.root?.next
            }
            dequeuedNode?.next = nil
            return dequeuedNode
        }
        return nil
    }
}

var LLQueue = LinkedListQueue()

let rootNodeForQueue = Node(value: 12, nextNode: nil)
LLQueue.enqueue(node: rootNodeForQueue)
print(LLQueue.linkedListQueue.printNodes())

LLQueue.dequeue()
print(LLQueue.linkedListQueue.printNodes())

LLQueue.enqueue(node: rootNodeForQueue)
print(LLQueue.linkedListQueue.printNodes())

let secondNodeForQueue = Node(value: 29, nextNode: nil)
LLQueue.enqueue(node: secondNodeForQueue)
print(LLQueue.linkedListQueue.printNodes())

let thirdNodeForQueue = Node(value: 35, nextNode: nil)
LLQueue.enqueue(node: thirdNodeForQueue)
print(LLQueue.linkedListQueue.printNodes())

LLQueue.dequeue()
print(LLQueue.linkedListQueue.printNodes())

LLQueue.enqueue(node: rootNodeForQueue)
print(LLQueue.linkedListQueue.printNodes())

LLQueue.dequeue()
print(LLQueue.linkedListQueue.printNodes())

LLQueue.enqueue(node: secondNodeForQueue)
print(LLQueue.linkedListQueue.printNodes())

LLQueue.dequeue()
print(LLQueue.linkedListQueue.printNodes())

LLQueue.enqueue(node: thirdNodeForQueue)
print(LLQueue.linkedListQueue.printNodes())


//MARK: - STACK (LIFO: Last In First Out)

var stackArray = [2, 4, 5, 7, 3, 9]

// push
stackArray.append(12)
print(stackArray)

//pop
stackArray.removeLast()
print(stackArray)

class Stack {
    
    var stack = [Int]()
    
    func push(value: Int) {
        stack.append(value)
    }
    
    func pop() -> Int? {
        if stack.count > 0 {
            return stack.removeLast()
        }
        return nil
    }
    
}

var stackWithArray = Stack()

stackWithArray.push(value: 3)
stackWithArray.push(value: 6)
stackWithArray.push(value: 19)
print(stackWithArray.stack)

let popedValue = stackWithArray.pop()
print(popedValue!)
print(stackWithArray.stack)


// stack implementation with a linked list
class StackWithLinkedList {
    
    var stackLinkedList = Linkedlist()
    
    func push(node: Node) {
        stackLinkedList.add(node: node)
    }
    
    func pop() -> Node? {
        if stackLinkedList.root == nil {
            return nil
        }
        else if stackLinkedList.root!.next == nil {
            let nodeTobePoped = stackLinkedList.root!
            stackLinkedList.root = nil
            return nodeTobePoped
        }
        else {
            var currentNode = stackLinkedList.root!
            var previousNode = currentNode
            while currentNode.next != nil {
                previousNode = currentNode
                currentNode = currentNode.next!
            }
            previousNode.next = nil
            return currentNode
        }
    }
}

var LLStack = StackWithLinkedList()

let rootNodeForStack = Node(value: 1, nextNode: nil)
LLStack.push(node: rootNodeForStack)
print(LLStack.stackLinkedList.printNodes())

let secondNodeForStack = Node(value: 2, nextNode: nil)
LLStack.push(node: secondNodeForStack)
print(LLStack.stackLinkedList.printNodes())

let thirdNodeForStack = Node(value: 3, nextNode: nil)
LLStack.push(node: thirdNodeForStack)
print(LLStack.stackLinkedList.printNodes())

LLStack.pop()
print(LLStack.stackLinkedList.printNodes())

LLStack.pop()
print(LLStack.stackLinkedList.printNodes())

LLStack.pop()
print(LLStack.stackLinkedList.printNodes())

LLStack.pop()
print(LLStack.stackLinkedList.printNodes())

LLStack.push(node: rootNodeForStack)
print(LLStack.stackLinkedList.printNodes())

LLStack.push(node: secondNodeForStack)
print(LLStack.stackLinkedList.printNodes())

LLStack.push(node: thirdNodeForStack)
print(LLStack.stackLinkedList.printNodes())






