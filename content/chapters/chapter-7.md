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

| Operation                  | Interpretation                                |
|---------------------------|-----------------------------------------------|
| L1 + L2                   | Concatenate, repeat                            |
| L * 3                     |                                               |
| for x in L: print(x)      | Iteration, membership                          |
| 3 in L                    |                                               |
| L.append(4)              | Methods: growing                               |
| L.extend([5,6,7])        |                                               |
| L.insert(I, X)           |                                               |
| L.index(1)               | Methods: searching                             |
| L.count(X)               |                                               |
| L.sort()                 | Methods: sorting, reversing, etc.              |
| L.reverse()              |                                               |
| del L[k]                 | Methods, statement: shrinking                 |
| del L[i:j]               |                                               |
| L.pop()                  |                                               |
| L.remove(2)              |                                               |
| L[i:j] = []              |                                               |
| L[i] = 1                 | Index assignment            |
| L[i:j] = [4,5,6]         |                  slice assignment                              |
| L = [x**2 for x in range(5)] | List comprehensions                  |
| list(map(ord, 'spam'))    |                       maps                        |
| L = []                    | An empty list                                         |
| L = [0, 1, 2, 3]         | Four items: indexes 0..3                             |
| L = ['abc', ['def', 'ghi']] | Nested sublists                                       |
| L = list('spam')          | Lists of an iterable's items |
| L = list(range(-4, 4))    |                               list of successive integers                         |
| L[i]                      | Index                  |
| L[i][j]                   | Index of index                                                  |
| L[i:j]                    | Slice                                                     |
| len(L)                    | Length                                               |

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

| Operation                             | Interpretation                                    |
|--------------------------------------|---------------------------------------------------|
| D.items()                          | keys+values,                                       |
| D.copy()                           | copies,                                           |
| D.get(key, default)                | defaults,                                          |
| D.update(D2)                       | merge,                                            |
| D.pop(key)                         | delete, etc.                                      |
| len(D)                             | Length: number of stored entries                   |
| D[key] = 42                        | Adding/changing keys                               |
| del D[key]                         | Deleting entries by key                            |
| list(D.keys())                     | Dictionary views (Python 3.0)                       |
| D1.keys() & D2.keys()              |                                                   |
| D = {x: x*2 for x in range(10)}   | Dictionary comprehensions (Python 3.0)            |
| D = {}                                  | Empty dictionary                                                                 |
| D = {'spam': 2, 'eggs': 3}              | Two-item dictionary                                                              |
| D = {'food': {'ham': 1, 'egg': 2}}      | Nesting                                                                          |
| D = dict(name='Bob', age=40)             | Alternative construction techniques: keywords, zipped pairs, key lists           |
| D = dict(zip(keyslist, valslist))       |                                                                                  |
| D = dict.fromkeys(['a', 'b'])           |                                                                                  |
| D['eggs']                               | Indexing by key                                                                  |
| D['food']['ham']                          |                                                                                  |
| 'eggs' in D                             | Membership: key present test                                                     |
| D.keys()                                | Methods: keys,                                                                   |
| D.values()                              | values,                                                                          |

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

