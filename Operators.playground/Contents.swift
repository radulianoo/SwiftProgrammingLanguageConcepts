import Foundation

//operators are small functions which can perform certain operations

/*
 Operators are :
 -unary (!b, prefix & b! postfix)
 -binary (2+3)
 -ternary (W ? T : F)
 */

let myAge = 34
let yourAge = 20

if myAge > yourAge {
    print("I'm older than you")
} else if myAge < yourAge {
    print("I'm younger than you")
} else {
    print("We are the same age.")
}

let myMothersAge = myAge + 30
let doubleMyAge = myAge * 2

//unary prefix
let foo = !true

//unary postfix
let name = Optional("Octav")
type(of: name)
let unaryPostFix = name!
type(of: unaryPostFix)

//binary infix
let result = 1 + 2
let names = "Foo" + " " + "Bar"


//ternary operator

let age = 30
let message = age >= 18 ? "You are an adult" : "You are not yet an adult"
type(of: message)
print(message)

