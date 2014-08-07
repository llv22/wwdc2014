// Playground - noun: a place where people can play

import Cocoa


/**
* recurisve algorithm
*/
func memoize<T: Hashable, U>( body: (T)->U ) -> (T)->U {
var memo = Dictionary<T, U>()
return { x in
if let q = memo[x] { return q }
let r = body(x)
memo[x] = r
return r
}
}

/*
let fibonacci: (Int)->Double = memoize{
fibonacci, n in
n < 2 ? Double(n) : fibonacci(n-2) + fibonacci(n-1)
}
*/
let fibonacci: (Int)->Int = memoize{
    fibonacci, n in
    n < 2 ? n : fibonacci(n-2) + fibonacci(n-1)
}

//fibonacci(3)

/**
* recursive algorithm - fail to run successfully, take part 1
*/
func memoize<T: Hashable, U>( body: (T)->U ) -> (T)->U {
    var memo = Dictionary<T, U>()
    return { x in
        if let q = memo[x] { return q }
        let r = body(x)
        memo[x] = r
        return r
    }
}
var fibonacci: (Int)->Double = { Double($0) }
fibonacci = memoize {
    (n: Int) in
    n < 2 ? Double(n) : fibonacci(n-2) + fibonacci(n-1)
}
fibonacci(3)

let φ = fibonacci(45) / fibonacci(44)

///**
//* recursive algorithm - take part 2
//*/
func memoize2<T: Hashable, U>( body: ((T)->U, T)->U ) -> (T)->U {
    var memo = Dictionary<T, U>()
    var result: ((T)->U)! // for declaration in reference in recursive memo
    result = { x in
        if let q = memo[x] { return q }
        let r = body(result, x)
        memo[x] = r
        return r
    }
    return result
}
let fibo = memoize2 { (fib, x: Int) in x < 2 ? Double(x) : fib(x - 2) + fib(x - 1) }

let φ2 = fibo(45) / fibo(44)