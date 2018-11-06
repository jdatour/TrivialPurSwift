//: [Previous](@previous)

import Foundation

enum Question1 {
    
    // What does url contain ?
    // A: Does not compile
    // B: URL?: Optional(https://frenchkit.fr)
    // C: URL: https://frenchkit.fr
    // D: String?: Optional(https://frenchkit.fr)
    
    static func question() {
        // let urlString: String? = "https://frenchkit.fr"
        
        // let url = urlString.map(URL.init)
    }
}

// Question1.question()

enum Question2 {
    
    // What does url contain ?
    // A: Does not compile
    // B: URL?: Optional(https://frenchkit.fr)
    // C: URL: https://frenchkit.fr
    // D: String?: Optional(https://frenchkit.fr)
    
    static func question() {
        let urlString: String? = "https://frenchkit.fr"
        
        let url = urlString.flatMap(URL.init)
        
        print(url!)
    }
}

// Question2.question()


/*:
 
 The concept of first class functions, implemented in Swift, allow you to use methods just like any other object. In our case, URL.init can be seen as a closure of type: (String) -> URL? which can be passed as argument to any method taking a closure of this type as argument.
 As we could see on Functional page of this playground, flatMap takes a closure as argument, to apply its transformation:
 
 public enum Optional<Wrapped> : ExpressibleByNilLiteral {
    public func flatMap<U>(_ transform: (Wrapped) throws -> U?) rethrows -> U?
 }
 
 In our example, Wrapped is String (urlString) and it returns an URL (U)
 
 The reason it does not work, in `map` case is that URL.init is a failable initialiazer, ie returns an optional value. In the transform closure of map, you cannot return an optional:
 
 public func map<U>(_ transform: (Wrapped) throws -> U) rethrows -> U?
 
 */

//: [Next](@next)
