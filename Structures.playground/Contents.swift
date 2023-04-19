import Foundation

/*
 
 Structures - a way of grouping data together , think they are a blueprint/way to create objects with properties and methods
            - they are value types (the data is copied over)
            - memberwise init (you get it from the compiler)
 
 */

struct Person {
    //property
    let name: String
    let age: Int
}

//we can instantiate the struct
//below we created an instance of the struct called person with two properties
let foo = Person(name: "Foo", age: 20)

//we can acess the properties via dot notation
foo.name
foo.age

struct CommodoreComputer {
    let name: String
    //or we can simply assign the value Commodore to the property manufacturer
    let manufacturer: String
    
    init(name: String) {
        self.name = name
        self.manufacturer = "Commodore"
    }
}

//let c64 = CommodoreComputer(name: "My commodore", manufacturer: "Commodore")
//let c128 = CommodoreComputer(name: "My commodore 128", manufacturer: "Commodore")
//if all the commodore computers have the same manufacturer we can create a custom constructor/init to pass this info

let c64 = CommodoreComputer(name: "C64")
c64.name
c64.manufacturer


struct Person2 {
    let firstName: String
    let lastName: String
    
    //in order to create the person2 full name we can do it with the init(is valid) but there is a more desired way : a computed property
    var fullName: String {
        "\(firstName) \(lastName)"
    }
}

let foo2 = Person2(firstName: "Foo", lastName: "Bar")
foo2.firstName
foo2.lastName
foo2.fullName

//until now we have created structures that are mutable
//foo2.firstName = "Jerry"

//let's see how we can create structures that will allow to change the strucutre internally

struct Car {
    var currentSpeed: Int
    //in order to change the currentSpeed we need to mark the function with mutating keyword
    mutating func drive(speed: Int) {
        "Driving..."
        currentSpeed = speed
    }
}

let immutableCar = Car(currentSpeed: 10)
//immutableCar.drive(speed: 20)

var mutableCar = Car(currentSpeed: 10)
//mutableCar.drive(speed: 20)
//mutableCar.currentSpeed

//now remember the value type
//we will create another instance of the car struct and assign the data from the mutableCar
let copy = mutableCar
//and now if we change the speed to the mutable car
mutableCar.drive(speed: 50)
mutableCar.currentSpeed
//and check the speed of the copy we will see different results
copy.currentSpeed

//we saw that we can copy data from an instance to another
//but what happens if i want to change something interrnally? to create a custom copy

struct Bike {
    let manufacturer: String
    let currentSpeed: Int
    
    //in order to chage the speed
    func copy(currentSpeed: Int) -> Bike {
        Bike(manufacturer: self.manufacturer, currentSpeed: currentSpeed)
    }
    
}
//we create a first instance of the bike
let bike1 = Bike(manufacturer: "HD", currentSpeed: 20)
//and we asign the value to another instance , but we wan't to chage the speed
//we can't but then you will be tempted to chage let with var
//let bike2 = bike1
//bike2.currentSpeed = 30

//a more preferred way is to create a function -> see inisde the struct declaration
let bike2 = bike1.copy(currentSpeed: 30)
bike1.currentSpeed
bike2.currentSpeed
