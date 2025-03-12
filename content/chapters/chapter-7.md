---
title: "Chapter 7: Lists & Dictionaries"
order: 7
weight: 7
chapter: 7

---
The list and dictionary object types are the main workhorses in almost all Python scripts. They are used to store, organize, and retrieve data efficiently. In this chapter, we cover how lists and dictionaries work, their basic operations, and how to modify them in-place.

---

## Lists

Lists are ordered collections of arbitrary objects. Unlike strings, lists can contain any type of object—including numbers, strings, and even other lists. Lists are mutable, meaning you can change their contents in-place using assignment (to individual items or slices), method calls, deletion statements, and more. Key properties include:

- **Ordered collections of arbitrary objects**
- **Accessed by offset (index)**
- **Variable-length, heterogeneous, and arbitrarily nestable**
- **Belong to the category “mutable sequence”**
- **Arrays of object references**

### Common List Literals and Operations

Below is a placeholder for a table summarizing common list literals and operations:

| Operation      | Description                          | Example                       |
|----------------|--------------------------------------|-------------------------------|
| `[]`           | Empty list literal                   | `[]`                          |
| `[item1, ...]` | List literal with items              | `[1, 2, 3]`                   |
| `L + M`        | Concatenation of two lists           | `[1, 2] + [3, 4]`             |
| `['Ni!'] * 4`  | Repetition of a list element         | `['Ni!', 'Ni!', 'Ni!', 'Ni!']`|

### Basic List Operations

Lists support many of the same operations as strings. For example:

```python
>>> len([1, 2, 3])
3
>>> [1, 2, 3] + [4, 5, 6]
[1, 2, 3, 4, 5, 6]
>>> ['Ni!'] * 4
['Ni!', 'Ni!', 'Ni!', 'Ni!']
```

*Note:* The `+` operator for lists requires both operands to be sequences. To combine a list and a string, you must convert one of them:

```python
>>> str([1, 2]) + "34"
'[1, 2]34'
>>> [1, 2] + list("34")
[1, 2, '3', '4']
```

### List Iteration and Comprehensions

Lists support membership tests and iteration:

```python
>>> 3 in [1, 2, 3]
True

>>> for x in [1, 2, 3]:
...     print(x, end=' ')
1 2 3 
```

List comprehensions offer a concise way to build new lists:

```python
>>> res = [c * 4 for c in 'SPAM']
>>> res
['SSSS', 'PPPP', 'AAAA', 'MMMM']
```

This is equivalent to:

```python
>>> res = []
>>> for c in 'SPAM':
...     res.append(c * 4)
>>> res
['SSSS', 'PPPP', 'AAAA', 'MMMM']
```

### Indexing, Slicing, and Matrixes

Since lists are sequences, you can index and slice them just like strings. However, indexing a list returns the object at that position, while slicing always returns a new list.

```python
>>> L = ['spam', 'Spam', 'SPAM!']
>>> L[2]
'SPAM!'
>>> L[-2]
'Spam'
>>> L[1:]
['Spam', 'SPAM!']
```

Lists can be nested. For example, a simple 3×3 matrix can be represented as:

```python
>>> matrix = [[1, 2, 3], [4, 5, 6], [7, 8, 9]]
>>> matrix[1]       # Get the second row
[4, 5, 6]
>>> matrix[1][1]    # Get the middle element
5
```

### Changing Lists In-Place

Because lists are mutable, you can modify them by assigning new values to individual items or slices:

```python
>>> L = ['spam', 'Spam', 'SPAM!']
>>> L[1] = 'eggs'
>>> L
['spam', 'eggs', 'SPAM!']

>>> L[0:2] = ['eat', 'more']
>>> L
['eat', 'more', 'SPAM!']
```

Slice assignment works in two steps:
1. The specified slice is deleted.
2. New items are inserted in its place.

For example, given `L = [1, 2, 3]`, the assignment `L[1:2] = [4, 5]` results in `[1, 4, 5, 3]`.

### List Method Calls

List objects provide many methods that modify the list in-place. Some common methods include:

- **append()**: Add an element to the end.
- **extend()**: Add multiple elements.
- **pop()**: Remove and return an element (default is the last item).
- **insert()**: Insert an element at a specified index.
- **remove()**: Remove the first occurrence of a value.
- **sort()**: Sort the list in-place.
- **reverse()**: Reverse the list in-place.
- **reversed()**: Returns an iterator that yields the list in reverse order.

Examples:

```python
>>> L = ['spam', 'eggs', 'ham']
>>> L.append('please')
>>> L
['spam', 'eggs', 'ham', 'please']

>>> L.sort()
>>> L
['SPAM!', 'eat', 'more', 'please']  # Example output after sort

>>> L.extend([1, 2, 3])
>>> L
['spam', 'eggs', 'ham', 'please', 1, 2, 3]

>>> L.pop()
3
>>> L
['spam', 'eggs', 'ham', 'please']
```

For stack-like behavior:

```python
>>> stack = []
>>> stack.append(1)
>>> stack.append(2)
>>> stack.pop()
2
```

To reverse a list without modifying it, use the `reversed` built-in wrapped in `list()`:

```python
>>> list(reversed(L))
```

---

## Dictionaries

Dictionaries are mutable mappings that store key–value pairs. Unlike lists, they are unordered and are accessed by key rather than by numerical index. Dictionaries are implemented as hash tables, which means that lookups are very fast.

### Common Dictionary Literals and Operations

Below is a placeholder for a table summarizing common dictionary literals and operations:

| Operation             | Description                                  | Example                           |
|-----------------------|----------------------------------------------|-----------------------------------|
| `{}`                  | Empty dictionary literal                     | `{}`                              |
| `{'key': value}`      | Dictionary literal with a key–value pair     | `{'a': 1, 'b': 2}`                |
| `D[key]`              | Access value by key                          | `D['spam']`                       |
| `D[key] = value`      | Set or update value for a key                | `D['eggs'] = 3`                   |
| `del D[key]`          | Delete a key–value pair                      | `del D['ham']`                    |

### Basic Dictionary Operations

Dictionaries are created using curly braces with key–value pairs:

```python
>>> D = {'spam': 2, 'ham': 1, 'eggs': 3}
>>> D['spam']
2
>>> len(D)
3
>>> 'ham' in D
True
>>> list(D.keys())
['eggs', 'ham', 'spam']
```

*Note:* The order of keys is not guaranteed. If you need a specific order, you can sort the keys.

### Changing Dictionaries In-Place

Since dictionaries are mutable, you can change their contents by assigning to keys or using the `del` statement:

```python
>>> D = {'eggs': 3, 'ham': 1, 'spam': 2}
>>> D['ham'] = ['grill', 'bake', 'fry']
>>> D
{'eggs': 3, 'ham': ['grill', 'bake', 'fry'], 'spam': 2}

>>> del D['eggs']
>>> D
{'ham': ['grill', 'bake', 'fry'], 'spam': 2}

>>> D['brunch'] = 'Bacon'
>>> D
{'ham': ['grill', 'bake', 'fry'], 'spam': 2, 'brunch': 'Bacon'}
```

### Using Dictionaries to Simulate Flexible Lists

Unlike lists, dictionaries do not require pre-allocation of space. For example, you can assign a value to a key without needing every index to exist:

```python
>>> D = {}
>>> D[99] = 'spam'
>>> D[99]
'spam'
```

### Using Dictionaries for Sparse Data Structures

Dictionaries can represent sparse data structures. For example, a three-dimensional array where only a few positions are nonempty can be stored as:

```python
>>> Matrix = {}
>>> Matrix[(2, 3, 4)] = 88
>>> Matrix[(7, 8, 9)] = 99
>>> Matrix[(2, 3, 4)]
88
```

Attempting to access a non-existent key results in a `KeyError`:

```python
>>> Matrix[(2, 3, 6)]
# Raises KeyError
```

To avoid such errors, use one of these methods:
- Check key existence with `in`
- Use a `try/except` block
- Use the `get()` method with a default value:

```python
>>> Matrix.get((2, 3, 6), 0)
0
```

### Using Dictionaries as “Records”

Dictionaries are ideal for representing structured data similar to records or structs in other languages. For example:

```python
>>> rec = {}
>>> rec['name'] = 'mel'
>>> rec['age'] = 45
>>> rec['job'] = 'trainer/writer'
>>> print(rec['name'])
Mel
```

They can also be nested to represent more complex information:

```python
>>> mel = {
...     'name': 'Mark',
...     'jobs': ['trainer', 'writer'],
...     'web': 'www.rmi.net/~lutz',
...     'home': {'state': 'CO', 'zip': 80513}
... }
>>> mel['home']['zip']
80513
```

### Sorting Dictionary Keys

Since dictionaries are unordered, you can obtain a sorted list of keys when iterating:

```python
>>> D = {'a': 1, 'c': 3, 'b': 2}
>>> for key in sorted(D):
...     print(key, D[key])
a 1
b 2
c 3
```

*Note:* In Python 3, `D.keys()` returns a view object, so you may need to convert it to a list before sorting, or simply use the `sorted()` function directly on the dictionary.

---

## Chapter Summary

- **Lists** are mutable, ordered collections that support indexing, slicing, concatenation, and repetition. They can store heterogeneous data and be nested arbitrarily.
- **List comprehensions** offer a concise syntax for creating new lists from existing sequences.
- **Changing lists in-place** can be done via index or slice assignments and with methods such as `append()`, `extend()`, `pop()`, `insert()`, `remove()`, `sort()`, and `reverse()`.
- **Dictionaries** are mutable mappings that store key–value pairs, offering fast lookup by key. They are unordered by default.
- **Basic dictionary operations** include accessing, updating, deleting keys, and testing membership. They are ideal for representing sparse data, flexible lists, and structured records.
- **Sorting dictionary keys** and using methods like `get()` help manage dictionaries effectively.

Together, lists and dictionaries provide powerful and flexible data structures that form the backbone of Python programming. They enable efficient data manipulation and are widely used in virtually every Python application.
