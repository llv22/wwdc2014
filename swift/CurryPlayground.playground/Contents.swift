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


