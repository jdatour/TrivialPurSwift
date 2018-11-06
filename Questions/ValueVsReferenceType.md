## Value vs reference type

### Question 1

```swift
var arr = [1, 2, 3]
var otherArr = arr

otherArr.append(5)
arr.append(4)
```

<details>
<summary> What does otherArr contains? </summary>

> A. [1, 2, 3].  
  B. [1, 2, 3, 4, 5].  
  C. [1, 2, 3, 5].  
  D. [1, 2, 3, 5, 4].  

<details>
<summary> Answer </summary>
<p> C </p>
</details>
</details>
