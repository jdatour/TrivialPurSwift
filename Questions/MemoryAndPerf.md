## Memory and performance
### Question 1

```swift
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
```

```swift
let a = MemoryLayout<ClassA>.size
let b = MemoryLayout<ClassB>.size
let c = MemoryLayout<StructA>.size
let d = MemoryLayout<StructB>.size
```

<details>
<summary> What are the sizes of the values above? </summary>

> A. 8, 8, 16, 16.  
  B. 8, 8, 8, 16.  
  C. 0, 0, 8, 16.    
  D. 16, 16, 8, 8.  

<details>
<summary> Answer </summary>
<p> B </p>    
</details>
</details>
