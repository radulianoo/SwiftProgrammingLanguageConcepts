import Foundation

/*
 Exension - add new functionality to an existing class, structure, enumeration or protocol type
 */

extension Int {
    func plusTwo() -> Int {
        self + 2
        //self inside an extension refers to the current instance
    }
}

let two = 2
two.plusTwo()


struct Person {
    let firstName: String
    let lastName: String
    //if we want to add a contructor/init
    //to create the full name in a struct we will lose the memberwise init
}

//let person = Person(firstName: <#T##String#>, lastName: <#T##String#>)

//so in order to have both contructors/inits -> we can do it with a extension
extension Person {
    init(fullName: String) {
        let components = fullName.components(separatedBy: " ")
        self.init(firstName: components.first ?? fullName,
                  lastName: components.last ?? fullName)
    }
}

//let person2 = Person(fullName: <#T##String#>)
//let person3 = Person(firstName: <#T##String#>, lastName: <#T##String#>)

let person = Person(fullName: "Foo Bar")
person.firstName
person.lastName


class MyDouble {
    let value: Double
    init(value: Double) {
        self.value = value
    }
}

extension MyDouble {
    convenience init() {
        self.init(value: 0)
    }
}


let myDouble = MyDouble()
myDouble.value

