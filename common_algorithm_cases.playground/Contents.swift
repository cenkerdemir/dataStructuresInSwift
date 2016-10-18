//: Playground - noun: a place where people can play

import Foundation

// MARK: - FIBONACCI

//recursive

func fibRec(num: Int) -> Int {
    if num == 0 {
        return 0
    }
    if num == 1 {
        return 1
    }
    return fibRec(num: num - 1) + fibRec(num: num - 2)
}

let test = fibRec(num: 10)
print(test)

//iterative

func fibIte(num: Int) {
    
    for <#item#> in <#items#> {
        <#code#>
    }
    
}