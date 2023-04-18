import Foundation

/*
 -What are variables?
 -How to use them (reasing value and & internal mutability)?
 -Mutable vs Immutable?
 -Class vs Struct
 */


//when we are creating a constant
let foo = "Foo"
//when we are creating a variable
var foo2 = foo
foo2 = "Foo2"

//keep in mind the data type and the concept of value type vs reference type
foo
foo2

//with variables we can change the container see up but we can also change the data assigned to the container

var names = ["Foo", "Bar", "Baz"]
names = ["Tom"]
names.append("Jerry")
names

let moreNames = ["Marry", "John"]
//moreNames.append("X")

//value type vs reference type
//NSMutableArray -> eg for mac dev class

//this is declared as constant
let oldArray = NSMutableArray(array: ["Foo", "Bar"])
//considering the class that we are using, now we wnat to add another element
oldArray.add("Bazz")
//the oldArray has updated the internal value
oldArray

//let's declare a new array variable and assign the value of the oldArray to it
var newArray = oldArray
//now add a new data at the last index of the newArray
newArray.add("Qux")

//let's see the result
newArray
//but let's look at the oldArray -> they are the same , both arrays reference the same data
oldArray


//also functions can change our data
let someNames = NSMutableArray(array: ["Foo", "Bar"])


func changeTheArray(_ array: NSArray) {
    //bad code!! -> only for example
    let array2 = array as! NSMutableArray
    array2.add("Baz")
}
//call the function
changeTheArray(someNames)
//let's check the value of someNames -> it is updated
someNames


