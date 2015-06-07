//: Playground - curry: play with currying in swift

import Cocoa

func addTwoNumbers(a: Int)(b: Int) -> Int {
    return a + b;
}

let addToFour = addTwoNumbers(4)
let result = addToFour(b:6)

func greaterThan(comparor: Int)(input: Int) -> Bool {
    return input > comparor
}

let greaterThan10 = greaterThan(10)
greaterThan10(input: 13)
greaterThan10(input: 5)

//see: curring for target-action selector in swift, by Ole Begemann
protocol TargetAction {
    func performAction()
}

struct TargetActionWrapper<T: AnyObject>: TargetAction {
    weak var target: T?
    let action: (T)->()->()
    
    func performAction() -> (){
        if let t = target {
            action(t)()
        }
    }
}

enum ControlEvent {
    case TouchUpInside
    case ValueChanged
    // ...
}

class Control {
    var actions = [ControlEvent: TargetAction]()
    
    func setTarget<T: AnyObject>(target: T, action: (T) -> () -> (), controlEvent: ControlEvent) {
        actions[controlEvent] = TargetActionWrapper(target: target, action: action)
    }
    
    func removeTargetForControlEvent(controlEvent: ControlEvent) {
        actions[controlEvent] = nil
    }
    
    func performActionForControlEvent(controlEvent: ControlEvent) {
        actions[controlEvent]?.performAction()
    }
}

//see : https://robots.thoughtbot.com/introduction-to-function-currying-in-swift
let xs = 1...100
func add(a: Int)(b: Int) -> Int {
    return a + b
}
let x = xs.map(add(2))

//see : if don't own object
extension NSNumber {
    class func add(a: NSNumber, b: NSNumber) -> NSNumber {
        return NSNumber(integer: a.integerValue + b.integerValue);
    }
}
func curry(localAdd: (NSNumber, NSNumber) -> NSNumber) -> (NSNumber -> (NSNumber -> NSNumber)) {
    return {
        a in {
            b in
            return localAdd(a, b)
        }
    }
}
let curriedAdd = curry(NSNumber.add)
let addTwo = curriedAdd(2)
//var xs1 = Array<NSNumber>(count: 100, repeatedValue: 1)
var xs0 = [NSNumber]()
for i in xs {
    xs0.append(NSNumber(integer: i))
}
let xs1 = xs0
let x1 = xs1.map(addTwo)

func gcurry<A, B, C>(f: (A, B) -> C) -> (A -> (B -> C)) {
    return {
        a in {
            b in
            return f(a, b)
        }
    }
}
let gadd = gcurry(NSNumber.add)
let x2 = xs1.map(gadd(2))