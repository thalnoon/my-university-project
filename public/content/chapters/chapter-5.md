---
title: "Chapter 5: Numeric Types"
order: 5
weight: 5
chapter: 5

---
Let’s get started by exploring our first data type category: Python’s numeric types.

## Numeric Type Basics

A complete inventory of Python’s numeric toolbox includes:
- Integers and floating-point numbers
- Complex numbers
- Fixed-precision decimal numbers
- Rational fraction numbers
- Sets
- Booleans
- Unlimited integer precision
- A variety of numeric built-ins and modules

We will present a brief overview of how we write and process numbers in our scripts.

## Numeric Literals

Among its basic types, Python provides integers (positive and negative whole numbers) and floating-point numbers (numbers with a fractional part, sometimes called "floats" for economy). Table 1 (not shown) illustrates what Python’s numeric types look like when written as literals.

## Built-in Numeric Tools

Besides the built-in number literals, Python provides a set of tools for processing numeric objects:

- **Expression operators:** `+`, `-`, `*`, `/`, `>>`, `**`, `&`, etc.
- **Built-in mathematical functions:** `pow`, `abs`, `round`, `int`, `hex`, `bin`, etc.
- **Utility modules:** `random`, `math`, etc.

### Python Expression Operators

Table 2 (not shown) lists all the operator expressions available in Python. Many are self-explanatory; for instance, the usual mathematical operators (`+`, `-`, `*`, `/`, etc.) are supported.

## Examples

Below are several example expressions:

1. `A * B + C * D`
2. `(X + Y) * Z`
3. `X + (Y * Z)`
4. `40 + 3.14`

Interactive examples:

```python
>>> int(3.1415)
6
>>> float(3)
3.0

>>> a = 3
>>> b = 4
>>> a + 1, a - 1
(4, 2)
>>> b * 3, b / 2
# (Results depend on the expression)
>>> a % 2, b ** 2
# (Results depend on the expression)
>>> 2 + 4.0, 2.0 ** b
# (Results depend on the expression)
>>> b / (2.0 + a)
0.80000000000000004
>>> print(b / (2.0 + a))
0.8
>>> 1 / 2.0
0.5
>>> num = 1 / 3.0
>>> num
0.33333333333333331
>>> print(num)
0.333333333333
>>> '%e' % num
'3.333333e-01'
>>> '%4.2f' % num
'0.33'
>>> '{0:4.2f}'.format(num)
'0.33'
```

The comments above explain:
- Converting a float to an integer and vice versa.
- Basic arithmetic operations such as addition, subtraction, multiplication, division, modulus, and exponentiation.
- Mixed-type conversions and string formatting for floating-point numbers.

## Comparisons: Normal and Chained

Numbers can also be compared. Normal comparisons compare the relative magnitudes of their operands and return a Boolean result:

```python
>>> 1 < 2
True
>>> 2.0 >= 1
True
>>> 2.0 == 2.0
True
>>> 2.0 != 2.0
False
```

Python also supports chained comparisons, which allow range tests:

```python
>>> Y = 4
>>> Z = 6
>>> X < Y < Z       # Equivalent to: X < Y and Y < Z
True
>>> X < Y and Y < Z
True

>>> X < Y > Z       # Chained comparisons with a false result
False
>>> 1 < 2 < 3.0 < 4
True
>>> 1 > 2 > 3.0 > 4
False
>>> 1 == 2 < 3
False
```

## Division and Floor Division

The division operators behave differently depending on the operands:

```sh
C:\misc> C:\Python30\python
>>> 10 / 4       # True division (Python 3.0)
2.5
>>> 10 // 4      # Floor division: truncates the remainder
2
>>> 10 / 4.0
2.5
>>> 10 // 4.0   # Floor division with float result
2.0

C:\misc> C:\Python26\python
>>> 10 / 4
2
>>> 10 // 4
2
>>> 10 / 4.0
2.5
>>> 10 // 4.0
2.0
```

## Complex Numbers

Complex numbers are represented as two floating-point numbers (the real and imaginary parts). The imaginary part is denoted by a `j` or `J` suffix.

```python
>>> 1j * 1J
(-1+0j)
>>> 2 + 1j * 3
(2+3j)
>>> (2 + 1j) * 3
(6+3j)
```

## Hexadecimal, Octal, and Binary Notation

Python integers can be written in hexadecimal, octal, and binary notations:

```python
>>> 0o1, 0o20, 0o377
(1, 16, 255)
>>> 0x01, 0x10, 0xFF
(1, 16, 255)
>>> 0b1, 0b10000, 0b11111111
(1, 16, 255)
```

Conversion functions:

```python
>>> oct(64), hex(64), bin(64)
('0100', '0x40', '0b1000000')
>>> int('64'), int('100', 8), int('40', 16), int('1000000', 2)
(64, 64, 64, 64)
>>> int('0x40', 16), int('0b1000000', 2)
(64, 64)
```

Using `eval` to process literals:

```python
>>> eval('64'), eval('0o100'), eval('0x40'), eval('0b1000000')
(64, 64, 64, 64)
```

String formatting for other bases:

```python
>>> '{0:o}, {1:x}, {2:b}'.format(64, 64, 64)
'100, 40, 1000000'
>>> '%o, %x, %X' % (64, 255, 255)
'100, ff, FF'
```

## Bitwise Operations

Python supports bitwise operations on integers. For example:

```python
>>> x = 1  # Binary: 0001
>>> x << 2   # Shift left 2 bits: 0100
4
>>> x | 2    # Bitwise OR: 0001 | 0010 = 0011
3
>>> x & 1    # Bitwise AND: 0001 & 0001 = 0001
1
```

Additional bitwise examples:

```python
>>> X = 0b0001
>>> X << 2
4
>>> bin(X << 2)
'0b100'
>>> bin(X | 0b010)
'0b11'
>>> bin(X & 0b1)
'0b1'
```

Hexadecimal and XOR examples:

```python
>>> X = 0xFF
>>> bin(X)
'0b11111111'
>>> X ^ 0b10101010
85
>>> bin(X ^ 0b10101010)
'0b1010101'
>>> int('1010101', 2)
85
>>> hex(85)
'0x55'
```

## Other Built-in Numeric Tools

Python provides many built-in functions and standard library modules for numeric processing:

```python
>>> import math
>>> math.pi, math.e
(3.1415926535897931, 2.7182818284590451)
>>> math.sin(2 * math.pi / 180)
0.034899496702500969
>>> math.sqrt(144), math.sqrt(2)
(12.0, 1.4142135623730951)
>>> pow(2, 4), 2 ** 4
(16, 16)
>>> abs(-42.0), sum((1, 2, 3, 4))
(42.0, 10)
>>> min(3, 1, 2, 4), max(3, 1, 2, 4)
(1, 4)
```

### Rounding and Formatting

Truncation and rounding examples:

```python
>>> math.floor(2.567), math.floor(-2.567)
(2, -3)
>>> math.trunc(2.567), math.trunc(-2.567)
(2, -2)
>>> int(2.567), int(-2.567)
(2, -2)
>>> round(2.567), round(2.467), round(2.567, 2)
(3, 2, 2.57)
>>> '%.1f' % 2.567, '{0:.2f}'.format(2.567)
('2.6', '2.57')
```

Note the difference between `round` (which returns a number) and string formatting (which produces a string):

```python
>>> (1 / 3), round(1 / 3, 2), ('%.2f' % (1 / 3))
(0.33333333333333331, 0.33, '0.33')
```

### Square Roots

There are three common ways to compute square roots:

```python
>>> import math
>>> math.sqrt(144)
12.0
>>> 144 ** 0.5
12.0
>>> pow(144, 0.5)
12.0

>>> math.sqrt(1234567890)
35136.418286444619
>>> 1234567890 ** 0.5
35136.418286444619
>>> pow(1234567890, 0.5)
35136.418286444619
```

## The Random Module

The standard library `random` module provides tools for generating random numbers:

```python
>>> import random
>>> random.random()
0.44694718823781876
>>> random.random()
0.28970426439292829
>>> random.randint(1, 10)
5
>>> random.randint(1, 10)
4
>>> random.choice(['Life of Brian', 'Holy Grail', 'Meaning of Life'])
'Life of Brian'
>>> random.choice(['Life of Brian', 'Holy Grail', 'Meaning of Life'])
'Holy Grail'
```

The `random` module can be useful for shuffling items, selecting random elements, performing simulations, and more.

## Chapter Summary

- **Numeric Types Overview:**  
  Python supports a wide range of numeric types including integers, floats, complex numbers, decimals, fractions, and more.

- **Literals and Operators:**  
  Numeric literals can be written in decimal, hexadecimal, octal, and binary formats. Operators and built-in functions (e.g., `pow`, `abs`, `round`) allow for a variety of arithmetic and bitwise operations.

- **Comparisons and Chaining:**  
  Numbers can be compared normally or with chained comparisons to perform range tests.

- **Complex and Special Numbers:**  
  Python supports complex numbers and provides various modules (like `math` and `random`) for advanced numeric processing.

- **Utility Tools:**  
  Built-in functions and modules offer additional tools for numeric conversion, formatting, rounding, and generating random numbers.
