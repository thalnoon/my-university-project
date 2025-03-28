---
title: "Chapter 12: Functions Basics"
order: 12
weight: 12
chapter: 12
---
In the previous part, we looked at basic procedural statements in Python. Here, we move on to explore a set of additional statements that we can use to create functions of our own. In simple terms, a function is a device that groups a set of statements so they can be run more than once in a program. Functions can compute a result value and allow us to specify parameters that serve as function inputs, which may differ each time the code is run. Coding an operation as a function makes it a generally useful tool that can be used in a variety of contexts.

More fundamentally, functions are the alternative to programming by cutting and pasting—rather than having multiple redundant copies of an operation’s code, we can factor it into a single function. In so doing, we reduce our future work radically: if the operation must be changed later, we update only one copy rather than many. Functions are the most basic program structure Python provides for maximizing code reuse and minimizing redundancy, and they are also a design tool that lets us split complex systems into manageable parts.

**[Table Placeholder: Primary function-related tools]**

## Why Use Functions?

Functions are a nearly universal program-structuring device. You may have encountered them before in other languages, where they may have been called subroutines or procedures. In Python, functions serve two primary roles:

- **Maximizing Code Reuse and Minimizing Redundancy:**  
  Functions are the simplest way to package logic for use in more than one place and at more than one time. Rather than writing duplicate code, you define the operation once and call it as needed.
  
- **Procedural Decomposition:**  
  Functions help you split complex tasks into smaller, well-defined parts. For example, making a pizza involves mixing the dough, rolling it out, adding toppings, baking, etc. Each of these subtasks can be encapsulated in its own function, making the overall process easier to manage.

## Coding Functions

Although we have already used some built-in functions (like `open` and `len`), we now explore how to write new functions in Python. Functions we write behave the same way as the built-ins: they are called in expressions, passed values, and return results.

### Core Concepts

- **`def` is Executable Code:**  
  Python functions are defined with the `def` statement. Unlike functions in compiled languages (e.g., C), `def` is an executable statement. The function does not exist until Python reaches and runs the `def`. It is even legal (and occasionally useful) to nest `def` statements inside `if` statements, loops, or other functions.

- **`def` Creates an Object and Assigns It to a Name:**  
  When Python runs a `def` statement, it creates a new function object and assigns it to the given name. Function objects can be assigned to other names, stored in data structures, and can have arbitrary attributes attached.

- **`lambda` Creates an Object and Returns It:**  
  Functions may also be created with the `lambda` expression. This allows in-line function definitions in contexts where a `def` statement is not syntactically permitted.

- **`return` Sends a Result Back to the Caller:**  
  When a function is called, it runs its code and sends a result back to the caller using a `return` statement. If no `return` statement is present, the function returns the `None` object automatically.

- **`yield` for Generators:**  
  Functions known as generators can use `yield` to send back a value and suspend execution, allowing them to produce a series of results over time.

- **`global` and `nonlocal`:**  
  The `global` statement declares that certain names are module-level variables, while `nonlocal` (introduced in Python 3) allows a function to assign to variables in an enclosing function's scope. These keywords help manage variable scopes.

- **Arguments are Passed by Assignment (Object Reference):**  
  In Python, arguments are passed by assignment. The caller and function share references to the same objects, but changing the reference inside the function does not affect the caller’s reference. However, modifying mutable objects can have an effect.

- **No Declarations for Arguments, Return Values, or Variables:**  
  Python does not require type declarations. A single function can be applied to different object types as long as the objects support the expected interface.

## The `def` Statement

The `def` statement creates a function object and assigns it to a name. Its general format is:

```python
def <name>(arg1, arg2, ... argN):
    <statements>  # Function body executed each time the function is called
```

A function body often contains a `return` statement to send a result back to the caller:

```python
def <name>(arg1, arg2, ... argN):
    ...
    return <value>  # Returns <value> to the caller
```

If there is no `return` statement, the function returns `None` by default.

## `def` Executes at Runtime

The `def` statement is executable code. When it runs, it creates a new function object and assigns it to a name. This means:

- `def` can appear anywhere a statement is allowed (even nested inside other statements).
- The function is not defined until the `def` is executed.
- The function object can be assigned to other names, passed around, and can have attributes attached.

For example, you can define a function conditionally:

```python
if test:
    def func():
        # Define func this way
        ...
else:
    def func():
        # Or define func this other way
        ...
# Call the version that was selected and built
func()
```

You can also assign a function to another name:

```python
othername = func  # Assign function object to a new name
func()            # Call the original function
```

Functions can have attributes attached to them:

```python
def func():
    ...
func.attr = value  # Attach an attribute to the function object
```

## A First Example: Definitions and Calls

### Definition

Here’s an interactive definition of a function called `times` that returns the product of its two arguments:

```python
def times(x, y):  # Create and assign function 'times'
    return x * y  # Return the product of x and y when called
```

When Python runs this `def`, it creates a new function object assigned to the name `times`.

### Calls

After the function is defined, you can call it by passing arguments in parentheses:

```python
times(2, 4)  # Call times with arguments 2 and 4; returns 8
```

This call passes two arguments to `times`. The function multiplies them and returns the result. You can also save the result:

```python
x = times(3.14, 4)  # Save the result of 3.14 * 4
print(x)            # Outputs: 12.56
```

Notice that Python functions are "typeless"—they work with any types that support the operations used in the function. For example:

```python
times('Ni', 4)  # Repeats the string 'Ni' four times, resulting in 'NiNiNiNi'
```

In this case, the `*` operator repeats a string rather than performing numeric multiplication.

## A Second Example: Intersecting Sequences

Here is a function that finds the common items between two sequences. Packaging the loop inside a function makes the code reusable and easier to maintain.

### Definition

```python
def intersect(seq1, seq2):
    res = []             # Start with an empty list for results
    for x in seq1:       # Iterate over each element in seq1
        if x in seq2:    # Check if the element is in seq2
            res.append(x)  # Append common elements to the result list
    return res           # Return the list of common elements
```

### Calls

Once defined, call the function by passing two sequences:

```python
s1 = "SPAM"
s2 = "SCAM"
print(intersect(s1, s2))  # For strings, outputs: ['S', 'A', 'M']
```

The algorithm is simple: for every item in the first argument, if that item is also in the second, it is added to the result list. Although this function is not optimized for performance and does not remove duplicates, it demonstrates the basics of function definition and reuse.

A more concise version using a list comprehension is:

```python
print([x for x in s1 if x in s2])  # Outputs: ['S', 'A', 'M']
```

## Polymorphism Revisited

Like all functions in Python, `intersect` is polymorphic. It works on arbitrary types as long as the objects support the operations used (such as membership tests):

```python
x = intersect([1, 2, 3], (1, 4))  # Works with a list and a tuple
print(x)  # Outputs the common elements (if any)
```

