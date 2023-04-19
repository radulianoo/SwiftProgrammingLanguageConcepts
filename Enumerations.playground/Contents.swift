import Foundation

/*
 Enum - defines a common type for a group of related values
 */

enum Animals {
    case cat
    case dog
    case rabbit
    case horse
}

//we are creating an instance of the enum
let cat = Animals.cat
cat

//we can work with an if statement, but we have to write a lot of conditions
if cat == Animals.cat {
    "This is a cat"
} else if cat == Animals.dog {
    "This is a dog"
} else {
    "This is something else"
}

//or ... we can use a switch statement on the instance cat
//we don't put all cases and then we need to add a default case
//but this will create ambiguity
func describeAnimal(_ animal: Animals) {
    switch animal {
        
    case .cat:
        "This is a cat"
        break //with break we are exiting the switch statement
    case .dog:
        "This is a dog"
        break
    default:
        "This is something else"
    }
}
//keep in mind that switch must be exaustive
describeAnimal(Animals.rabbit)


//enums have the ability to have ASSOCIATED VALUES (dinamically added at the time of creating the instance)

enum Shortcut {
    case fileOrFolder(path: URL, name: String)
    case wwwUrl(path: URL)
    case song(artist: String, songName: String)
}
//let's say we want the user to create shortcuts for his favorite site , declaring the type on the case saves us from creating cases for each website in the world
let wwwApple = Shortcut.wwwUrl(path: URL(string: "https://apple.com")!)

switch wwwApple {
    
case .fileOrFolder(path: let path, name: let name):
    path
    name
case .wwwUrl(path: let path):
    path
case .song(artist: let artist):
    artist
}

//in case you want to check only a case
if case let .wwwUrl(path: path) = wwwApple {
    path
}

//we can ingnore one argument of the case
let withoutYou = Shortcut.song(artist: "Symphony X", songName: "Without You")

if case let .song(_, songName) = withoutYou {
    songName
}


enum Vehicle {
    case car(manufacturer: String, model: String)
    case bike(manufacturer: String, yearMade: Int)
    
    var manufacturer: String {
        switch self {
            //this is pattern matching
        case let .car(manufacturer, _),
            let .bike(manufacturer, _):
            return manufacturer
        }
        
    }
}
    //we know that both car and bike have a manufacturer property , how can we get it
    
    let car = Vehicle.car(manufacturer: "Tesla", model: "X")
    let bike = Vehicle.bike(manufacturer: "HD", yearMade: 1987)
    
    //we can do a switch on the car & bike -> but we will write duplicate code
    
    //switch car {
    //
    //case let .car(manufacturer, _):
    //    manufacturer
    //case let .bike(manufacturer, _):
    //    manufacturer
    //}
    //
    //switch bike {
    //
    //case let .car(manufacturer, _):
    //    manufacturer
    //case let .bike(manufacturer, _):
    //    manufacturer
    //}
    
    //we can create a function
    
    //func getManufacturer(from vehicle: Vehicle) -> String {
    //    switch vehicle {
    //
    //    case let .car(manufacturer, _):
    //        return manufacturer
    //    case let .bike(manufacturer, _):
    //        return manufacturer
    //    }
    //}
    //
    //getManufacturer(from: car)
    //getManufacturer(from: bike)
    
    //but the best way is to declare the function inside the enum -> see body of the enum
    // or
    //declare it as a computed property

car.manufacturer
bike.manufacturer


// enums can have RAW VALUES

enum FamilyMember: String {
    
    case father = "Dad"
    case mother = "Mom"
    case brother = "Bro"
    case sister = "Sis"
    
}

FamilyMember.father.rawValue

//we can provide acess to all cases

enum FavoriteEmoji: String, CaseIterable {
    case blush = "😊"
    case rocket = "🚀"
    case fire = "🔥"
}

FavoriteEmoji.allCases
FavoriteEmoji.allCases.map(\.rawValue)

//but what if we have the value and we want to compare it with the case

if let blush = FavoriteEmoji(rawValue: "😊") {
    "Found the blush emoji"
    blush
} else {
    "This emoji doesn't exist"
}

if let snow = FavoriteEmoji(rawValue: "❄️") {
    "Found the blush emoji"
    snow
} else {
    "This emoji doesn't exist"
}

enum Height {
    case short, medium, long
    
    mutating func makeLong() {
        self = Height.long
    }
}
//create an instance of the enum
var myHeight = Height.medium
//change the value
myHeight.makeLong()
myHeight

