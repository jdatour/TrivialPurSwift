//: [Previous](@previous)

import Foundation
import PlaygroundSupport

enum Question1 {
    
    // What is printed after execution ?
    // A: 5 4 3 2 1
    // B: 1 2 3 4 5
    // C: 5 4 2 1 2
    // D: 2 1 3 4 5
    
    static func question() {
        defer {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.0, execute: {
                print(1)
                PlaygroundPage.current.finishExecution()
            })
            
            defer {
                print(2)
            }
        }
        
        defer {
            print(3)
        }
        
        defer {
            print(4)
        }
        
        print(5)
    }
}

// Question1.question()

PlaygroundPage.current.needsIndefiniteExecution = true

//: [Next](@next)
