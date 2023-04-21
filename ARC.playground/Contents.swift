import UIKit

/*
 ARC - autoamtic reference count
 Swift uses this feature to track the and manage the memory usage of the app.
 */

class Memory {
    var myMemory: String
    
    init(myMemory: String) {
        self.myMemory = myMemory
        print("instance is initialized")
    }
    
    deinit {
        print("instance is deinitialized")
    }
}
// create an optional intance
var myUsage: Memory?

myUsage = Memory(myMemory: "10kb")
//since we have an optional we can switch on it
switch myUsage {
    
case .none:
    myUsage = nil
case .some(_):
    myUsage = Memory(myMemory: "10kb")
}

var myUsage2 = myUsage

myUsage = nil
myUsage2 = nil


//we create a class Person
class Person0 {
    //it has a stored property
    let name: String
    //we create a designated init, to set the instance property name
    init(name: String) {
        self.name = name
        //this shows that the initialization is underway
        print("\(name) is getting initialized")
    }
    //classes can have also deinitializers
    deinit {
        //this also shows that the deinitialization is underway
        print("\(name) is deinitialized")
    }
}
//these variables are of an optional Person type
var reference1: Person0?
var reference2: Person0?
var reference3: Person0?

//now the initialization will take place
//and now there is a strong reference from reference1 to the new Person instance
reference1 = Person0(name: "Octav")

//now two more references are created , in total 3 references
reference2 = reference1
reference3 = reference1

//we are breaking the original reference and reference2 -> the object is not dealocated
reference1 = nil
reference2 = nil


//now we are breaking the last reference
reference3 = nil
//and we get the print statement from the deinit

// strong reference cycles

class Person {
    //stored property
    let name: String
    
    init(name: String) {
        self.name = name
    }
    //optional apartment property - optional because not everyone has on his anme an apartment
    var apartment: Apartment?
    
    deinit {
        print("\(name) is beeing deinitialized")
    }
}


class Apartment {
    
    let unit: String
    
    init(unit: String) {
        self.unit = unit
    }
    
    weak var tenant: Person?
    
    deinit {
        print("Apartment \(unit) is being deinitialized")
    }
}


var john: Person?
var unit4A: Apartment?

//we can now create a specific person instance and an apartment instance and assign these new instances to our variables

john = Person(name: "John Appleseed")
unit4A = Apartment(unit: "4A")


//now the strong reference is created
john!.apartment = unit4A
unit4A!.tenant = john

//even if we set the value of these varaibles to nil the strong reference cycle is not broken
john = nil
unit4A = nil


//resolving strong reference cycles
//weak vs unowned

//on the above example we will mark as weak the tenant property


//let's see the unowned reference

class Customer {
    let name: String
    var card: CreditCard?
    
    init(name: String) {
        self.name = name
        
    }
    
    deinit {
        print("\(name) is beeing deinitialized.")
    }
}

class CreditCard {
    
    let number: UInt64
    unowned let customer: Customer
    init(number: UInt64, customer: Customer) {
        self.number = number
        self.customer = customer
    }
    deinit {
        print("Card #\(number) is being deinitialized")
    }
}

var johny: Customer?

johny = Customer(name: "John Doe")
johny!.card = CreditCard(number: 1234_5678_9012_3456, customer: johny!)

johny = nil


//weak vs strong
//a variable is created by default as strong -> this tells how to manage the memory
