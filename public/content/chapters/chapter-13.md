---
title: "Chapter 13: Scopes & Arguments"
order: 13
weight: 13
chapter: 13
---
We will present the details behind Python’s scopes and arguments—the places where variables are defined and looked up. Like module files, scopes help prevent name clashes across your program’s code; names defined in one program unit don’t interfere with names in another. We’ll also see that scope usage can have a major impact on program maintenance; for example, overuse of globals is generally bad. On the plus side, scopes provide a way to retain state information between function calls and can sometimes offer an alternative to classes.

## Python Scope Basics

When you use a name in a program, Python creates, changes, or looks up the name in a **namespace**—a place where names live. The term **scope** refers to this namespace; that is, the location of a name’s assignment in your source code determines its visibility. Functions add an extra namespace layer to minimize collisions among variables of the same name—by default, all names assigned inside a function belong only to that function’s namespace.

## Argument-Passing Basics

Key points in passing arguments to functions:

- **Arguments are passed by automatically assigning objects to local variable names.**
- **Assigning to argument names inside a function does not affect the caller.**
- **Changing a mutable object argument in a function may impact the caller.**

## Arguments and Shared References

To illustrate argument-passing properties, consider the following code:

```python
def f(a):  # a is assigned to (references) the passed object
    a = 99  # Changes local variable a only

b = 88
f(b)       # a and b both initially reference 88
print(b)   # b is not changed; outputs: 88
```

When arguments are passed mutable objects (like lists or dictionaries), in-place changes can persist after the function exits and affect the caller. For example:

```python
def changer(a, b):       # Arguments assigned references to objects
    a = 2                # Changes local name's value only
    b[0] = 'spam'        # Changes shared object in place

X = 1
L = [1, 2]               # Caller
changer(X, L)            # Pass immutable and mutable objects
print(X, L)              # X is unchanged; L becomes ['spam', 2]
```

Another example shows that assignment to a local variable does not change the caller’s variable:

```python
X = 1
a = X
a = 2  # Resets 'a' only; 'X' remains 1
print(X)  # Outputs: 1
```

## Simulating Output Parameters and Multiple Results

Although Python doesn’t support "call by reference" argument passing, you can simulate it by returning tuples and assigning the results back to the original argument names:

```python
def multiple(x, y):
    x = 2         # Changes local names only
    y = [3, 4]    # Creates a new list for y
    return x, y   # Return multiple new values in a tuple

X = 1
L = [1, 2]
X, L = multiple(X, L)  # Assign returned values to caller's names
print(X, L)          # Outputs: (2, [3, 4])
```

## Argument Matching Syntax

**[Table Placeholder: Special Argument Matching Syntax]**
