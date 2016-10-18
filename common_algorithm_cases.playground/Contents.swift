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

//let test = fibRec(num: 10)
//print(test)

//iterative

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


//print(fibIte2(num: 40))

//



















