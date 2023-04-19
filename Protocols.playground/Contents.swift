import Foundation

/*
 Protocol - defines a blueprint of methods, properties and other requirements that suit a particular task or piece of functionality
 
          - a set of rules that objects has to follow
 */

protocol CanBreathe {
    func breathe() //they have function declaration only
}

struct Animal: CanBreathe {
    
    func breathe() {
        "Animal breathing..."
    }
}

struct Person: CanBreathe {
    func breathe() {
        "Person breathing..."
    }
}

let dog = Animal()
dog.breathe()
let person = Person()
person.breathe()

//protocols can have their own implementation

protocol CanJump {
    func jump()
}

//then you write an extension on the protocol, and provide the default implementation

extension CanJump {
    func jump() {
        "Jumping..."
    }
}

//we can't instantiate the protocol , but we can instantiate an object that conforms to the protocol


struct Cat: CanJump {
    //now due to the extension implementation we don't get the error
    //it is already incoporated
    //now we can only modify it ... provide the jump func and your implementation
}

let myCat = Cat()
myCat.jump()


//protocols can have properties

protocol HasName {
    var name: String { get }
    var age: Int { get set }
    mutating func increaseAge()
}

extension HasName {
    func describeMe() -> String {
        "Your name is \(name) and you are \(age) years old"
    }
    
    mutating func increaseAge() {
        self.age += 1
    }
}

struct Dog: HasName {
    let name: String
    var age: Int
}

var woof = Dog(name: "Woof", age: 10)
woof.name
//get property only receives the value and it cannot be chaged
//woof.name = "Tom"
woof.age
woof.age += 1
woof.age
woof.describeMe()
woof.increaseAge()


//we can check if any class/struct/enum is conforming to a protocol - is keyword

struct Worm {
    
}

func describe(obj: Any) {
    if obj is CanJump {
        "obj conforms to the CanJump protocol"
    } else {
        "obj does NOT confom to the CanJump protocol"
    }
}

describe(obj: myCat)

let worm = Worm()
describe(obj: worm)


// as? -> using this keyword you can conditionally promote an object to the specific type

func jumpAgain(obj: Any) {
    if var rabbit = obj as? Cat {
        rabbit.jump()
    } else {
        "This object can't jump."
    }
}

jumpAgain(obj: worm)
