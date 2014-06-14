// Playground - noun: a place where people can play

import Cocoa

var str = "Hello, playground"

println(str)

for var l = 1; l < 10; l++
{
    println(l)
}

let fibonacci: (Int)->Double = memoize{
    fibonacci, n in
    n < 2 ? Double(n) : fibonacci(n-2) + fibonacci(n-1)
}


fibonacci(10)
