import Foundation

let firstName: String? = "Foo "
let lastName: String? = "Bar"

//if we wnat to combine these two values we will get an error
//let fullName = firstName + lastName

//binary infix custom operator

func + (lhs: String?, rhs: String?) -> String? {
    switch (lhs, rhs) {
    case (.none, .none):
        return nil
    case let (.some(value), .none), let (.none, .some(value)):
        return value
    case let (.some(lhs), .some(rhs)):
        return lhs + rhs
    }
}

let fullName = firstName + lastName

//unary prefix custom operator

let lowercaseName = "Foo Bar"

//tell swift that is a prefix operator (define)
prefix operator ^
//create the function
prefix func ^ (value: String) -> String {
    value.uppercased()
}

let uppercaseName = ^lowercaseName


//unary postfix custom operator

postfix operator *
postfix func * (value: String) -> String {
    "*** \(value) ***"
}

let withStars = lowercaseName*


//binary infix operator to work with 2 unrelated types

struct Person {
    let name: String
}

struct Family {
    let members: [Person]
}

let mom = Person(name: "Mom")
let dad = Person(name: "Dad")
let son = Person(name: "Son")
let daugter1 = Person(name: "Daugter1")
let daugter2 = Person(name: "Daugter2")


//let family = mom + dad

func + (lhs: Person, rhs: Person) -> Family {
    Family(members: [lhs, rhs])
}

let family = mom + dad
family.members.count

func + (lhs: Family, rhs: Person) -> Family {
    var members = family.members
    members.append(rhs)
    return Family(members: members)
}

let familyWithSon = family + son
familyWithSon.members.count

//but what if we want to add an array of persons

func + (lhs: Family, rhs: [Person]) -> Family {
    var members = lhs.members
    members.append(contentsOf: rhs)
    return Family(members: members)
}

let wholeFamily = familyWithSon + [daugter1, daugter2]

