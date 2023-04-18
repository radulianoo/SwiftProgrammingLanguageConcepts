import Foundation

///Functions
///reusable block of code

func noArgumentsAndNoReturnValues() {
    "i don't know what i'm doing"
}

//calling the function
noArgumentsAndNoReturnValues()

//function that takes an internal value
func plusTwo(value: Int) {
    let newValue = value + 2
}

plusTwo(value: 30)

//function that takes a value and retruns a value
func newPlusTwo(value: Int) -> Int {
    value + 2
}

newPlusTwo(value: 30)

//function with two values that returns a combined one
func customAdd(value1: Int, value2: Int) -> Int {
    value1 + value2
}

let customAdded = customAdd(value1: 2, value2: 3)

//functions can have two labels for each value
func customAdd2(external1 internal1: Int, external2 internal2: Int) -> Int {
    internal1 + internal2
}

let customAdded2 = customAdd2(external1: 2, external2: 3)

//we can ommit the external label
func customMinus(_ lhs: Int, _ rhs: Int) -> Int {
    lhs - rhs
}

let customSubtracted = customMinus(20, 10)


//functions can have functions inside
func doSomethingComplicated(with value: Int) -> Int {
    func mainLogic(value: Int) -> Int {
        value + 2
    }
    return mainLogic(value: value + 3)
}

doSomethingComplicated(with: 55)

//arguments can have a default value
func getFullName(firstName: String = "Foo", lastName: String = "Bar") -> String {
    "\(firstName) \(lastName)"
}

//in this case we can call the function in 4 ways
getFullName()
getFullName(firstName: "Baz")
getFullName(lastName: "Foo")
getFullName(firstName: "Baz", lastName: "Qux")

