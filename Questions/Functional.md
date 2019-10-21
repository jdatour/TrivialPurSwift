## Functional
### Question 1

```swift
let array: [String?] = ["a", "b", nil, "e", "d", nil, "m", "g"]

let a = array.flatMap { $0 }
let b = array.compactMap { $0 }
let c = array.compactMap({ $0 ?? nil })
let d = array.map { $0 }
```

<details>
<summary> What is the difference between `a`, `b`, `c` and `d`? </summary>

> A. `a`, `b` are [String], `c` does not compile, `d` is [String?].  
  B. `a` and `b` are [String], `c` and `d` are [String?].   
  C. None.   
  D. `a`, `b` and `c` are [String], `d` is [String?].   

<details>
<summary> Answer </summary>
<p> D </p>    
</details>
</details>

### Question 2

```swift
let array: [String]? = ["a", "b", "e", "d", "m", "g"]

let a = array.flatMap { $0 }
let b = array.map { $0 }
let c = array?.compactMap { $0 }
```

<details>
<summary> What is the difference between `a`, `b` and `c`? </summary>

> A. `a` and `c` are [String], `b` is [String]?   
  B. None.  
  C. `c` does not compile.  
  D. `a` and `b` are [String], `c` is [String]?

<details>
<summary> Answer </summary>
<p> B </p>    
</details>
</details>

### Question 3

```swift
let array: [String?]? = ["a", "b", nil, "e", "d", nil, "m", "g"]

let a = array.flatMap { $0 }
let b = array.map { $0 }
let c = array?.compactMap { $0 }
```

<details>
<summary> What is the difference between `a`, `b` and `c`? </summary>

> A. `a` and `b` are [String?]?, `c` is [String]?   
  B. `a` and `c` are [String], `b` is [String]?   
  C. `c` does not compile.  
  D. `a` and `b` are [String], `c` is [String]?   

<details>
<summary> Answer </summary>
<p> A </p>    
</details>
</details>

### Question 4

```swift
let array = [1, 2, 3, 4, 5, 6]
let a = array
        .reduce(0, +)
        .filter { $0 < 3 }
```

<details>
<summary> What is the value of `a`? </summary>

> A. 21.  
  B. 3.  
  C. Does not compile.  
  D. 1.

<details>
<summary> Answer </summary>
<p> C </p>    
</details>
</details>

### Question 5

```swift
let array = [1, 2, 3, 4, 5, 6]
let a = array
        .filter { $0 < 3 }
        .reduce(into: 0) { (result, value) in
          result = value
        }
```

<details>
<summary> What is the value of `a`? </summary>

> A. 6.  
  B. 3.  
  C. 2.  
  D. Does not compile.  

<details>
<summary> Answer </summary>
<p> C </p>    
</details>
