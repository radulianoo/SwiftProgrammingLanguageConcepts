import Foundation

/*
 Optionals - we use optionals in swift when a value can exist or not (if not = nil)
 */

func multiplyByTwo(_ value: Int? = nil) -> Int {
    if let value {
        return value * 2
    } else {
        return 0
    }
}

multiplyByTwo()
multiplyByTwo(nil)
multiplyByTwo(4)
multiplyByTwo(8)

//we can compare optionals to nil
let age: Int? = nil

if age != nil {
    "Age is there."
} else {
    "Age is nil."
}

if let age  {
    "Age is there. How odd! It's value is \(age)"
} else {
    "No age is present. As expected."
}

//use guard
func checkAge() {
    guard age != nil else {
        //we are checking with guard
        "Age is nil as expected"
        return
    }
    "Age is not nil here. Strange!"
}

checkAge()

//using guard we can also unwrap optionals

let age2: Int? = 0

func checkAge2() {
    guard let age2 else { return }
    "Age is \(age2)"
}

checkAge2()


//optionals are an instance of an enumeration
switch age {
    
case .none:
    "Age has no value as expected"
case let .some(value):
    "Age has the value of \(value)"
}
