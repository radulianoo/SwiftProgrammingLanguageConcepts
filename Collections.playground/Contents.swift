import Foundation

/*
  Swift provides three primary collection types known as arrays , dictionaries and sets
    - array -> ordered collection of values
    - dictionaries -> unordered collection of key value pairs
    - sets -> unordered collection if unique values
 */

let numbers = [1, 2, 3, 4]
numbers.count
numbers.first
numbers.last
numbers.map(-)

var mutatingNumbers = [4, 5, 6]
mutatingNumbers.append(7)
mutatingNumbers.insert(3, at: 0)
mutatingNumbers.insert(contentsOf: [1, 2], at: 0)

for value in numbers {
    value
}

for value in numbers where value % 2 == 0 {
    value
}

numbers.map { (value: Int) -> Int in
    value * 2
}

let numbers2: [Int?] = [1, 2, nil, 4, 5]
numbers2.count
let notNils = numbers2.filter { (value: Int?) -> Bool in
    value != nil
}

let numbers3 = [1, 2, 1, 2]
numbers3.count

let stuff1 = [1, "Hello", 2, "World"] as [Any]
stuff1.count


//sets

let uniqueNumbers = Set([1,2,1,2,3])
uniqueNumbers.count
uniqueNumbers.map(-)


let myNumbers = Set([1, 2, 3, nil, 5])
let notNilNumbers = Set(myNumbers.compactMap{ $0 })

let stuff3: Set<AnyHashable> = [1, 2, 3, "Octav"]
stuff3.count

let intsInStuff1 = stuff1.compactMap { (value: Any) -> Int? in
    value as? Int
}

let intsInStuff3 = stuff3.compactMap { (value: AnyHashable) -> Int? in
    value as? Int
}

//how does sets calculate uniqueness -> hashable

struct Person: Hashable {
    let id: UUID
    let name: String
    let age: Int
}

let fooId = UUID()
let foo = Person(id: fooId, name: "Foo", age: 20)
let bar = Person(id: fooId, name: "Bar", age: 30)

let people: Set<Person> = [foo, bar]
people.count


struct Person2: Hashable {
    let id: UUID
    let name: String
    let age: Int
    
    //now it will take into consideration only the id property
    func hash(into hasher: inout Hasher) {
        hasher.combine(id)
    }
    
    static func == (lhs: Self, rhs: Self) -> Bool {
        lhs.id == rhs.id
    }
}

let bazID = UUID()
let baz = Person2(id: bazID, name: "Baz", age: 20)
let qux =  Person2(id: bazID, name: "Qux", age: 30)

let people2 = Set([baz, qux])
people2.count


//dictionaries

let userInfo = ["name" : "Foo", "age": 20, "address" : ["line1": "Address line 1", "postCode": "12345"]]  as [String: Any]

userInfo["name"]
userInfo["age"]
userInfo["address"]

for (key, value) in userInfo where value is Int {
    key
    value
}


 
