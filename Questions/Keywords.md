## Keywords

### Question 1

```swift
func question() {
  defer {
    DispatchQueue.main.asyncAfter(deadline: .now() + 0.0, execute: {
      print(1)
      PlaygroundPage.current.finishExecution()
  })

    defer {
      print(2)
    }
  }

  defer {
    print(3)
  }

  defer {
    print(4)
  }

  print(5)
}
```

<details>
<summary> What is printed after execution? </summary>

> A. 1 2 3 4 5.  
  B. 5 4 3 2 1.  
  C. 5 4 2 1 2.  
  D. 2 1 3 4 5.  

<details>
<summary> Answer </summary>
<p> B </p>
</details>
</details>
