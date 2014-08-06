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

fibonacci(3)
