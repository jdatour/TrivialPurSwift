//: [Previous](@previous)

enum Question1 {
    struct Person: Equatable {
        let name: String
        let age: Int?
        
        init(name: String, age: Int? = nil) {
            self.name = name
            self.age = age
        }
    }
    
    // What does `🍎` contain?
    // A: Does not compile
    // B: 2 elements
    // C: 3 elements
    // D: 4 elements
    
    static func question() {
        // let tim = Person(name: "tcook")
        // let craig = Person(name: "cfederighi")
        
        // let 🍎 = Set<Person>([tim, craig, tim])
    }
}

// Question1.question()

/*:
 
 Set elements must be `Hashable`. `Person` is not. It does not compile.
 
 */

enum Question2 {
    struct Person: Hashable {
        let name: String
        let age: Int?
        
        init(name: String, age: Int? = nil) {
            self.name = name
            self.age = age
        }
        
        var hashValue: Int {
            return name.hashValue
        }
    }
    
    // What does `🍎` contain?
    // A: 2 elements
    // B: Does not compile
    // C: 3 elements
    // D: 4 elements
    
    static func question() {
        let tim = Person(name: "tcook")
        let craig = Person(name: "cfederighi")
        
        let 🍎 = Set<Person>([tim, craig, tim])
        
        print(🍎)
    }
}

// Question2.question()

/*:
 
 Person is now Hashable. Set can work
 
 */

enum Question3 {
    struct Person: Hashable {
        let name: String
        let age: Int?
        
        init(name: String, age: Int? = nil) {
            self.name = name
            self.age = age
        }
        
        var hashValue: Int {
            return name.hashValue
        }
        
        static func ==(lhs: Person, rhs: Person) -> Bool {
            return lhs.name == rhs.name
        }
    }
    
    // What does `🍎` contain?
    // A: 2 elements
    // B: Does not compile
    // C: 3 elements
    // D: 4 elements
    
    static func question() {
        let tim = Person(name: "tcook", age: 27)
        let craig = Person(name: "cfederighi")
        
        var 🍎 = Set([tim, craig])
        let timFix = Person(name: "tcook", age: 28)
    
        🍎.insert(timFix)
        
        print(🍎)
    }
}

Question3.question()

/*:
 
 Although tim and timFix have different value, their hashValue remain the same (it relies only on `name` field. When calling `🍎.insert(timFix)`, the hashValue of timFix is already present and thus nothing more is inserted
 
 */

//: [Next](@next)
