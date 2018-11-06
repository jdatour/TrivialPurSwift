//: [Previous](@previous)

import Foundation

enum Question1 {
    
    // What is the difference between `a`, `b`, `c` and `d`?
    // A. `a`, `b` and `c` are [String], `d` is [String?]
    // B. `a` and `b` are [String], `c` and `d` are [String?]
    // C. None
    // D. `a`, `b` are [String], `c` does not compile, `d` is [String?]
    
    static func question() {
        let array: [String?] = ["a", "b", nil, "e", "d", nil, "m", "g"]
        
        let a = array.flatMap { $0 }
        let b = array.compactMap { $0 }
        let c = array.compactMap({ $0 ?? nil })
        let d = array.map { $0 }
        
        print("Answer1 -> A")
        print("""
            a = \(a),
            b = \(b),
            c = \(c),
            d = \(d)
            """)
    }
}

// Question1.question()

/*:
 
 `flatMap` has been deprecated for filtering nil values on array. For this use case, it has been renamed `compactMap`. It returns a transformed array with non-nil values.
 a, b and c are thus exactly the same.
 
 `flatMap` has not been deprecated when you use it to flatten array like in this example:
 
 */

func illustrateQuestion1() {
    let arr = [[0, 1, 2], [3, 4]]
    
    print(arr.compactMap { $0 })
    print(arr.flatMap { $0 })
}

// illustrateQuestion1()

/*:
 
 `map` does pretty much the same except that optionality is kept during transformation
 
 */

enum Question2 {
    
    static let array: [String]? = ["a", "b", "e", "d", "m", "g"]
    
    // What is the difference between `a`, `b` and `c`?
    // A. None
    // B. `a` and `c` are [String], `b` is [String]?
    // C. `c` does not compile
    // D. `a` and `b` are [String], `c` is [String]?
    
    static func question() {
        
        let a = array.flatMap { $0 }
        let b = array.map { $0 }
        let c = array?.compactMap { $0 }
        
        print("Answer2 -> A")
        print("""
            a = \(String(describing: a)),
            b = \(String(describing: b)),
            c = \(String(describing: c)),
            """)
    }
}

// Question2.question()

/*:
 See explanations above for differences between `map`, `flatMap` and `compactMap`.
 
 What changes here is that our array is optional. And even if results are the same here, the concepts are different.
 
 For a and b, the `flatMap` or `map` method is applied to an optional. It does not transform each element of the array but the array itself. To apply a transformation to each element you must write:
 */

func illustrateQuestion2() {
    let d = Question2.array?.flatMap { $0 }
    let e = Question2.array?.map { $0 }
    
    print(d ?? [])
    print(e ?? [])
}

// illustrateQuestion2()

/*:
 
 The result is the same but you can notice on the right part of playground that a and b have been executed 2 times and d and e 7 times.
 
 compactMap is not implemented for optionals, if you write array.compactMap { $0 } instead of a array?.compactMap { $0 }, it won't compile.
 
 */

enum Question3 {

    // 3. What is the difference between `a`, `b` and `c`?
    // A. `a` and `b` are [String?]?, `c` is [String]?
    // B. `a` and `c` are [String], `b` is [String]?
    // C. `c` does not compile
    // D. `a` and `b` are [String], `c` is [String]?
    
    static func question() {
        let array: [String?]? = ["a", "b", nil, "e", "d", nil, "m", "g"]
        
        let a = array.flatMap { $0 }
        let b = array.map { $0 }
        let c = array?.compactMap { $0 }
        
        print("Answer3 -> A")
        print("""
            a = \(String(describing: a)),
            b = \(String(describing: b)),
            c = \(String(describing: c)),
            """)
    }
}

// Question3.question()

/*:
 
 This question is harder than previous one but concepts remain the same.
 
 When applied to an optional, flatMap and map keep the optionality and do not change the element inside the array (for a and b). When unwraped (c and d), applying flatMap and compactMap does the same, the only difference is that flatMap is deprecated.
 
 */

enum Question4 {
    
    // What is the value of `a`?
    // A. Does not compile
    // B. 3
    // C. 6
    // D. 42
    
    static func question() {
        /*
         
         let array = [1, 2, 3, 4, 5, 6]
         let a = array
                .reduce(0, +)
                .filter { $0 < 3 }
        
         */
        
        print("Answer4 -> A")
    }
}

// Question4.question()

/*:
 
 `public func reduce<Result>(_ initialResult: Result, _ nextPartialResult: (Result, Element) throws -> Result) rethrows -> Result`
 
 Applying reduce on an array allows to iterate over each element and to update a partial result each iteration. The "+" here is just syntaxic sugar to say "I want to add partial result to current element". As you can see in the method prototype, the return type of reduce is the type of initialResult, in our case an `Int`. Unlike other functional operators on array like map, filter or compactMap; reduce does not return every time an array. Thus, in our case, filter cannot be applied to an integer.
 
 */

enum Question5 {
    
    // What is the value of `a`?
    // A. 2
    // B. 3
    // C. 6
    // D. Does not compile
    
    static func question() {
        
        let array = [1, 2, 3, 4, 5, 6]
        let a = array
            .filter { $0 < 3 }
            .reduce(into: 0) { (result, value) in
                result = value
        }
        
        print("Answer4 -> A")
        print("a = \(a)")
    }
}

// Question5.question()

/*:
 
 `public func reduce<Result>(into initialResult: Result, _ updateAccumulatingResult: (inout Result, Element) throws -> ()) rethrows -> Result`
 
 `reduce(into:)` is very similar to reduce. Except for one crucial point: the `partialResult` is now mutable.
 
 In our example, result is just updated to the last element of the resulting, filtered array.
 
 */

//: [Next](@next)
