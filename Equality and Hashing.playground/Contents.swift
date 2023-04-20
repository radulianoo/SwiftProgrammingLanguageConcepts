import Foundation

/*
 In Swift equality is provided by protocol Equatable
 Hashable - atype that can be hashed into a hasher to produce an integer value
 */

struct Person: Equatable {
    let id: String
    let name: String
}

let foo1 = Person(id: "1", name: "Foo")
let foo2 = Person(id: "1", name: "Bar")

if foo1 == foo2 {
    "They are equal!"
} else {
    "They are not equal!"
}

//in swift we can override equality
extension Person {
    // self != Self ??
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}


//we can implement equality also in enum

enum AnimalType {
    case dog(breed: String)
    case cat(breed: String)
}

let dog1 =  AnimalType.dog(breed: "Labradoodle")
let dog2 =  AnimalType.dog(breed: "Labradoodle")

if dog1 == dog2 {
    //conform the enum to equatable
    "They have the same breed"
} else {
    "They don't have the same breed"
}

extension AnimalType: Equatable {
    static func == (lhs: Self, rhs: Self) -> Bool {
        switch (lhs, rhs) {
        case let (.dog(lhsBreed), .dog(rhsBreed)) :
            return lhsBreed == rhsBreed
        case let (.cat(lhsBreed), .cat(rhsBreed)) :
            return lhsBreed == rhsBreed
        default:
            return false
        }
    }
}

struct Animal: Equatable {
    let name: String
    let type: AnimalType
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.type == rhs.type
    }
}

let cat1 = Animal(name: "Wiskers", type: .cat(breed: "Street cat"))
let cat2 = Animal(name: "Whoosh", type: .cat(breed: "Street cat"))

if cat1 == cat2 {
    "They are equal because of their type"
} else {
    "They have diffrerent breeed"
}


//hashable

struct House: Hashable {
    let number: Int
    let numberOfBedrooms: Int
}

let house1 = House(number: 123, numberOfBedrooms: 2)
house1.hashValue

let house2 = House(number: 124, numberOfBedrooms: 3)
house2.hashValue

let housesSet = Set([house1, house2])

//override hashable

struct NumberedHouse: Hashable {
    let number: Int
    let numberOfBedrooms: Int
    //hash value is the same
    func hash(into hasher: inout Hasher) {
        hasher.combine(number)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.number == rhs.number
    }
}

let house3 = NumberedHouse(number: 123, numberOfBedrooms: 2)
let house4 = NumberedHouse(number: 123, numberOfBedrooms: 3)

let house3And4 = Set([house3, house4])
house3.hashValue
house4.hashValue


//enums are hashable and equatable even without raw values

enum CarPart {
    case roof
    case tire
    case trunk
}

let uniqueParts: Set<CarPart> = [.roof, .tire, .roof, .trunk]

//if we have a enum with raw values you can change the hashable mecanism by yourself

enum HouseType: Hashable {
    case bigHouse(NumberedHouse)
    case smallHouse(NumberedHouse)
}

let bigHouse1 = HouseType.bigHouse(NumberedHouse(number: 1, numberOfBedrooms: 1))
let bigHouse2 = HouseType.bigHouse(NumberedHouse(number: 1, numberOfBedrooms: 1))
let smallHouse1 = HouseType.smallHouse(NumberedHouse(number: 1, numberOfBedrooms: 1))

let allHouses: Set<HouseType> = [bigHouse1, bigHouse2, smallHouse1]
