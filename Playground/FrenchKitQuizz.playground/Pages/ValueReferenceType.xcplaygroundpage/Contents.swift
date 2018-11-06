//: [Previous](@previous)

enum Question1 {

    // What does otherArr contains ?
    // A: [1, 2, 3]
    // B: [1, 2, 3, 4, 5]
    // C: [1, 2, 3, 5]
    // D: [1, 2, 3, 5, 4]
    
    static func question() {
        var arr = [1, 2, 3]
        var otherArr = arr
    
        otherArr.append(5)
        arr.append(4)
    
        print(otherArr)
    }
}

// Question1.question()

/*:

 Classical reference vs value type question. Array is a struct, a value type. It has a unique copy of its data. When assigned, a new instance is created with a copy ot its data.
 
 In our example, otherArr and arr do not share the same instance. Instead, a copy of arr is performed so that our two variables will behave independently.
 
 */

//: [Next](@next)
