---
title: "Chapter 10: if Tests and Syntax Rules"
order: 10
weight: 10
chapter: 10

---
This chapter presents the Python **if** statement, the main tool for selecting from alternative actions based on test results. Because this is our first in-depth look at compound statements—statements that embed other statements—we also explore the general concepts behind Python’s statement syntax model.

## if Statements

In simple terms, the Python **if** statement selects actions to perform. It is the primary selection tool in Python and represents much of the logic a Python program possesses. Being a compound statement, an **if** statement may contain other statements, including additional **if** statements. Python lets you combine statements sequentially (so they execute one after another) and nest them arbitrarily (so they execute only under certain conditions).

## General Format

The Python **if** statement is typical of those in most procedural languages. It takes the form of an **if** test, followed by one or more optional **elif** ("else if") tests and a final optional **else** block. Each test and the **else** part has an associated block of nested statements indented under a header line. When the **if** statement runs, Python executes the block associated with the first test that evaluates to true, or the **else** block if all tests prove false.

The general form is:

```python
if <test1>:
    <statements1>
elif <test2>:
    <statements2>
else:
    <statements3>
```

*# if test  (Associated block, Optional elifs, Optional else)*

## Multiway Branching

Consider this example of a more complex **if** statement with all its optional parts present:

```python
>>> x = 'killer rabbit'
>>> if x == 'roger':
...     print("how's jessica?")
... elif x == 'bugs':
...     print("what's up doc?")
... else:
...     print('Run away! Run away!')
...
Run away! Run away!
```

This multiline statement extends from the **if** line through the **else** block. When executed, Python runs the block under the first test that is true, or the **else** block if all tests are false. In practice, both the **elif** and **else** parts may be omitted, and each section may contain more than one statement. Note that the keywords **if**, **elif**, and **else** are aligned vertically by virtue of their identical indentation.

Multiway branching can also be coded by indexing dictionaries or searching lists. Because dictionaries and lists can be built at runtime, they are sometimes more flexible than hardcoded **if** logic. For example:

```python
>>> choice = 'ham'
>>> print({'spam': 1.25,
...        'ham': 1.99,
...        'eggs': 0.99,
...        'bacon': 1.10}[choice])
1.99
```

*# A dictionary-based 'switch' – Use has_key or get for default*

Although it might take a few moments to sink in, this dictionary indexing is a multiway branch—indexing on the key `choice` branches to one of a set of values, much like a switch in C. An equivalent but more verbose **if** statement might look like this:

```python
>>> if choice == 'spam':
...     print(1.25)
... elif choice == 'ham':
...     print(1.99)
... elif choice == 'eggs':
...     print(0.99)
... elif choice == 'bacon':
...     print(1.10)
... else:
...     print('Bad choice')
...
1.99
```

Notice the **else** clause to handle the default case when no key matches. The same technique can be used with dictionary methods to supply a default. For example, using `get`:

```python
>>> branch = {'spam': 1.25,
...           'ham': 1.99,
...           'eggs': 0.99}
>>> print(branch.get('spam', 'Bad choice'))
1.25
>>> print(branch.get('bacon', 'Bad choice'))
Bad choice
```

An in-membership test in an **if** statement can have the same effect:

```python
>>> choice = 'bacon'
>>> if choice in branch:
...     print(branch[choice])
... else:
...     print('Bad choice')
...
Bad choice
```

## Truth Tests

Since the **if** statement is the first statement that directly uses test results, it is important to understand Python’s Boolean logic. In Python:

- **Any nonzero number or nonempty object is true.**
- **Zero numbers, empty objects, and the special object `None` are considered false.**
- **Comparisons and equality tests are applied recursively to data structures and return `True` or `False`.**
- **Boolean operators `and`, `or`, and `not` combine truth values or expressions that return truth values.**

There are three Boolean expression operators in Python:

- **`X and Y`**  
  *Is true if both X and Y are true.*

- **`X or Y`**  
  *Is true if either X or Y is true.*

- **`not X`**  
  *Is true if X is false (the expression returns `True` or `False`).*

Here, **X** and **Y** can be any truth value or any expression that returns a truth value (for example, an equality test or a range comparison). Note that these operators are spelled out as words (instead of symbols like `&&`, `||`, and `!` in C).

Consider these examples:

```python
>>> 2 < 3, 3 < 2
(True, False)
```

*# Less-than: returns True or False (1 or 0)*

The **and** and **or** operators do not always return `True` or `False`—they return one of their operands, based on short-circuit evaluation. For instance:

```python
>>> 2 or 3, 3 or 2
(2, 3)
>>> [] or 3
3
>>> [] or {}
{}
```

*# Return left operand if true; else, return right operand (which is inherently true or false)*

Similarly, **and** operations stop as soon as the result is known. Python evaluates operands from left to right and stops at the first false operand:

```python
>>> 2 and 3, 3 and 2
(3, 2)
>>> [] and {}
[]
>>> 3 and []
[]
```

*# In an "and" operation, if the left operand is false, it is returned immediately; otherwise, the right operand is returned.*

## Examples (if Statements)

1. **Simple if/else test:**  
   If `num` is over 10, display “This is over 10”, otherwise display “This is not over 10”.

   ```python
   if num > 10:
       print("This is over 10")
   else:
       print("This is not over 10")
   ```

2. **if/elif/else test:**  
   If `num` is over 10, display “This is over 10”; if `num` is equal to 10, display “This is equal to 10”; otherwise, display “This is under 10”.

   ```python
   if num > 10:
       print("This is over 10")
   elif num == 10:
       print("This is equal to 10")
   else:
       print("This is under 10")
   ```

3. **Nested if statement:**  
   If `num` is 10 or more, test further to see if `num` is less than or equal to 20.  
   - If yes, display “This is between 10 and 20”.  
   - If not, display “This is over 20”.  
   If `num` is not over 10, display “This is under 10”.

   ```python
   if num >= 10:
       if num <= 20:
           print("This is between 10 and 20")
       else:
           print("This is over 20")
   else:
       print("This is under 10")
   ```

4. **Changing text to lower case:**  
   Python is case sensitive. This converts the user input to lower case for easier comparison.

   ```python
   text = str.lower(text)
   ```

5. **Using `and` to test multiple conditions:**  
   Both conditions must be met to produce the output “Thank you”.

   ```python
   num = int(input("Enter a number between 10 and 20: "))
   if num >= 10 and num <= 20:
       print("Thank you")
   else:
       print("Out of range")
   ```

6. **Using `or` to test conditions:**  
   Just one condition must be met to display “Thank you”.

   ```python
   num = int(input("Enter an EVEN number between 1 and 5: "))
   if num == 2 or num == 4:
       print("Thank you")
   else:
       print("Incorrect")
   ```

7. **Comparing two numbers:**  
   Ask for two numbers. If the first is larger than the second, display the second number first; otherwise, display the first number first.

   ```python
   num1 = int(input("Enter the first number: "))
   num2 = int(input("Enter the second number: "))
   if num1 > num2:
       print(num2, num1)
   else:
       print(num1, num2)
   ```

8. **Number under 20 check:**  
   Ask the user to enter a number under 20. If they enter a number that is 20 or more, display “Too high”; otherwise, display “Thank you”.

   ```python
   num = int(input("Enter a number under 20: "))
   if num >= 20:
       print("Too high")
   else:
       print("Thank you")
   ```

9. **Number between 10 and 20 check:**  
   Ask the user to enter a number between 10 and 20 (inclusive).  
   - If the number is within this range, display “Thank you”.  
   - Otherwise, display “Incorrect answer”.

   ```python
   num = int(input("Enter a number between 10 and 20: "))
   if num >= 10 and num <= 20:
       print("Thank you")
   else:
       print("Incorrect answer")
   ```

10. **Favorite color check:**  
    Ask the user to enter their favorite color.  
    - If they enter “red”, “RED”, or “Red”, display “I like red too”.  
    - Otherwise, display “I don’t like [colour], I prefer red”.

    ```python
    color = input("Enter your favorite color: ")
    if color == "red" or color == "RED" or color == "Red":
        print("I like red too")
    else:
        print(f"I don't like {color}, I prefer red")
    ```

11. **Raining and windy check:**  
    Ask the user if it is raining and convert the answer to lower case.  
    - If the answer is “yes”, ask if it is windy.  
      - If it is windy, display “It is too windy for an umbrella”.  
      - Otherwise, display “Take an umbrella”.  
    - If it is not raining, display “Enjoy your day”.

    ```python
    raining = input("Is it raining? ").lower()
    if raining == "yes":
        windy = input("Is it windy? ").lower()
        if windy == "yes":
            print("It is too windy for an umbrella")
        else:
            print("Take an umbrella")
    else:
        print("Enjoy your day")
    ```

12. **Age-based messages:**  
    Ask the user for their age.  
    - If they are 18 or over, display “You can vote”.  
    - If they are 17, display “You can learn to drive”.  
    - If they are 16, display “You can buy a lottery ticket”.  
    - If they are under 16, display “You can go Trick-or-Treating”.

    ```python
    age = int(input("Enter your age: "))
    if age >= 18:
        print("You can vote")
    elif age == 17:
        print("You can learn to drive")
    elif age == 16:
        print("You can buy a lottery ticket")
    else:
        print("You can go Trick-or-Treating")
    ```

13. **Number range evaluation:**  
    Ask the user to enter a number.  
    - If it is under 10, display “Too low”.  
    - If the number is between 10 and 20, display “Correct”.  
    - Otherwise, display “Too high”.

    ```python
    num = int(input("Enter a number: "))
    if num < 10:
        print("Too low")
    elif 10 <= num <= 20:
        print("Correct")
    else:
        print("Too high")
    ```

14. **Choice selection:**  
    Ask the user to enter 1, 2, or 3.  
    - If they enter 1, display “Thank you”.  
    - If they enter 2, display “Well done”.  
    - If they enter 3, display “Correct”.  
    - If they enter anything else, display “Error message”.

    ```python
    choice = int(input("Enter 1, 2, or 3: "))
    if choice == 1:
        print("Thank you")
    elif choice == 2:
        print("Well done")
    elif choice == 3:
        print("Correct")
    else:
        print("Error message")
    ```

## Chapter 10 Summary: if Tests and Syntax Rules

This chapter introduces the Python **if** statement as the fundamental tool for making decisions in a program. It explains how conditional tests are used to determine which block of code executes, forming the basis of program logic.

Key points include:

- **Compound Statements:**  
  The **if** statement is the first compound statement discussed. It can include nested statements and even other **if** statements, allowing for complex decision structures.

- **General Structure:**  
  The chapter describes the standard format for an **if** statement, which consists of:
  - An **if** test followed by a block of associated statements.
  - Optional **elif** ("else if") tests with their own blocks.
  - An optional **else** block that executes if none of the tests are true.  
  Each block is defined by its indentation rather than explicit markers.

- **Multiway Branching:**  
  It explains how to implement multiway branching by combining multiple conditions, either through a series of **if/elif/else** statements or by using alternative structures like dictionary indexing for selecting among several options.

- **Default Actions:**  
  The chapter discusses methods for handling default cases when none of the specified conditions are met, emphasizing the use of an **else** clause or dictionary methods (like `get`) to supply fallback values.

- **Truth Tests and Boolean Logic:**  
  The chapter outlines Python’s approach to evaluating truth values:
  - Any nonzero number or nonempty object is considered true.
  - Zero, empty objects, and `None` are considered false.
  - Comparisons and equality tests produce boolean results.
  - Boolean operators (`and`, `or`, and `not`) are used to combine tests and support short-circuit evaluation, meaning that evaluation stops as soon as the outcome is determined.

Overall, the chapter lays a foundation for understanding how Python makes decisions based on conditions, providing the basis for controlling program flow through well-structured, readable syntax.
