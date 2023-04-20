import Foundation
import PlaygroundSupport
import _Concurrency

/*
 sync function - returns the result immediately
 async function - will return after a period of time
 */

PlaygroundPage.current.needsIndefiniteExecution = true

//simple async func
func calculateFullName(firstName: String, lastName: String) async -> String {
    //create a fake delay in our function -> a delay of a second
    try? await Task.sleep(for: .seconds(1))
    return "\(firstName) \(lastName)"
}


// in order to call the function we need to create a task

Task {
    let result1 = await calculateFullName(firstName: "Foo", lastName: "Bar")
    
    
    async let result2 = calculateFullName(firstName: "Foo", lastName: "Bar")
    await result2
}


enum Clothe {
    case socks, shirt, trousers
}

func buyScocks() async throws -> Clothe {
    try await Task.sleep(for: .seconds(1))
    return Clothe.socks
}

func buyShirt() async throws -> Clothe {
    try await Task.sleep(for: .seconds(1))
    return Clothe.shirt
}

func buyTrousers() async throws -> Clothe {
    try await Task.sleep(for: .seconds(1))
    return Clothe.trousers
}

struct Ensemble: CustomDebugStringConvertible {
    var debugDescription: String {
        "Clothes = \(clothes), price = \(totalPrice)"
    }
    
    let clothes: [Clothe]
    let totalPrice: Double
}

func buyWholeEnsemble() async throws -> Ensemble {
    async let socks = buyScocks()
    async let shirt = buyShirt()
    async let trouser = buyTrousers()
    
    let ensemble = Ensemble(clothes: await [try socks, try shirt, try trouser], totalPrice: 200)
    
    return ensemble
}

Task {
    if let ensemble = try? await buyWholeEnsemble() {
        print(ensemble)
    } else {
        "Something went wrong"
    }
}
