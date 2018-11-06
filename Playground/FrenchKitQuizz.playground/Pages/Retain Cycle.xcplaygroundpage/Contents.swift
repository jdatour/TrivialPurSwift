//: [Previous](@previous)

import Foundation
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

enum Question1 {
    class Foo {
        var handler: (() -> ())?
        func doSomething(handler: @escaping () -> ()) {
            self.handler = handler
            print("Handling")
            handler()
        }
        
        var x = 0
        
        func doNothing() {
            print("Nothing")
        }
        
        deinit {
            print("Deiniting Foo")
        }
    }
    
    class Bar {
        func start() {
            let foo = Foo()
            foo.doSomething {
                foo.doNothing()
            }
        }
        
        deinit {
            print("Deiniting Bar")
        }
    }
    
    // What gets printed on screen?
    // A. Handling, Nothing, Deiniting Bar
    // B. Handling, Nothing, Deiniting Foo, Deiniting Bar
    // C. Handling, Nothing
    // D. The program crashes

    static func question() {
        var bar: Bar? = Bar()

        bar?.start()
        bar = nil
    }
}

// Question1.question()

/*:
 
 When calling doSomething(handler:), foo keeps a strong reference on handler. When handler is called, it captures foo strongly. Both have a strong reference on each other, there is a retain cycle, foo is never released and deinit is never called.
 
 */

enum Question2 {
    class Foo {
        var handler: (() -> ())?
        func doSomething(handler: @escaping () -> ()) {
            self.handler = handler
            print("Handling")
            handler()
        }
    
        func doNothing() {
            print("Nothing")
        }
    
        deinit {
            print("Deiniting Foo")
        }
    }
    
    class Bar {
        func start() {
            let foo = Foo()
            
            foo.doSomething { [weak self] in
                foo.doNothing()
            }
        }
    
        deinit {
            print("Deiniting Bar")
        }
    }
    
    // What gets printed after execution ?
    // A. Handling, Nothing, Deiniting Bar
    // B. Handling, Nothing, Deiniting Foo, Deiniting Bar
    // C. Handling, Nothing
    // D. The program crashes
    
    static func question() {
        var bar: Bar? = Bar()
        
        bar?.start()
        bar = nil
    }
}

// Question2.question()

/*:

 This time, self is captured weakly by handler, but foo is not a property of Bar. So this attempt is useless. This question is just a vicious trap 😛

 */

enum Question3 {
    class Foo {
        var handler: (() -> ())?
        func doSomething(handler: @escaping () -> ()) {
            self.handler = handler
            print("Handling")
            handler()
        }
        
        func doNothing() {
            print("Nothing")
        }
        
        deinit {
            print("Deiniting Foo")
        }
    }
    
    class Bar {
        func start() {
            let foo = Foo()

            foo.doSomething { [weak foo] in
                foo?.doNothing()
            }
        }
        
        deinit {
            print("Deiniting Bar")
        }
    }
    
    // 3. What gets printed after execution?
    // A. Handling, Nothing, Deiniting Foo, Deiniting Bar
    // B. Handling, Nothing, Deiniting Bar
    // C. Handling, Nothing
    // D. The program crashes
    
    static func question() {
        var bar: Bar? = Bar()
        
        bar?.start()
        bar = nil
    }
}

// Question3.question()

/*:
 
 This time, no retain cycle because foo is captured weakly.
 
 */

enum Question4 {
    class Foo {
        func doSomething(handler: @escaping () -> ()) {
            print("Handling")
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.1) {
                handler()
            }
            handler()
        }
        
        func doNothing() {
            print("Nothing")
        }
        
        deinit {
            print("Deiniting Foo")
        }
    }
    
    class Bar {
        func start() {
            let foo = Foo()
            foo.doSomething { [unowned foo] in
                foo.doNothing()
            }
        }
        
        deinit {
            print("Deiniting Bar")
        }
    }
    
    // What gets printed on screen?
    // A. The program crashes
    // B. Handling, Nothing, Deiniting Bar
    // C. Handling, Nothing
    // D. Handling, Nothing, Deiniting Foo, Deiniting Bar
    
    static func question() {
        var bar: Bar? = Bar()
        
        bar?.start()
        bar = nil
    }
}

// Question4.question()

/*:

 As far as foo is retained, calling handler, which will call `foo.doNothing` is OK. But when we leave the scope of doSomething(), in the `dispatchAfter` closure, foo has been deallocated. So if we call handler: it crashes. This is because capturing foo with unowned is saying "let's capture foo weakly but don't bother me with optionals, I'm sure it will always be instanciated when using it". But here, that's not the case. Please, use unnowed safely.
 
 */

//: [Next](@next)
