// Playground - noun: evlovation for fibonacci based on wwdc2014 session 404, advanced swift

import Cocoa

/*
* 1, recursive with non-memoize, middle across can't be adapted
*
func fibonacci_nonmemoize(n: Int) -> Double {
return n < 2 ? Double(n) : fibonacci_nonmemoize(n-1) + fibonacci_nonmemoize(n-2)
}
fibonacci_nonmemoize(20)
*/

/*
* 2, recursive with manual memooize
*/
var fibonacci_manualmem = Dictionary<Int, Double>()
func fibonacci_mm(n: Int) -> Double{
    if let result = fibonacci_manualmem[n] {
        return result
    }
    let result = n < 2 ? Double(n) : fibonacci_mm(n-1) + fibonacci_mm(n-2)
    fibonacci_manualmem[n] = result
    return result
}
fibonacci_mm(20)

