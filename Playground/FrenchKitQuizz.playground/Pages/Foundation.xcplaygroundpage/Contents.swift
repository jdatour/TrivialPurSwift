//: [Previous](@previous)

import Foundation

enum Question1 {
    
    // What does this print?
    // A: Key: 0 and value: (key: "French", value: "Kit")
    // B: Key: French and value: Kit
    // C: Does not compile
    // D: Key: French and value: FrenchKit
    
    static func question() {
        let names = ["French": "Kit"]
        
        for (key, value) in names.enumerated() {
            print("Key: \(key) and value: \(value)")
        }
    }
}

// Question1.question()

/*:
 
 You can iterate through a dictionary this way:
 
 */

func illustrateQuestion1() {
    let names = ["French": "Kit"]
    
    for (key, value) in names {
        print("Key: \(key) and value: \(value)")
    }
}

// illustrateQuestion1()

/*:
 
 At this point, you get keys and values, the way you could expect it. When using enumerated method, what we called "key" is misleading. The tuple gives you an index as first value and the second value is the element of the collection. In the case of a dictionary, key is thus an index and value is the underlying key/value pair for this index.
 
 */

enum Question2 {
    
    // What does `value` contain?
    // A: String: "Heads"
    // B: String?: Optional("Heads")
    // C: Does not compile
    // D: String?: "CocoaHeads"
    
    static func question() {
        let names = ["French": "Kit"]
        let value = names["Cocoa", default: "Heads"]
        
        print(value)
    }
}

// Question2.question()

/*:
 
 Using default values in dictionary produces the same result as dict["UnknownKey"] ?? "DefaultKey". Here, the key "Cocoa" is not known, the default string value "Heads" is therefore returned.
 
 */

enum Question3 {
    // What does `names` contain?
    // A: ["Cocoa": [0, 2]]
    // B: ["Cocoa": [0]]
    // C: ["Cocoa": [2]]
    // D: Does not compile
    
    static func question() {
        var names = [String : [Int]]()

        names["Cocoa", default: [0]].append(2)
        
        print(names)
    }
}

// Question3.question()

/*:
 
 The new 'default' api is usable both as an accesor (see previous question) and as a setter. In this case, the key does not exist, it's then created with a default value ([0]). It is not obvious but the 'append' method is not applied to the result of names["Cocoa", default: [0]] but to the default value. If you want to create a new array with the default value of an unexisting key, you must use a non-mutating method. For instance:
 
 */

func illustrateQuestion3() {
    let dict = [String : [Int]]()
    let arr = dict["WTF", default: [0]] + [1]
    
    print(arr)
}

// illustrateQuestion3()

enum Question4 {
    enum Company {
        case apple
        case microsoft
    }

    typealias Person = (company: Company, name: String)
    
    // What does `value` contain?
    // A: [String]?: Optional(["Tim", "Craig"])
    // B: Does not compile
    // C: String: "Scott"
    // D: Crashes at runtime

    static func question() {
        let people = [Person(company: .apple, name: "Tim"),
                      Person(company: .apple, name: "Craig"),
                      Person(company: .microsoft, name: "Bill")]
        let dictionary = Dictionary(grouping: people) { $0.company }
        let value = dictionary[.apple]?.map { $0.name }
        
        print(value ?? "")
    }
}

// Question4.question()

/*:
 
 The new dictionary(grouping:_:) takes a sequence and a closure that returns the key you want your sequence to be grouped by as arguments. In our case there are two possible (unique) keys: apple or microsoft. The value for this key is the element of the sequence that matches a key. So the value of the key 'apple' is an array containing two Person tuple (Tim and Craig)
 
 */

enum Question5 {
    enum Company {
        case apple
        case microsoft
    }

    typealias Person = (company: Company, name: String)
    
    // What does `value` contain?
    // A: Crashes at runtime
    // B: Does not compile
    // C: [Person]?: Optional([(.apple, "Tim"), (.apple, "Craig")])
    // D: Person: (.snap, "Scott")
    
    static func question() {
        let people = [Person(company: .apple, name: "Tim"),
                      Person(company: .apple, name: "Craig"),
                      Person(company: .microsoft, name: "Bill")]
        let dictionary = Dictionary(uniqueKeysWithValues: people)
        let value = dictionary[.apple]
        
        print(value ?? "")
    }
}

// Question5.question()

/*:
 
 As its name suggests, Dictionary(uniqueKeysWithValues:) takes a sequence whose each element can be expressed as a (key, value) tuple where key must be unique. This is not the case in our example. It will crash at runtime.
 
 */
