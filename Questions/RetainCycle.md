## Retain cycle

### Question 1

```swift
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
```

```swift
var bar: Bar? = Bar()

bar?.start()
bar = nil
```

<details>
<summary> What gets printed on screen? </summary>

> A. Handling, Nothing, Deiniting Foo, Deiniting Bar.  
  B. Handling, Nothing, Deiniting Bar.  
  C. Handling, Nothing.  
  D. The program crashes.  

<details>
<summary> Answer </summary>
<p> B </p>
</details>
</details>

### Question 2

```swift
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
```

```swift
var bar: Bar? = Bar()

bar?.start()
bar = nil
```

<details>
<summary> What gets printed after execution? </summary>

> A. Handling, Nothing, Deiniting Foo, Deiniting Bar.  
  B. Handling, Nothing, Deiniting Bar.  
  C. Handling, Nothing.  
  D. The program crashes.  

<details>
<summary> Answer </summary>
<p> B </p>
</details>
</details>

### Question 3

```swift
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
```

```swift
var bar: Bar? = Bar()

bar?.start()
bar = nil
```

<details>
<summary> What gets printed after execution? </summary>

> A. Handling, Nothing, Deiniting Foo, Deiniting Bar.  
  B. Handling, Nothing, Deiniting Bar.  
  C. Handling, Nothing.  
  D. The program crashes.  

<details>
<summary> Answer </summary>
<p> A </p>
</details>
</details>

### Question 4

```swift
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
```

```swift
var bar: Bar? = Bar()

bar?.start()
bar = nil
```

<details>
<summary> What gets printed after execution? </summary>

> A. Handling, Nothing, Deiniting Foo, Deiniting Bar.  
  B. Handling, Nothing, Deiniting Bar.  
  C. Handling, Nothing.  
  D. The program crashes.  

<details>
<summary> Answer </summary>
<p> D </p>
</details>
</details>
