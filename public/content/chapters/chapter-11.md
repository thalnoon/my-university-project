---
title: "Chapter 11: While and For loops"
order: 11
weight: 11
chapter: 11

---

This chapter presents two main looping constructs—statements that repeat an action over and over. The first is the **while** statement, which provides a way to code general loops, and the second is the **for** statement, which is designed for stepping through the items in a sequence object and running a block of code for each.

## while Loops

Python’s **while** statement is the most general iteration construct in the language. In simple terms, it repeatedly executes a block of indented statements as long as a test at the top keeps evaluating to a true value. Control loops back to the start of the statement until the test becomes false. When the test becomes false, control passes to the statement following the while block. If the test is false from the beginning, the loop body never runs.

### General Format

In its most complex form, the while statement consists of:
- A header line with a test expression.
- A body of one or more indented statements.
- An optional else part that is executed if control exits the loop without a break statement.

```python
while <test>:                 # Loop test
    <statements1>             # Loop body
else:                         # Run if loop didn't exit with break
    <statements2>
```

### Examples

**Infinite Loop Example:**

```python
while True:
    print('Type Ctrl-C to stop me!')
```

**Slicing Characters from a String:**

```python
x = 'spam'
while x:                      # While x is not empty
    print(x, end=' ')         # Print current value of x on the same line
    x = x[1:]                 # Strip first character off x
```

The `end=' '` argument places all outputs on the same line separated by a space.

**Counter Loop Example:**

```python
a = 0; b = 10
while a < b:
    print(a, end=' ')         # Print a with a trailing space
    a += 1                    # Increment a (or use: a = a + 1)
```

**Simulating a “do until” Loop:**

```python
while True:
    # loop body...
    if exitTest(): break      # Exit loop if exitTest() returns True
```

## break, continue, pass, and the Loop else

Python provides several simple one-word statements that only make sense inside loops.

- **break**: Jumps out of the closest enclosing loop.
- **continue**: Jumps to the top of the closest enclosing loop.
- **pass**: Does nothing at all; it’s an empty statement placeholder.
- **Loop else block**: Runs if and only if the loop is exited normally (i.e., without encountering a break).

### General Loop Format (with break and continue)

```python
while <test1>:
    <statements1>
    if <test2>: break       # Exit loop now if <test2> is true
    if <test3>: continue     # Skip to next iteration if <test3> is true
else:                        # Run if we didn't hit a 'break'
    <statements2>
```

### Using pass in a Loop

To code an infinite loop that does nothing each time through, use:

```python
while True: pass  # Type Ctrl-C to stop me!
```

### Using continue to Skip Iterations

The **continue** statement causes an immediate jump to the top of the loop. For example, to skip odd numbers when counting down:

```python
x = 10
while x:
    x = x - 1               # Or use: x -= 1
    if x % 2 != 0: continue # If x is odd, skip printing
    print(x, end=' ')
```

### Using break to Exit a Loop

The **break** statement causes an immediate exit from a loop. For example, an interactive loop that exits when the user enters "stop":

```python
while True:
    name = input('Enter name:')   # Prompt for a name
    if name == 'stop': break        # Exit loop if name is 'stop'
    age = input('Enter age: ')      # Prompt for age
    print('Hello', name, '=>', int(age) ** 2)
```

### Loop else Clause Example

The loop else clause can eliminate the need for search status flags. For example, determining if a positive integer `y` is prime:

```python
x = y // 2                          # Start checking at half of y
while x > 1:
    if y % x == 0:
        print(y, 'has factor', x)   # A factor is found
        break                       # Exit the loop
    x -= 1
else:
    print(y, 'is prime')            # No factor found; y is prime
```

Another example with string processing:

```python
while x:
    if match(x[0]):
        print('Ni')
        break
    x = x[1:]
else:
    print('Not found')              # Printed only if loop exhausts x without a break
```

## for Loops

The **for** loop is a generic sequence iterator in Python that steps through the items in any ordered sequence—such as strings, lists, tuples, and other iterables.

### General Format

The for loop begins with a header line that specifies an assignment target and the sequence to step through. This is followed by an indented block of statements.

```python
for <target> in <object>:      # Assign each item from the sequence to <target>
    <statements>              # Repeated loop body that uses <target>
else:
    <statements>              # Runs if we didn't hit a 'break'
```

### Basic Usage

For example, iterating over a list:

```python
for x in ["spam", "eggs", "ham"]:
    print(x, end=' ')
```

This prints each item on the same line.

### Summing and Multiplying Items

```python
sum = 0
for x in [1, 2, 3, 4]:
    sum = sum + x             # Add each item to sum
print(sum)                    # Output: 10

prod = 1
for item in [1, 2, 3, 4]:
    prod *= item              # Multiply each item into prod
print(prod)                   # Output: 24
```

### Iterating Over Different Data Types

For loops work on strings and tuples as well:

```python
S = "lumberjack"
T = ("and", "I'm", "okay")
for x in S:
    print(x, end=' ')         # Iterate over a string
for x in T:
    print(x, end=' ')         # Iterate over a tuple
```

### Tuple Assignment in for Loops

When iterating through a sequence of tuples, you can unpack the tuple directly in the loop header:

```python
T = [(1, 2), (3, 4), (5, 6)]
for (a, b) in T:
    print(a, b)               # Tuple assignment at work
```

You can also iterate through dictionary items:

```python
D = {'a': 1, 'b': 2, 'c': 3}
for key in D:
    print(key, '=>', D[key])   # Using dict keys and indexing
print(list(D.items()))         # Show list of (key, value) tuples
for (key, value) in D.items():
    print(key, '=>', value)     # Iterate over both keys and values
```

Alternatively, manual unpacking is also possible:

```python
T = [(1, 2), (3, 4), (5, 6)]
for both in T:
    a, b = both              # Manual assignment equivalent to tuple unpacking
    print(a, b)
```

Nested sequence structures can also be unpacked automatically:

```python
((a, b), c) = ((1, 2), 3)
print(a, b, c)               # Output: 1 2 3
for ((a, b), c) in [((1, 2), 3), ((4, 5), 6)]:
    print(a, b, c)
for ((a, b), c) in [([1, 2], 3), ['XY', 6]]:
    print(a, b, c)
```

### Nested for Loops and Loop else Clause

The following example searches for each key in a list of items and reports whether it was found:

```python
items = ["aaa", 111, (4, 5), 2.01]
tests = [(4, 5), 3.14]
for key in tests:
    for item in items:
        if item == key:
            print(key, "was found")
            break
    else:
        print(key, "not found!")   # Loop else: executed if inner loop did not hit break
```

This example can be simplified by using the `in` operator:

```python
for key in tests:
    if key in items:
        print(key, "was found")
    else:
        print(key, "not found!")
```

### Collecting Common Items from Sequences

```python
seq1 = "spam"
seq2 = "scam"
res = []                        # Start with an empty list
for x in seq1:                  # Scan first sequence
    if x in seq2:               # If common item is found
        res.append(x)           # Add to result list
print(res)
```

## Loop Coding Techniques

The **for** loop subsumes most counter-style loops. It is generally simpler to code and quicker to run than a while loop. However, there are cases where you need specialized iterations (e.g., visiting every second or third item, or traversing multiple sequences in parallel). Python provides two built-in functions to help with these tasks: **range** and **zip**.

### Counter Loops: while and range

The **range** function generates a series of integers and is commonly used to generate indices in a for loop. In Python 3, `range` is an iterator, so you may need to convert it to a list to display its results:

```python
print(list(range(5)), list(range(2, 5)), list(range(0, 10, 2)))
# Output: ([0, 1, 2, 3, 4], [2, 3, 4], [0, 2, 4, 6, 8])
```

With one argument, it generates integers from zero up to (but not including) the argument’s value. With two arguments, the first is the lower bound. An optional third argument specifies the step:

```python
print(list(range(-5, 5)))       # Output: [-5, -4, -3, -2, -1, 0, 1, 2, 3, 4]
print(list(range(5, -5, -1)))    # Output: [5, 4, 3, 2, 1, 0, -1, -2, -3, -4]
```

Ranges are handy within for loops. For example, to print three lines:

```python
for i in range(3):
    print(i, 'Pythons')
```

Range is also used for indirect sequence iteration. For instance, to iterate over a string using indices:

```python
X = 'spam'
for i in range(len(X)):
    print(X[i], end=' ')
```

However, it is usually best to iterate directly over the sequence:

```python
for item in X:
    print(item)
```

#### Skipping Items with range and Slices

To visit every second item in a string:

```python
S = 'abcdefghijk'
print(list(range(0, len(S), 2)))  # Output: [0, 2, 4, 6, 8, 10]
for i in range(0, len(S), 2):
    print(S[i], end=' ')
```

A simpler method is to use slicing:

```python
for c in S[::2]:
    print(c, end=' ')
```

#### Modifying a List During Iteration

A simple for loop that modifies each item does not change the original list:

```python
L = [1, 2, 3, 4, 5]
for x in L:
    x += 1
print(L)  # Output: [1, 2, 3, 4, 5]
```

To change the list in-place, use indexing with range:

```python
L = [1, 2, 3, 4, 5]
for i in range(len(L)):
    L[i] += 1   # Or L[i] = L[i] + 1
print(L)        # Output: [2, 3, 4, 5, 6]
```

A while loop alternative is:

```python
i = 0
while i < len(L):
    L[i] += 1
    i += 1
print(L)        # Output: [3, 4, 5, 6, 7]
```

A list comprehension can also be used to create a modified list without changing the original in-place:

```python
new_L = [x + 1 for x in L]
```

### Parallel Traversals: zip and map

The **zip** function allows for parallel iteration over multiple sequences. For example, given two lists:

```python
L1 = [1, 2, 3, 4]
L2 = [5, 6, 7, 8]
print(list(zip(L1, L2)))  # Output: [(1, 5), (2, 6), (3, 7), (4, 8)]
```

Using zip with a for loop:

```python
for (x, y) in zip(L1, L2):
    print(x, y, '--', x + y)
```

Zip can also accept more than two sequences. With three sequences:

```python
T1, T2, T3 = (1, 2, 3), (4, 5, 6), (7, 8, 9)
print(list(zip(T1, T2, T3)))  # Output: [(1, 4, 7), (2, 5, 8), (3, 6, 9)]
```

If the sequences differ in length, zip truncates the result to the length of the shortest sequence:

```python
S1 = 'abc'
S2 = 'xyz123'
print(list(zip(S1, S2)))  # Output: [('a', 'x'), ('b', 'y'), ('c', 'z')]
```

In Python 2.x, the built-in **map** function could be used to pair items from sequences and would pad shorter sequences with `None`. (This behavior is not supported in Python 3.x.)

For example (Python 2.x only):

```python
print(map(None, S1, S2))
# Output: [('a', 'x'), ('b', 'y'), ('c', 'z'), (None, '1'), (None, '2'), (None, '3')]
```

A common usage of **map** in Python 3.x is to apply a function to every item in a sequence:

```python
print(list(map(ord, 'spam')))  # Output: [115, 112, 97, 109]
```

### Dictionary Construction with zip

When keys and values are obtained as lists at runtime, zip can be used to create a dictionary:

```python
keys = ['spam', 'eggs', 'toast']
vals = [1, 3, 5]
print(list(zip(keys, vals)))  # Output: [('spam', 1), ('eggs', 3), ('toast', 5)]
D2 = {}
for (k, v) in zip(keys, vals):
    D2[k] = v
print(D2)                     # Output: {'spam': 1, 'eggs': 3, 'toast': 5}
```

### Generating Both Offsets and Items: enumerate

The built-in **enumerate** function provides both the index (offset) and the item during iteration:

Traditional approach:

```python
S = 'spam'
offset = 0
for item in S:
    print(item, 'appears at offset', offset)
    offset += 1
```

Using enumerate:

```python
S = 'spam'
for (offset, item) in enumerate(S):
    print(item, 'appears at offset', offset)
```

The enumerate function returns an iterator that yields (index, value) tuples. You can also use the `next` function to retrieve these tuples manually:

```python
E = enumerate(S)
print(E)             # Shows the enumerate object
print(next(E))       # Output: (0, 's')
print(next(E))       # Output: (1, 'p')
print(next(E))       # Output: (2, 'a')
```
