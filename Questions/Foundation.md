## Foundation
### Question 1

```swift
let names = ["French": "Kit"]

for (key, value) in names.enumerated() {
  print("Key: \(key) and value: \(value)")
}
```

<details>
<summary> What does this print? </summary>

> A. Key: French and value: Kit.  
  B. Key: 0 and value: (key: "French", value: "Kit").  
  C. Does not compile.  
  D. Key: French and value: FrenchKit.  

<details>
<summary> Answer </summary>
<p> B </p>    
</details>
</details>

### Question 2

```swift
let names = ["French": "Kit"]

let value = names["Cocoa", default: "Heads"]
```

<details>
<summary> What does `value` contain? </summary>

> A. String?: "CocoaHeads".  
  B. String?: Optional("Heads").   
  C. Does not compile.    
  D. String: "Heads".   

<details>
<summary> Answer </summary>
<p> D </p>    
</details>
</details>

### Question 3

```swift
var names = [String : [Int]]()

names["Cocoa", default: [0]].append(2)
```

<details>
<summary> What does `names` contain? </summary>

> A. ["Cocoa": [2]].    
  B. ["Cocoa": [0]].   
  C. ["Cocoa": [0, 2]].   
  D. Does not compile.   

<details>
<summary> Answer </summary>
<p> C </p>    
</details>
</details>

### Question 4

```swift
enum Company {
  case apple
  case microsoft
}

typealias Person = (company: Company, name: String)
```

```swift
let people = [Person(company: .apple, name: "Tim"),
              Person(company: .apple, name: "Craig"),
              Person(company: .microsoft, name: "Bill")]
let dictionary = Dictionary(grouping: people) { $0.company }

let value = dictionary[.apple]?.map { $0.name }

```

<details>
<summary> What does `value` contain? </summary>

> A. Crashes at runtime.  
  B. Does not compile.  
  C. String: "Scott".  
  D. [String]?: Optional(["Tim", "Craig"]).  

<details>
<summary> Answer </summary>
<p> D </p>    
</details>
</details>

### Question 5

```swift
let people = [Person(company: .apple, name: "Tim"),
              Person(company: .apple, name: "Craig"),
              Person(company: .microsoft, name: "Bill")]
let dictionary = Dictionary(uniqueKeysWithValues: people)

let value = dictionary[.apple]
```

<details>
<summary> What does `value` contain? </summary>

> A. [Person]?: Optional([(.apple, "Tim"), (.apple, "Craig")]).  
  B. Does not compile.  
  C. Crashes at runtime.  
  D. Person: (.snap, "Scott").  

<details>
<summary> Answer </summary>
<p> C </p>    
</details>
</details>
