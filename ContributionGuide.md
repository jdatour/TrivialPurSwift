# Contribution guide

### Content

The goal of the whole quizz is to be fun, non-trivial and to focus on swift complex (sometimes complicated?) approaches.

### Explanations

Each question must have its corresponding explanation. 
An explanation can go deep but should be closed to debate or should not cover another concept that is not directly linked to the question itself.

### Readme

If you add a new category, add it to the table of content.
The table of content must be sorted alphabetically.

### Playground

The playground has one page per category.
Each page is organized like this:

```swift
enum Question1 {
    
    // Declare anything you need to use in the question
    struct A {
    }
    
    // Question
    // A: Answer A
    // B: Answer B
    // C: Answer C
    // D: Answer D
    
    
    static func question() {
        // Write the code that illustrates your question
        // Print the answer
    }
}

Question1.question()

/*:

  Explanation
 
 */

// Optional: if you want to illustrate your explanation do it here

/*:
 
  Other part of the explanation
 
 */
```

This structure should be used to keep the whole playground consistent.
If you feel that this structure does not fit your needs, we can talk about it 🙂
