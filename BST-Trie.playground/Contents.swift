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

class Trie {
    
    var root = TrieNode(char: "\0", isWord: false)
    
    func insert(word: String) {
        if word.characters.count > 0 {
            var currentNode : TrieNode = self.root
            let wordLength = word.characters.count
            
            for (index, char) in word.characters.enumerated() {
                if currentNode.children[char] == nil {
                    let isWord = wordLength == (index + 1) ? true : false
                }
            }
            
        }
    }
    
}




















