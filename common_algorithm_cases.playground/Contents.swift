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
        print(fizzBuzzStr + " " + String(i))
    }
}

fizzBuzz(num: 100)

///////////////////////////////////////////////////////////




















