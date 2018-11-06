//: [Previous](@previous)

enum Question1 {
    
    // What does `result` contain?
    // A: Bool: True
    // B: Bool: False
    // C: Does not compile
    // D: Bool?: True
    
    static func question() {
        let optional1: String? = nil
        let optional2: String? = .none

        let result = optional1 == optional2

        print(result)
    }
}

// Question1.question()

enum Question2 {

    // What does `result` contain?
    // A: Bool: True
    // B: Bool: False
    // C: Does not compile
    // D: Bool?: False
    
    static func question() {
        let number1: Float = 2
        let number2: Float? = .some(2)
        
        let result = number1 == number2

        print(result)
    }
}

// Question2.question()

//: [Next](@next)
