//: Playground - noun: a place where people can play

import Foundation

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
    
    //null character
    var char : Character = "\0"
    
    //flag
    var isWord = false
    
    //dictionary
    var children = [Character : TrieNode]()
    
    init(char: Character, isWord: Bool) {
        self.char = char
        self.isWord = isWord
    }
}

//trie class
class Trie {
    
    var root = TrieNode(char: "\0", isWord: false)
    
    func insert(word: String) {
        if word.characters.count > 0 {
            var currentNode : TrieNode = self.root
            let wordLength = word.characters.count
            
            for (index, char) in word.characters.enumerated() {
                if currentNode.children[char] == nil {
                    let isWord = wordLength == (index + 1) ? true : false
                    currentNode.children[char]  = TrieNode(char: char, isWord: isWord)
                }
                else {
                    continue
                }
                currentNode = currentNode.children[char]!
            }
        }
    }
    
    func find(word: String) -> Bool {
        if word.characters.count > 0 {
            var currentNode : TrieNode = self.root
            
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
trie.find(word: "Cenker") //returns true

trie.find(word: "Demir") //returns false

trie.insert(word: "Demir")
trie.find(word: "Demir") //now returns true

trie.insert(word: "Helen")
trie.insert(word: "Zonguldak")

var node = trie.root

//this is a recursive print function to print the characters in the trie.
func printAllTrieChildren(node: TrieNode) {
    print(node.char)
    for (char) in node.children.keys {
        printAllTrieChildren(node: node.children[char]!)
    }
}

printAllTrieChildren(node: node)

//bonus :-) a factorial function using recursion. do not go over 20 though, the number will get too big and your code might crash...
func myFactorial(number: IntMax) -> IntMax {
    if number <= 1 {
        return 1
    }
    return number * myFactorial(number: number - 1)
}

print(myFactorial(number: 9))









