import Foundation

//func add(_ lhs: Int, _ rhs: Int) -> Int {
//    lhs + rhs
//}

let add: (Int, Int) -> Int = {
    (lhs: Int, rhs: Int) -> Int in
    lhs + rhs
}

add(20, 30)

func customAdd(_ lhs: Int, _ rhs: Int, using function: (Int, Int) -> Int) -> Int {
    function(lhs, rhs)
}

customAdd(20, 30, using: { (lhs: Int, rhs: Int) -> Int in
    lhs + rhs
})

/*
 we can do this (up)
 but we have closures optimizations and they include:
 - inferring parameter and return value
 - implicit returns from single expression closures
 - shorthand argument names
 - trailing closure syntax
 */

//taking down the parameter and return value
customAdd(10, 15) { (lhs, rhs) in
    lhs + rhs
}
//trailing closure syntax and simplify the statement with shorthand argument names
customAdd(7, 6) { $0 + $1 }


var ages = [30, 20, 19, 40]

var sortAscending: (Int, Int) -> Bool = { $0 > $1 }

ages.sorted(by: {(lhs: Int, rhs: Int) -> Bool in
    lhs > rhs}
)
ages.sorted(by: <)
ages.sort(by: sortAscending)

