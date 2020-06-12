## Misleading
### Question 1

```swift
   let closure1: () -> Bool = {
     print("Hello 1")
     return true
   }

   let closure2: () -> Bool = {
     print("Hello 2")
     return true
   }

   let array: [(() -> Bool)?] = [closure1, nil, closure2]

   let result = array.reduce(true) { acc, elt in
     return acc && (elt?() ?? false)
   }

   print(result)
}

```

<details>
<summary> What is printed after execution? </summary>

> A. "Hello 1" "false"  
  B. "Hello 1" "Hello 2" "false"  
  C. "Hello 1" "Hello 2" "true"  
  D. "Hello 1" "true"  

<details>
<summary> Answer </summary>
<p> A </p>    
</details>
</details>
