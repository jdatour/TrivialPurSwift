//: [Previous](@previous)

import Foundation

enum Question1 {
    class ClassA {
        let x: Int64 = 0
    }
    
    struct StructA {
        let x: Int64 = 0
    }
    
    class ClassB  {
        let x: Int64 = 0
        let y: Int64 = 0
    }
    
    struct StructB  {
        let x: Int64 = 0
        let y: Int64 = 0
    }
    
    // What are the sizes of the values above?
    // A: 8, 8, 8, 16
    // B: 8, 8, 16, 16
    // C: 0, 0, 8, 16
    // D: 16, 16, 8, 8
    
    static func question() {
        let a = MemoryLayout<ClassA>.size
        let b = MemoryLayout<ClassB>.size
        let c = MemoryLayout<StructA>.size
        let d = MemoryLayout<StructB>.size
    
        print("Answer1 -> A")
        print("""
              a = \(a),
              b = \(b),
              c = \(c),
              d = \(d)
              """)
    }
}

Question1.question()

/*:
 
 A struct is statically allocated on the stack whereas a class is dynamically allocated on the heap.
 `MemoryLayout` does not include informations about dynamically allocated entities such as `Class`. The `size` method will thus returns the same, regardless the number of stored properties.
 
 To get the actual memory footprint of a class, you can use `class_getInstanceSize` which uses objc runtime.
 */

class_getInstanceSize(Question1.ClassA.self)
class_getInstanceSize(Question1.ClassB.self)

class ClassC: Question1.ClassB {
    let test: Int64 = 0
}

class_getInstanceSize(ClassC.self)

/*:
 
 As you can see, the memory footprint is now correctly calculated: it's 16 bytes for metadatas + the amount of memory for stored properties.
 
 */

//: [Next](@next)
