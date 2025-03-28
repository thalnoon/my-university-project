---
title: "Chapter 4: Object Types"
order: 4
weight: 4
chapter: 4

---
Python programs can be decomposed into modules, statements, expressions, and objects, as follows:
1. Programs are composed of modules.
2. Modules contain statements.
3. Statements contain expressions.
4. Expressions create and process objects.

## Python’s Core Data Types

| Object type                 | Example literals/creation        |
|-----------------------------|---------------------------------|
| Numbers                     | 1234, 3.1415, 3+4j, Decimal, Fraction |
| Strings                     | 'spam', "guido's", b'a\x01c'     |
| Lists                       | [1, [2, 'three'], 4]             |
| Dictionaries                | {'food': 'spam', 'taste': 'yum'} |
| Tuples                      | (1, 'spam', 4, 'U')              |
| Files                       | myfile = open('eggs', 'r')      |
| Sets                        | set('abc'), {'a', 'b', 'c'}      |
| Other core types            | Booleans, types, None           |
| Program unit types          | Functions, modules, classes     |
| Implementation-related types | Compiled code, stack tracebacks |

## Numbers

Numbers in Python support the normal mathematical operations. For instance, the plus sign (`+`) performs addition, a star (`*`) is used for multiplication, and two stars (`**`) are used for exponentiation:

```python
>>> 123 + 222
# Integer addition
345
>>> 1.5 * 4
# Floating-point multiplication
6.0
>>> 2 ** 100
# 2 to the power 100
1267650600228229401496703205376
```

You can, for instance, compute 2 to the power 1,000,000 as an integer in Python, but you probably shouldn’t try to print the result—with more than 300,000 digits, you may be waiting awhile!

```python
>>> len(str(2 ** 1000000))
301030  # How many digits in a really BIG number?
```

Besides expressions, there are a handful of useful numeric modules that ship with Python—modules are just packages of additional tools that we import to use:

```python
>>> import math
>>> math.pi
3.1415926535897931
>>> math.sqrt(85)
9.2195444572928871
```

The `math` module contains more advanced numeric tools as functions, while the `random` module performs random number generation and random selections:

```python
>>> import random
>>> random.random()
0.59268735266273953
>>> random.choice([1, 2, 3, 4])
1
```

## Strings

For example, if we have a four-character string, we can verify its length with the built-in `len` function and fetch its components with indexing expressions:

```python
>>> S = 'Spam'
>>> len(S)
4
>>> S[0]
'S'
>>> S[1]
'p'
```

In Python, we can also index backward, from the end—positive indexes count from the left, and negative indexes count back from the right:

```python
>>> S[-1]
'm'
>>> S[-2]
'a'
```

Formally, a negative index is simply added to the string’s size, so the following two operations are equivalent:

```python
>>> S[-1]
'm'
>>> S[len(S)-1]
'm'
```

In addition to simple positional indexing, sequences also support a more general form of indexing known as slicing, which is a way to extract an entire section (slice) in a single step. For example:

```python
>>> S
'Spam'
>>> S[1:3]
'pa'
>>> S[0:3]
'Spa'
>>> S[:3]
'Spa'
>>> S[:-1]
'Spa'
>>> S[:]
'Spam'
```

Strings also support concatenation with the plus sign (`+`) and repetition:

```python
>>> S
'Spam'
>>> S + 'xyz'
'Spamxyz'
>>> S * 8
'SpamSpamSpamSpamSpamSpamSpamSpam'
```

Notice that the plus sign (`+`) means different things for different objects: addition for numbers, and concatenation for strings.

## Type-Specific Methods

Strings have operations all their own, available as methods—functions attached to the object. For example, the string `find` method is the basic substring search operation, and the `replace` method performs global searches and replacements:

```python
>>> S.find('pa')
1
>>> S.replace('pa', 'XYZ')
'SXYZm'
>>> S
'Spam'
```

Other methods split a string into substrings on a delimiter, perform case conversions, test the content of the string (such as `isalpha`, `isdigit`, etc.), and strip whitespace characters off the ends of the string:

```python
>>> line = 'aaa,bbb,ccccc,dd'
>>> line.split(',')
['aaa', 'bbb', 'ccccc', 'dd']
>>> S = 'spam'
>>> S.upper()
'SPAM'
>>> S.isalpha()
True
```

```python
>>> line = 'aaa,bbb,ccccc,dd\n'
>>> line = line.rstrip()
>>> line
'aaa,bbb,ccccc,dd'
```

Strings also support an advanced substitution operation known as formatting, available as both an expression and a string method:

```python
>>> '%s, eggs, and %s' % ('spam', 'SPAM!')
'spam, eggs, and SPAM!'
>>> '{0}, eggs, and {1}'.format('spam', 'SPAM!')
'spam, eggs, and SPAM!'
```

## Getting Help

You can always call the built-in `dir` function, which returns a list of all the attributes available for a given object:

```python
>>> dir(S)
['__add__', '__class__', '__contains__', '__delattr__', '__doc__', '__eq__',
 '__format__', '__ge__', '__getattribute__', '__getitem__', '__getnewargs__',
 '__gt__', '__hash__', '__init__', '__iter__', '__le__', '__len__', '__lt__',
 '__mod__', '__mul__', '__ne__', '__new__', '__reduce__', '__reduce_ex__',
 '__repr__', '__rmod__', '__rmul__', '__setattr__', '__sizeof__', '__str__',
 '__subclasshook__', '_formatter_field_name_split', '_formatter_parser',
 'capitalize', 'center', 'count', 'encode', 'endswith', 'expandtabs', 'find',
 'format', 'index', 'isalnum', 'isalpha', 'isdecimal', 'isdigit', 'isidentifier',
 'islower', 'isnumeric', 'isprintable', 'isspace', 'istitle', 'isupper', 'join',
 'ljust', 'lower', 'lstrip', 'maketrans', 'partition', 'replace', 'rfind',
 'rindex', 'rjust', 'rpartition', 'rsplit', 'rstrip', 'split', 'splitlines',
 'startswith', 'strip', 'swapcase', 'title', 'translate', 'upper', 'zfill']
```

To ask what they do, you can pass them to the `help` function:

```python
>>> help(S.replace)
```

## Pattern Matching

Text pattern matching is an advanced tool outside this book’s scope, but to perform pattern matching in Python, import the `re` module. This module provides functions for searching, splitting, and replacing using regular expression patterns:

```python
>>> import re
>>> match = re.match('Hello[ \t]*(.*)world', 'Hello Python world')
>>> match.group(1)
'Python '
```

This example searches for a substring that begins with the word "Hello," followed by zero or more spaces or tabs, capturing the intermediate text up to "world." For another example:

```python
>>> match = re.match('/(.*)/(.*)/(.*)', '/usr/home/lumberjack')
>>> match.groups()
('usr', 'home', 'lumberjack')
```

## Sequence Operations

Lists support all the sequence operations for strings; the results are usually lists instead of strings. For example, given a three-item list:

```python
>>> L = [123, 'spam', 1.23]
>>> len(L)
3
```

You can index, slice, and concatenate lists:

```python
>>> L[0]
123
>>> L[:-1]
[123, 'spam']
>>> L + [4, 5, 6]
[123, 'spam', 1.23, 4, 5, 6]
>>> L
[123, 'spam', 1.23]
```

## Type-Specific Operations on Lists

Python’s lists are related to arrays in other languages, but they tend to be more powerful. Lists can contain objects of different types and have no fixed size—they can grow and shrink on demand:

```python
>>> L.append('NI')
>>> L
[123, 'spam', 1.23, 'NI']
>>> L.pop(2)
1.23
>>> L
[123, 'spam', 'NI']
```

Other list methods include `insert` (to add an item at an arbitrary position) and `remove` (to delete an item by value). For example:

```python
>>> M = ['bb', 'aa', 'cc']
>>> M.sort()
>>> M
['aa', 'bb', 'cc']
>>> M.reverse()
>>> M
['cc', 'bb', 'aa']
```

## Bounds Checking

Although lists have no fixed size, Python does not allow you to reference items that are not present. Indexing or assigning to an index outside the current list range will raise an error:

```python
>>> L
[123, 'spam', 'NI']
>>> L[99]
# IndexError: list index out of range
>>> L[99] = 1
# IndexError: list assignment index out of range
```

## Nesting

One nice feature of Python’s core data types is that they support arbitrary nesting. For example, a list can contain other lists to represent a matrix:

```python
>>> M = [
...     [1, 2, 3],
...     [4, 5, 6],
...     [7, 8, 9]
... ]
>>> M
[[1, 2, 3], [4, 5, 6], [7, 8, 9]]
```

Access nested items as follows:

```python
>>> M[1]
[4, 5, 6]
>>> M[1][2]
6
```

## Comprehensions

List comprehensions provide a powerful way to create new lists by processing sequences. For example, to extract the second column of the matrix:

```python
>>> col2 = [row[1] for row in M]
>>> col2
[2, 5, 8]
```

Other examples include modifying items or filtering:

```python
>>> [row[1] + 1 for row in M]
[3, 6, 9]
>>> [row[1] for row in M if row[1] % 2 == 0]
[2, 8]
```

More examples:

```python
>>> diag = [M[i][i] for i in [0, 1, 2]]
>>> diag
[1, 5, 9]
>>> doubles = [c * 2 for c in 'spam']
>>> doubles
['ss', 'pp', 'aa', 'mm']
```

Generator comprehensions can produce results on demand:

```python
>>> G = (sum(row) for row in M)
>>> next(G)
6
>>> next(G)
15
```

Using `map` to apply a function over a sequence:

```python
>>> list(map(sum, M))
[6, 15, 24]
```

Set and dictionary comprehensions:

```python
>>> {sum(row) for row in M}
{24, 6, 15}
>>> {i: sum(M[i]) for i in range(3)}
{0: 6, 1: 15, 2: 24}
```

Additional examples:

```python
>>> [ord(x) for x in 'spaam']
[115, 112, 97, 97, 109]
>>> {ord(x) for x in 'spaam'}
{112, 97, 115, 109}
>>> {x: ord(x) for x in 'spaam'}
{'a': 97, 'p': 112, 's': 115, 'm': 109}
```

## Dictionaries

Python dictionaries are mappings that store objects by key rather than by position. For example, a dictionary literal:

```python
>>> D = {'food': 'Spam', 'quantity': 4, 'color': 'pink'}
```

Accessing and modifying values:

```python
>>> D['food']
'Spam'
>>> D['quantity'] += 1
>>> D
{'food': 'Spam', 'color': 'pink', 'quantity': 5}
```

Creating a dictionary incrementally:

```python
>>> D = {}
>>> D['name'] = 'Bob'
>>> D['job'] = 'dev'
>>> D['age'] = 40
>>> D
{'age': 40, 'job': 'dev', 'name': 'Bob'}
>>> print(D['name'])
Bob
```

## Nesting Revisited

For more complex data, dictionaries can be nested. For example:

```python
>>> rec = {
...     'name': {'first': 'Bob', 'last': 'Smith'},
...     'job': ['dev', 'mgr'],
...     'age': 40.5
... }
```

Accessing nested data:

```python
>>> rec['name']
{'first': 'Bob', 'last': 'Smith'}
>>> rec['name']['last']
'Smith'
>>> rec['job']
['dev', 'mgr']
>>> rec['job'][-1]
'mgr'
>>> rec['job'].append('janitor')
>>> rec
{'name': {'first': 'Bob', 'last': 'Smith'}, 'job': ['dev', 'mgr', 'janitor'], 'age': 40.5}
```

## Sorting Keys: for Loops

Dictionaries do not maintain order, but you can sort the keys and iterate over them:

```python
>>> D = {'a': 1, 'b': 2, 'c': 3}
>>> D
{'a': 1, 'c': 3, 'b': 2}
>>> Ks = list(D.keys())
>>> Ks.sort()
>>> Ks
['a', 'b', 'c']
>>> for key in Ks:
...     print(key, '=>', D[key])
a => 1
b => 2
c => 3
```

Alternatively, using the `sorted` function:

```python
>>> for key in sorted(D):
...     print(key, '=>', D[key])
a => 1
b => 2
c => 3
```

## Iteration and Optimization

For loops and list comprehensions are the main ways to code repetitive tasks. For example, computing squares with a list comprehension:

```python
>>> squares = [x ** 2 for x in [1, 2, 3, 4, 5]]
>>> squares
[1, 4, 9, 16, 25]
```

The equivalent for loop:

```python
>>> squares = []
>>> for x in [1, 2, 3, 4, 5]:
...     squares.append(x ** 2)
>>> squares
[1, 4, 9, 16, 25]
```

Tools like `map` and comprehensions are generally faster than for loops for large data sets.

## Missing Keys: if Tests

Assigning to a new key grows a dictionary:

```python
>>> D = {'a': 1, 'c': 3, 'b': 2}
>>> D['e'] = 99
>>> D
{'a': 1, 'c': 3, 'b': 2, 'e': 99}
```

Attempting to access a nonexistent key results in an error:

```python
>>> D['f']
# KeyError: 'f'
```

Test for key existence:

```python
>>> 'f' in D
False
```

Using a default value with `get`:

```python
>>> value = D.get('x', 0)
>>> value
0
>>> value = D['x'] if 'x' in D else 0
>>> value
0
```

## Other Core Types

### Sets

Sets are unordered collections of unique and immutable objects. Create sets using the built-in `set` function or set literals:

```python
>>> X = set('spam')
>>> Y = {'h', 'a', 'm'}
>>> X, Y
({'a', 'p', 's', 'm'}, {'a', 'h', 'm'})
```

Set operations:

```python
>>> X & Y
# Intersection
{'a', 'm'}
>>> X | Y
# Union
{'a', 'p', 's', 'h', 'm'}
>>> X - Y
# Difference
{'p', 's'}
```

Set comprehensions are also supported:

```python
>>> {x ** 2 for x in [1, 2, 3, 4]}
{16, 1, 4, 9}
```

### Additional Numeric Types

Python includes decimal numbers and fraction numbers to address limitations of floating-point arithmetic:

```python
>>> 1 / 3
0.33333333333333331
>>> (2/3) + (1/2)
1.1666666666666665
```

Using the `decimal` module:

```python
>>> import decimal
>>> d = decimal.Decimal('3.141')
>>> d + 1
Decimal('4.141')
>>> decimal.getcontext().prec = 2
>>> decimal.Decimal('1.00') / decimal.Decimal('3.00')
Decimal('0.33')
```

Using the `fractions` module:

```python
>>> from fractions import Fraction
>>> f = Fraction(2, 3)
>>> f + 1
Fraction(5, 3)
>>> f + Fraction(1, 2)
Fraction(7, 6)
```

### Booleans and None

Python also includes Booleans and a special placeholder `None`:

```python
>>> 1 > 2, 1 < 2
(False, True)
>>> bool('spam')
True
>>> X = None
>>> print(X)
None
>>> L = [None] * 100
>>> L
[None, None, None, None, ...]  # A list of 100 Nones
```

## Examples (Object Types)

1. **Display a number rounded to two decimal places:**
   ```python
   print(round(num, 2))
   ```
2. **Compute the square root of a number (requires `import math`):**
   ```python
   math.sqrt(num)
   ```
3. **Convert user input to a floating-point number:**
   ```python
   num = float(input("Enter number: "))
   ```
4. **Display pi (π) to 15 decimal places (requires `import math`):**
   ```python
   print(math.pi)
   ```
5. **Perform whole number division (e.g., `15 // 2` yields `7`):**
   ```python
   x // y
   ```
6. **Find the remainder (e.g., `15 % 2` yields `1`):**
   ```python
   x % y
   ```
