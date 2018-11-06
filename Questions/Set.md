## Set
### Question 1

```swift
struct Person: Equatable {
  let name: String
  let age: Int?

  init(name: String, age: Int? = nil) {
    self.name = name
    self.age = age
  }
}
```
```swift
let tim = Person(name: "tcook")
let craig = Person(name: "cfederighi")

let 🍎 = Set<Person>([tim, craig, tim])
```

<details>
<summary> What does 🍎 contain? </summary>

> A. Does not compile.  
  B. 2 elements.  
  C. 3 elements.  
  D. 4 elements.  

<details>
<summary> Answer </summary>
<p> A </p>    
</details>
</details>

### Question 2

```swift
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
```

```swift
let tim = Person(name: "tcook")
let craig = Person(name: "cfederighi")

let 🍎 = Set<Person>([tim, craig, tim])
```

<details>
<summary> What does `🍎` contain? </summary>

> A. Does not compile.  
  B. 2 elements.  
  C. 3 elements.  
  D. 4 elements.  

<details>
<summary> Answer </summary>
<p> B </p>    
</details>
</details>

### Question 3

```swift
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
```

```swift
let tim = Person(name: "tcook", age: 27)
let craig = Person(name: "cfederighi")

var 🍎 = Set([tim, craig])
let timFix = Person(name: "tcook", age: 28)

🍎.insert(timFix)
```

<details>
<summary> What does `🍎` contain? </summary>

> A. 3 elements.  
  B. Does not compile.  
  C. 2 elements.  
  D. 4 elements.  

<details>
<summary> Answer </summary>
<p> C </p>    
</details>
</details>
