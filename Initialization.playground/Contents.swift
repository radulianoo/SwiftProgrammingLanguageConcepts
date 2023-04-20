import Foundation

/*
 Initialization - the process of preparing an instance of a class , struct or enum for use.
 
 */

//Classes and Structs must set all their stored prop to an appropiate initial value by the time an instance of that class/struct is created.
//Stored prop can't be left in an indeterminate state


// we can set an initial value for a stored prop

//1. with initializer

struct Car {
    var name: String
    
    init() {
        name = "Ford"
    }
    
    init(name: String) {
        self.name = name
    }
}

var myCar = Car()
myCar.name

myCar.name = "Tesla"
myCar.name

var anotherCar = Car(name: "RAM")
anotherCar.name

anotherCar = myCar
anotherCar.name
myCar.name


//2. with default values

struct Weather {
    var temperature = 0
}

var currentTemperature = Weather()
currentTemperature.temperature

let temperatureInDubai = 32
currentTemperature.temperature = temperatureInDubai

//we can customize the initialization parameters

struct Celsius {
    
    var temperatureInCelsius: Double
    
    //if we want to convert the temp in fahrenheit to celsius
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    //if we want to convert the temp in kelvin to celsius
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    
}

let boilingPointOfWather = Celsius(fromFahrenheit: 212.0)
print(boilingPointOfWather.temperatureInCelsius)
let freezingPointOfWater = Celsius(fromKelvin: 273.15)
print(freezingPointOfWater.temperatureInCelsius)


//parameter names and argument labels

struct Color {
    let red, green, blue : Double
    
    init(red: Double, green: Double, blue: Double) {
        self.red = red
        self.green = green
        self.blue = blue
    }
    
    init(white: Double) {
        red = white
        green = white
        blue = white
    }
}


let magenta = Color(red: 1.0, green: 0.0, blue: 1.0)
let halfGray = Color(white: 0.5)

//omition the argument label

struct Celsius22 {
    
    var temperatureInCelsius: Double
    
    //if we want to convert the temp in fahrenheit to celsius
    init(fromFahrenheit fahrenheit: Double) {
        temperatureInCelsius = (fahrenheit - 32.0) / 1.8
    }
    
    //if we want to convert the temp in kelvin to celsius
    init(fromKelvin kelvin: Double) {
        temperatureInCelsius = kelvin - 273.15
    }
    
    init(_ celsius: Double) {
        temperatureInCelsius = celsius
    }
    
}

let temp22 = Celsius22(32.0)
temp22.temperatureInCelsius

//Optional Property Type

class SurveyQuestion {
    var text: String
    var response: String?
    
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}

let chesseQuestion = SurveyQuestion(text: "Do you like chese?")
chesseQuestion.response = "Yesss 🤤"


//assigning constant properties during initialization

class SurveyQuestion2 {
    let text: String
    var response: String?
    
    init(text: String) {
        self.text = text
    }
    
    func ask() {
        print(text)
    }
}

let badQuestion = SurveyQuestion(text: "How about politics?")
badQuestion.ask()
badQuestion.response = "I don't do politics."

//default initializer

class ShoppingListItem {
    var name: String?
    var quantity = 1
    var purchased = false
}

var item = ShoppingListItem()

//this can be done due to :
//all properties have a default value
//shoppingListItem is a base class with no superclass

//memberwise initializer

struct Vehicle {
    var numberOfDoors: Int
    let name: String
    var yearMade: Int
}

let carOfTheYear = Vehicle(numberOfDoors: 4, name: "Tesla", yearMade: 2022)

//initializer delegatin for value types

struct Size {
    var width = 0.0
    var height = 0.0
}

struct Point {
    var x = 0.0 , y = 0.0
}


struct Rect {
    var origin = Point()
    var size = Size()
    
    init() {} // same as default init
    
    init(origin: Point, size: Size) {
        self.origin = origin
        self.size = size
    }
    //init delegation
    init(center: Point, size: Size) {
        let originX = center.x - (size.width/2)
        let originY = center.y - (size.height/2)
        self.init(origin: Point(x: originX, y:originY), size: size)
    }
    
}

let rect = Rect()


// initializer inheritance and overriding

class Vehicle99 {
    var numberOfWheels = 0
    var description: String {
        "\(numberOfWheels) wheel(s)"
    }
}

let vehicle = Vehicle99()
print("Vehicle: \(vehicle.description)")


class Bicycle: Vehicle99 {
    override init() {
        //calling the default init
        super.init()
        numberOfWheels = 2
    }
}

let bicycle = Bicycle()
print("Bicycle: \(bicycle.description)")

class Hoverboard: Vehicle99 {
    var color: String
    init(color: String) {
        self.color = color
    }
    
    override var description: String {
        return "\(self.description) in a beautifull \(color)"
    }
}

let hoverboard = Hoverboard(color: "silver")
print("Hoverboard: \(hoverboard.description)")
