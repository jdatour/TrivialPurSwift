//: [Previous](@previous)

enum Question1 {

    // Does it compile ?
    
    // enum List<T> {
    //     case Node(T, List<T>)
    // }
}

/*:
 
 When an enum reference itself in one of its case, it must be marked `indirect`:
 
 */

indirect enum List<T> {
    case Node(T, List<T>)
}

//: [Next](@next)
