import Foundation

/*
 Generics - is used to avoid writing the same code multiple times
 */


//let's say we want to create a function that performs operations on two Ints
//and then we want to use the same function to work with double
//or Float

func perform<N: Numeric>(_ op: (N, N) -> N, on lhs: N, and rhs: N) -> N {
    op(lhs, rhs)
}

let firstNumber = perform(+, on: 25, and: 34)
type(of: firstNumber)
let secondNumber = perform(-, on: 34.0, and: 20.0)
type(of: secondNumber)
perform(*, on: 8, and: 999)
perform(/, on: 984, and: 236)

//we need to specify that the function is working with numeric protocol and we use a letter N, after N is conforming to the Numeric protocol we chage the data type

//then the compiler will know based on the data we provide the data type



//another way to write a generic function
func perform2<N>(_ op: (N, N) -> N, on lhs: N, and rhs: N) -> N where N: Numeric {
    op(lhs, rhs)
}

perform2(+, on: 25, and: 34)
perform2(-, on: 27, and: 14)
perform2(*, on: 225, and: 1)
perform2(/, on: 248, and: 2)


protocol CanJump {
    func canJump()
}

protocol CanRun {
    func canRun()
}

struct Person: CanJump, CanRun {
    func canJump() {
        "Jumping..."
    }
    
    func canRun() {
        "Running..."
    }
        
}

func jumpAndRun<T: CanJump & CanRun>(value: T) {
    //and now we have acess
    value.canJump()
    value.canRun()
}

let person = Person()
jumpAndRun(value: person)


//we can have extensions on generic types
extension [String] {
    func longestString() -> String? {
        self.sorted { (lhs: String, rhs: String) -> Bool in
            lhs.count > rhs.count
        }.first
    }
}

["Foo", "Bar Baz", "Qux"].longestString()


extension [Int] {
    func average() -> Double {
        Double(self.reduce(0, +)) / Double(self.count)
    }
}

[1, 2, 3, 4].average()

//generic protocols

