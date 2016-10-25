//: Playground - noun: a place where people can play

import Foundation

// MARK: - FIBONACCI

//RECURSIVE

//basic recursive
func fibRec(num: Int) -> Int {
    if num == 0 {
        return 0
    }
    if num == 1 {
        return 1
    }
    return fibRec(num: num - 1) + fibRec(num: num - 2)
}

//let test = fibRec(num: 10)
//print(test)

//fibonacci memoize - using a dictionary to improve the recursive method's performance (performance is around O(N) )
var map = [0:0, 1:1]

func fibonacciMemoize(n:Int) -> Int {
    if let value = map[n] {
        return value
    }
    else {
        let f = fibonacciMemoize(n: n - 1) + fibonacciMemoize(n: n - 2)
        map[n] = f
        return f
    }
}

print(fibonacciMemoize(n: 10))
print(map)

//ITERATIVE

func fibIte(num: Int) -> Int {
    if num <= 0 {
        return 0
    }
    if num <= 2 {
        return 1
    }
    var fibs = [0,1,1]
    for i in 3...num {
        fibs.append(fibs[i-1] + fibs[i-2])
    }
    //print(fibs)
    return fibs[num]
}

//print(fibIte(num: 40))

//2nd way iterative - a better way in my opinion

func fibIte2(num : Int) -> Int {
    if num == 0 {
        return 0
    }
    if num == 1 {
        return 1
    }
    
    var sum = 1
    var previous = 0
    
    for _ in 2...num {
        let newSum = sum + previous
        previous = sum
        sum = newSum
    }
    return sum
}

//print(fibIte2(num: 91))

//MARK: - FIZZBUZZ
//////////////////////////////////////////////////////////

func fizzBuzz(num: Int) {
    
    for i in 0...num {
        var fizzBuzzStr = ""
        if i % 3 == 0 {
            fizzBuzzStr += "Fizz"
        }
        if i % 5 == 0 {
            fizzBuzzStr += "Buzz"
        }
        if fizzBuzzStr.characters.count == 0 {
            fizzBuzzStr = String(i)
        }
        print(fizzBuzzStr)
    }
}

//fizzBuzz(num: 100)

///////////////////////////////////////////////////////////

// MARK: - REVERSED LINKED LIST

class Node {
    var value : Int
    var next: Node?
    
    init(value: Int, nextNode: Node?) {
        self.value = value
        self.next = nextNode
    }
}

class LinkedList {
    var root : Node?
    
    func add (node : Node?) {
        if root == nil {
            self.root = node
        }
        else {
            var currentNode = root!
            while currentNode.next != nil {
                currentNode = currentNode.next!
            }
            currentNode.next = node
        }
    }
    
    
    func printNodes() -> String {
        if root == nil {
            return "the list is empty"
        }
        else {
            var currentNode = root!
            var nodes = "\(currentNode.value)"
            while currentNode.next != nil {
                currentNode = currentNode.next!
                nodes += " \(currentNode.value)"
            }
            return nodes
        }
    }
    
    func reverseLinkedList() {
        if self.root != nil {
            var currentNode : Node? = root
            var previousNode : Node?
            
            while currentNode != nil {
                let next = currentNode!.next
                currentNode!.next = previousNode
                previousNode = currentNode
                currentNode = next
            }
            self.root = previousNode
        }
    }
}

let list = LinkedList()
let root = Node(value: 5, nextNode: nil)
let second = Node(value: 9, nextNode: nil)
let third = Node(value: 2, nextNode: nil)
let fourth = Node(value: 8, nextNode: nil)
list.add(node: root)
list.add(node: second)
list.add(node: third)
list.add(node: fourth)
print(list.printNodes())

list.reverseLinkedList()
print(list.printNodes())

list.reverseLinkedList()
print(list.printNodes())


// MARK: - Two Sums in an array












