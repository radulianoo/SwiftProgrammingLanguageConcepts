import Foundation

/*
 Error handling is the process of responding to and receovering from error conditions in our program
 */

//throwing an error an catching it
struct Person {
    let firstName: String?
    let lastName: String?
    
    func getFullName() throws -> String {
        switch (firstName, lastName) {
        case (.none, .none):
            throw Errors.bothNamesAreNil
        case (.none, .some):
            throw Errors.firstNameIsNil
        case (.some, .none):
            throw Errors.lastNameIsNil
        case let (.some(firstName), .some(lastName)):
            return "\(firstName) \(lastName)"
        }
    }
        //it is a good practice to define the errors inside the struct/class
        //we can define it with a enum that conforms to the error protocol
        enum Errors: Error {
            case firstNameIsNil
            case lastNameIsNil
            case bothNamesAreNil
        }
}

let foo = Person(firstName: "Foo", lastName: nil)

do {
    let fullName = try foo.getFullName()
} catch {
    "Got an error = \(error)"
}


//catching specific errors
let bar = Person(firstName: nil, lastName: nil)

do {
    let fullName = try bar.getFullName()
} catch Person.Errors.firstNameIsNil {
    "First name is nil"
} catch Person.Errors.lastNameIsNil {
    "Last name is nil"
} catch Person.Errors.bothNamesAreNil {
    "Both name are nil"
} catch {
    "Some other error was thrown"
}

//constructors or init that can throw an error

struct Car {
    let manufacturer: String
    
    enum Errors: Error {
        case invalidManufacturer
    }

    init(manufacturer: String) throws {
        if manufacturer.isEmpty {
            throw Errors.invalidManufacturer
        }
        self.manufacturer = manufacturer
    }
}

do {
    let myCar = try Car(manufacturer: "")
} catch Car.Errors.invalidManufacturer {
    "Invalid manufacturer"
} catch {
    "Some other error"
}


if let yourCar = try? Car(manufacturer: "Tesls") {
    "Succes your car is \(yourCar)"
} else {
    "Failed to construct and error is not accessible."
}

//if manufacturer is nil we get a crash
let theirCar = try! Car(manufacturer: "Ford")
theirCar.manufacturer


struct Dog {
    let isInjured: Bool
    let isSleeping: Bool
    
    enum BarkingError: Error {
        case cannotBarkIsSleeping
    }
    
    enum InjuredError: Error {
        case cannotRunIsInjured
    }
    
    func bark() throws {
        if isSleeping {
            throw BarkingError.cannotBarkIsSleeping
        }
        "Bark..."
    }
    
    func run() throws {
        if isInjured {
            throw InjuredError.cannotRunIsInjured
        }
        "Run..."
    }
    
    func barkAndRun() throws {
        try bark()
        try run()
    }
    
    
}

let dog = Dog(isInjured: true, isSleeping: true)

do {
    try dog.barkAndRun()
    dog
} catch Dog.BarkingError.cannotBarkIsSleeping,
        Dog.InjuredError.cannotRunIsInjured {
    "Cannot-bark-is-sleeping OR cannot-run-is-injured"
} catch {
    "Some other error"
}


//rethrows - a function that calls another function that can throw

func fullName(firstName: String?, lastName: String?, calculator: (String?, String?) throws -> String?) rethrows -> String? {
    try calculator(firstName, lastName)
}

enum NameErrors: Error {
    case firstNameIsInvalid
    case lastNameIsInvalid
}

func + (firstName: String?, lastName: String?) throws -> String? {
    guard let firstName, !firstName.isEmpty else {
        throw NameErrors.firstNameIsInvalid
    }
    guard let lastName, !lastName.isEmpty else {
        throw NameErrors.lastNameIsInvalid
    }
    return "\(firstName) \(lastName)"
}

do {
    let qux = try fullName(firstName: nil, lastName: nil, calculator: +)
} catch NameErrors.firstNameIsInvalid {
    "First name is invalid"
} catch NameErrors.lastNameIsInvalid {
    "Last name is invalid"
} catch let err {
    "Some other error : \(err)"
}


//results

enum IntegerErrors: Error {
    case noPositiveIntegerBefore(thisValue: Int)
}

func getPreviousPositiveInteger(from int: Int) -> Result<Int, IntegerErrors> {
    guard int > 0 else {
        return Result.failure(IntegerErrors.noPositiveIntegerBefore(thisValue: int))
    }
    return Result.success(int - 1)
}

func performGet(for value: Int) {
    switch getPreviousPositiveInteger(from: value) {
    case let .success(previousValue):
        "Previous value is \(previousValue)"
    case let .failure(error):
        switch error {
        case let .noPositiveIntegerBefore(thisValue: thisValue):
            "No positive integer before \(thisValue)"
        }
    }
}

performGet(for: 0)
performGet(for: 2)








