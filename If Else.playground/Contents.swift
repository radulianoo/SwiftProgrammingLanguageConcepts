import Foundation

/*
 If else - conditionals
 */

let myName = "Octav"
let myAge = 34
let yourName = "Foo"
let yourAge = 20

if myName == "octav" {
    "Your name is \(myName)"
} else {
    "Oops, I guessed it wrong"
}

if myName == "Octav" {
    "Now I guessed it correctly"
} else if myName == "Foo" {
    "Are you Foo?"
} else {
    "I give up!"
}


if myName == "Octav" && myAge == 34 {
    "Name is \(myName) and my age is \(myAge)"
} else if myAge == 20 {
    "I only guessed the age right"
} else {
    "I don't knwo what I'm doing"
}


if myAge == 34 || myName == "Foo" {
    "Either age is 20, name is Foo or both"
} else if myName == "Octav" || myAge == 20 {
    "It's too late to get in this clause."
}

