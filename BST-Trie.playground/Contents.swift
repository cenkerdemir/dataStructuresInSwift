//: Playground - noun: a place where people can play

import Foundation


// a factorial function using recursion. It has almost nothing to do with the rest of this file
func myFactorial(number: IntMax) -> IntMax {
    if number <= 1 {
        return 1
    }
    return number * myFactorial(number: number - 1)
}

print(myFactorial(number: 9))

///////////////////////////////////////////////////////////

//MARK: - BST

//tree node class
class TreeNode {
    var data: Int
    
    var left : TreeNode?
    var right : TreeNode?
    
    init(data: Int) {
        self.data = data
    }
}

//insert function to build the tree
func insert(root: TreeNode?, node: TreeNode ) {
    
    guard let root = root else {return}
    
    if root.data > node.data {
        if root.left == nil {
            root.left = node
        }
        else {
            insert(root: root.left, node: node)
        }
    }
    else {
        if root.right == nil {
            root.right = node
        }
        else {
            insert(root: root.right, node: node)
        }
    }
}


//test the BST
func printTreeInOrder(root: TreeNode?) {
    
    guard let root = root else {return}
    
    printTreeInOrder(root: root.left)
    print(root.data)
    printTreeInOrder(root: root.right)
}


let root = TreeNode(data: 9)

insert(root: root, node: TreeNode(data: 7))
insert(root: root, node: TreeNode(data: 11))
insert(root: root, node: TreeNode(data: 5))
insert(root: root, node: TreeNode(data: 15))
insert(root: root, node: TreeNode(data: 21))
insert(root: root, node: TreeNode(data: 6))
printTreeInOrder(root: root)


//MARK: - Trie

//trie node
class TrieNode {
    
    // every trie has a character that will be a part of the word
    var char : Character = "\0"
    
    // a flag to mark the character that completes the word
    var isWord = false
    
    //each trie node will have children. this is a dictionary and the keys are characters values are trie nodes
    var children = [Character : TrieNode]()
    
    // initializer that takes the character and isWord flag as arguments
    init(char: Character, isWord: Bool) {
        self.char = char
        self.isWord = isWord
    }
    
}


//trie class
class Trie {
    
    var root = TrieNode(char: "\0", isWord: false)
    
    // insert function.
    func insert(word: String) {
        if word.characters.count > 0 {
            var currentNode = self.root
            let wordLength = word.characters.count
            
            for (index, char) in word.characters.enumerated() {
                if currentNode.children[char] == nil {
                    let isWord = wordLength == (index + 1) ? true : false
                    currentNode.children[char] = TrieNode(char: char, isWord: isWord)
                }
                else {
                    continue
                }
                currentNode = currentNode.children[char]!
            }
        }
    }
    
    //find function
    func find(word: String) -> Bool {
        if word.characters.count > 0 {
            var currentNode = self.root
            
            for char in word.characters {
                if currentNode.children[char] == nil {
                    return false
                }
                else {
                    if currentNode.children[char]!.isWord == true {
                        return true
                    }
                    else {
                       currentNode = currentNode.children[char]!
                    }
                }
            }
        }
        return false
    }
    
}



// test the trie implementation

let trie = Trie()

trie.insert(word: "Cenker")
trie.find(word: "Cenker")
trie.insert(word: "Helen")
trie.find(word: "Melen")
trie.find(word: "Helen")
trie.insert(word: "Demir")
trie.find(word: "Demir")
trie.insert(word: "Carsamba")

//this is a recursive print function to print the characters in the trie.
func printAllTrieChildren(node: TrieNode) {
    print(node.char)
    for (char) in node.children.keys {
        printAllTrieChildren(node: node.children[char]!)
    }
}

printAllTrieChildren(node: trie.root)

// MARK: - Graph

class Vertex {
    var key : String?
    var neighbors : [Edge]
    
    init() {
        self.neighbors = [Edge]()
    }
    
    init(key: String) {
        self.key = key
        self.neighbors = [Edge]()
    }
}

class Edge {
    var neightbor : Vertex
    var weight : Int
    
    init() {
        self.weight = 0
        self.neightbor = Vertex()
    }
}

class Graph {
    
    var canvas : [Vertex]
    var isDirected : Bool
    
    init() {
        self.canvas = [Vertex]()
        self.isDirected = true
    }
    
    func addVertex(key: String) -> Vertex {
        //create a vertex with the key
        let childVertex : Vertex = Vertex(key: key)
        
        //add vertex to graph canvas
        canvas.append(childVertex)
        
        return childVertex
    }
    
    func addEdge(source: Vertex, neighbor: Vertex, weight: Int) {
        
        //create a new edge
        let newEdge = Edge()
        newEdge.neightbor = neighbor
        newEdge.weight = weight
        
        source.neighbors.append(newEdge)
        
        if isDirected == false {
            let reverseEdge = Edge()
            reverseEdge.neightbor = source
            reverseEdge.weight = weight
            neighbor.neighbors.append(reverseEdge)
        }
    }
}

//test the graph code
let graph = Graph()

let vertex1 = graph.addVertex(key: "A")
let vertex2 = graph.addVertex(key: "B")
let vertex3 = graph.addVertex(key: "C")
let vertex4 = graph.addVertex(key: "D")
let vertex5 = graph.addVertex(key: "E")

graph.addEdge(source: vertex1, neighbor: vertex2, weight: 5)
graph.addEdge(source: vertex1, neighbor: vertex3, weight: 1)
graph.addEdge(source: vertex1, neighbor: vertex5, weight: 11)
graph.addEdge(source: vertex2, neighbor: vertex4, weight: 1)
graph.addEdge(source: vertex4, neighbor: vertex5, weight: 2)


// printing graph vertices, edges, and their weight
for vertex in graph.canvas {
    for neighbor in vertex.neighbors {
        print("\(vertex.key!) is connected to \(neighbor.neightbor.key!) and the weight is \(neighbor.weight)")
    }
}



























