import Foundation

/*
 Classes - it's like a blueprint that represent an object, you can add properties and methods to mimic real time behaviour
        
        - they are reference type
        - allows mutability without prefix
 */

class Person  {
    
    //properties
    var name: String
    var age: Int
    
    //constructor or initializer
    init(age: Int, name: String) {
        self.age = age
        self.name = name
    }
    //property
    func increaseAge() {
        self.age += 1
    }
}

//we create an instance of the class
let foo = Person(age: 20, name: "Foo")
//even this is a constant with classes we have acess to internal mutability
foo.age
foo.increaseAge()
foo.age

//let's see the reference type
//we assign to a new constant the value of foo
let bar = foo
//and we increase the age of bar
bar.increaseAge()

//now if we check the age of foo and bar -> we see that each instance is pointing to the same memory that has been allocated
bar.age
foo.age

//we can compare two instaces of a class ( == -> checks the internal value of two variables )

if foo === bar {
    "Point to the same memory space."
} else {
    "They don't point to the same memory space."
}

//inheritance

class Vehicle {
    func goVroom() {
        "Vroom vroom"
    }
}

class Car : Vehicle {
    
}
//car object has inherited the method from its superclass
let car = Car()
car.goVroom()

//classes can have private set
//the above variables declared inside the class declaration can be changed internally or externally

class Person2 {
    
    //marked as private setter
    private (set) var age: Int
    //init
    init(age: Int) {
        self.age = age
    }
    //change the age
    func increaseAge() {
        age += 1
    }
}

let baz = Person2(age: 22)
baz.age
baz.increaseAge()
//now if we want to add 10 to the age property we can't
//baz.age += 10

//designated init

class Tesla {
    let manufacturer = "Tesla"
    let model: String
    let year: Int
    
    //designated init
    init() {
        self.model = "X"
        self.year = 2023
    }
    
    //also designated init
    init(model: String, year: Int) {
        self.model = model
        self.year = year
    }
    
    //convenience init
    convenience init(model: String) {
        //here we rely on the designated init and assume that the year is 2023 for each car instance
        self.init(model: model, year: 2023)
    }
}


class TeslaModelY: Tesla {
    override init() {
        super.init(model: "Y", year: 2023)
    }
}

let modelY = TeslaModelY()
modelY.manufacturer
modelY.model
modelY.year


//passing instance of a class to functions -> keep in mind the reference type

let fooBar = Person2(age: 55)
fooBar.age

func doSomething(person: Person2) {
    person.increaseAge()
}
//by passing the instance of the class here we are also passing the memory space and this gets changed
doSomething(person: fooBar)
fooBar.age


//deinit (working with reactive programming - notifications?)

class MyClass {
    
    init() {
        "initialized"
    }
    
    func doSomething() {
        "do something"
    }
    
    deinit {
        "deinitialized"
    }
}

let myClosure = {
    let myClass = MyClass()
    myClass.doSomething()
}

myClosure()
