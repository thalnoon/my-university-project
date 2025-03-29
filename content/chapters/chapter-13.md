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

| Syntax                | Location | Interpretation                                                                |
|-----------------------|----------|-----------------------------------------------------------------------------|
| func(value)           | Caller   | Normal argument: matched by position                                        |
| func(name=value)      | Caller   | Keyword argument: matched by name                                           |
| func(*iterable)       | Caller   | Pass all objects in iterable as individual positional arguments              |
| func(**dict)          | Caller   | Pass all key/value pairs in dict as individual keyword arguments             |
| def func(name)        | Function | Normal argument: matches any passed value by position or name               |
| def func(name=value)  | Function | Default argument value, if not passed in the call                          |
| def func(*name)       | Function | Matches and collects remaining positional arguments in a tuple              |
| def func(**name)      | Function | Matches and collects remaining keyword arguments in a dictionary             |
| def func(*other, name)| Function | Arguments that must be passed by keyword only in calls (3.X)                |
| def func(*, name=value)| Function | Arguments that must be passed by keyword only in calls (3.X)                |

---
## Chapter Summary

### Overview

This chapter explains **scopes** and **arguments** in Python, focusing on how variables are defined and accessed. Scopes help avoid name clashes, and understanding them improves **code maintainability** and **functionality**.

---

#### **1. Understanding Scope in Python**

Scope determines **where a variable can be accessed** in the code. Python follows the **LEGB rule**:

- **Local Scope**: Variables defined inside a function.
- **Enclosing Scope**: Variables in outer functions (for nested functions).
- **Global Scope**: Variables defined at the top level of a script/module.
- **Built-in Scope**: Predefined Python functions and keywords (e.g., `print()`, `len()`).

**Example:**

```python
x = 10  # Global variable

def outer_function():
    y = 5  # Enclosing variable

    def inner_function():
        z = 2  # Local variable
        print(x, y, z)  # Can access all three

    inner_function()

outer_function()
```

---

#### **2. Argument-Passing Basics**

When calling a function, arguments are assigned to local variable names inside the function.

- **Immutable arguments (integers, strings, tuples)**: The function **cannot modify** them directly.
- **Mutable arguments (lists, dictionaries)**: The function **can modify** them.

**Example:**

```python
def modify_list(lst):
    lst.append(4)  # Modifies the original list

my_list = [1, 2, 3]
modify_list(my_list)
print(my_list)  # Output: [1, 2, 3, 4]
```

---

#### **3. Default and Keyword Arguments**

Python functions support **default values** for arguments and allow passing arguments by **keywords**.

**Example: Default Arguments**

```python
def greet(name="Guest"):
    print(f"Hello, {name}!")

greet()  # Output: Hello, Guest!
greet("Alice")  # Output: Hello, Alice!
```

**Example: Keyword Arguments**

```python
def display_info(name, age):
    print(f"Name: {name}, Age: {age}")

display_info(age=25, name="John")  # Arguments are passed in any order
```

---

#### **4. Argument Packing and Unpacking (********`*args`******** and ********`**kwargs`********)**

- `*args` allows passing multiple positional arguments.
- `**kwargs` allows passing multiple keyword arguments.

\*\*Example: Using \*\***`*args`**

```python
def sum_numbers(*args):
    return sum(args)

print(sum_numbers(1, 2, 3, 4))  # Output: 10
```

\*\*Example: Using \*\***`**kwargs`**

```python
def print_details(**kwargs):
    for key, value in kwargs.items():
        print(f"{key}: {value}")

print_details(name="Alice", age=25, city="New York")
```

---
### [Chapter 13 Quiz](https://docs.google.com/forms/d/e/1FAIpQLSdmGd2bx9A7V_YQnLwgyP5WGGtuUkxO_cCmkC-m-HR4DEc4bA/viewform)
