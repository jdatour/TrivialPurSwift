## First class

### Question 1

```swift
let urlString: String? = "https://frenchkit.fr"
let url = urlString.map(URL.init)
```

<details>
<summary> What does `url` contain ? </summary>

> A. Does not compile.  
  B. URL?: Optional(https://frenchkit.fr).  
  C. URL: https://frenchkit.fr.  
  D. String?: Optional(https://frenchkit.fr).  

<details>
<summary> Answer </summary>
<p> A </p>
</details>
</details>

### Question 2

```swift
let urlString: String? = "https://frenchkit.fr"
let url = urlString.flatMap(URL.init)
```

<details>
<summary> What does `url` contain ? </summary>

> A. String?: Optional(https://frenchkit.fr).  
  B. URL?: Optional(https://frenchkit.fr).  
  C. URL: https://frenchkit.fr.  
  D. Does not compile.   

<details>
<summary> Answer </summary>
<p> D </p>
</details>
</details>
