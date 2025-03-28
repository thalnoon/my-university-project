---
title: "Chapter 6: Strings"
order: 6
weight: 6
chapter: 6

---
---

## String Literals

There are many ways to write strings in your code:
- **Single quotes:** `'spa"m'`
- **Double quotes:** `"spa'm"`
- **Triple quotes:** `'''... spam ...'''` or `"""... spam ..."""`
- **Escape sequences:** `"s\tp\na\0m"`
- **Raw strings:** `r"C:\new\test.spm"`

The single- and double-quoted forms are by far the most common.

---

## Single- and Double-Quoted Strings Are the Same

Around Python strings, single and double quote characters are interchangeable. That is, string literals can be written enclosed in either single or double quotes; the two forms work the same and return the same type of object.

```python
>>> 'shrubbery', "shrubbery"
('shrubbery', 'shrubbery')
```

They allow you to embed a quote character of the other variety without escaping it:

```python
>>> 'knight"s', "knight's"
('knight"s', "knight's")
```

Python automatically concatenates adjacent string literals:

```python
>>> title = "Meaning " 'of' " Life"
>>> title
'Meaning of Life'
```

---

## Escape Sequences Represent Special Bytes

Backslashes are used to introduce escape sequences which represent special byte values. For example:

```python
>>> s = 'a\nb\tc'
>>> s
'a\nb\tc'
>>> print(s)
a
b	c
>>> len(s)
5
```

Another example with binary zero bytes:

```python
>>> s = 'a\0b\0c'
>>> s
'a\x00b\x00c'
>>> len(s)
5
```

And a string with absolute binary escape codes:

```python
>>> s = '\001\002\x03'
>>> s
'\x01\x02\x03'
>>> len(s)
3
```

---

## Basic Operations on Strings

Strings can be concatenated using the `+` operator and repeated using the `*` operator:

```python
>>> len('abc')
3
>>> 'abc' + 'def'
'abcdef'
>>> 'Ni!' * 4
'Ni!Ni!Ni!Ni!'
```

Adding two string objects creates a new string, while repetition concatenates a string to itself multiple times.

---

## String Methods

Methods are functions attached to string objects that perform higher-level operations. For example, some common string methods include:

- `S.capitalize()`
- `S.ljust(width [, fill])`
- `S.center(width [, fill])`
- `S.lower()`
- `S.count(sub [, start [, end]])`
- `S.lstrip([chars])`
- `S.encode([encoding [,errors]])`
- `S.maketrans(x[, y[, z]])`
- `S.endswith(suffix [, start [, end]])`
- `S.partition(sep)`
- `S.expandtabs([tabsize])`
- `S.replace(old, new [, count])`
- `S.find(sub [, start [, end]])`
- `S.rfind(sub [, start [, end]])`
- `S.format(fmtstr, *args, **kwargs)`
- `S.rindex(sub [, start [, end]])`
- `S.index(sub [, start [, end]])`
- `S.rjust(width [, fill])`
- `S.isalnum()`
- `S.rpartition(sep)`
- `S.isalpha()`
- `S.rsplit([sep[, maxsplit]])`
- `S.isdecimal()`
- `S.rstrip([chars])`
- `S.isdigit()`
- `S.split([sep [,maxsplit]])`
- `S.isidentifier()`
- `S.splitlines([keepends])`
- `S.islower()`
- `S.startswith(prefix [, start [, end]])`
- `S.isnumeric()`
- `S.strip([chars])`
- `S.isprintable()`
- `S.swapcase()`
- `S.isspace()`
- `S.title()`
- `S.istitle()`
- `S.translate(map)`
- `S.isupper()`
- `S.upper()`
- `S.join(iterable)`
- `S.zfill(width)`

---

## String Method Examples: Changing Strings

Since strings are immutable, you must create a new string when making changes.

Using slicing and concatenation:

```python
>>> S = 'spammy'
>>> S = S[:3] + 'xx' + S[5:]
>>> S
'spaxxy'
```

Using the `replace` method:

```python
>>> S = 'spammy'
>>> S = S.replace('mm', 'xx')
>>> S
'spaxxy'
```

Global replacement example:

```python
>>> 'aa$bb$cc$dd'.replace('$', 'SPAM')
'aaSPAMbbSPAMccSPAMdd'
```

To modify a string in-place, convert it to a list, modify, then join back:

```python
>>> S = 'spammy'
>>> L = list(S)
>>> L
['s', 'p', 'a', 'm', 'm', 'y']
>>> L[3] = 'x'
>>> L[4] = 'x'
>>> L
['s', 'p', 'a', 'x', 'x', 'y']
>>> S = ''.join(L)
>>> S
'spaxxy'
```

---

## Joining Strings

The `join` method concatenates an iterable of strings with a delimiter:

```python
>>> 'SPAM'.join(['eggs', 'sausage', 'ham', 'toast'])
'eggsSPAMsausageSPAMhamSPAMtoast'
```

---

## Slicing and Splitting Strings

Slicing extracts fixed substrings:

```python
>>> line = 'aaa bbb ccc'
>>> col1 = line[0:3]
>>> col3 = line[8:]
>>> col1
'aaa'
>>> col3
'ccc'
```

Splitting divides a string into substrings based on a delimiter (whitespace by default):

```python
>>> line = 'aaa bbb ccc'
>>> cols = line.split()
>>> cols
['aaa', 'bbb', 'ccc']
```

For other delimiters, pass the delimiter to `split()`.

---

## Other Common String Methods in Action

Examples of other string methods:

```python
>>> line = "The knights who say Ni!\n"
>>> line.rstrip()
'The knights who say Ni!'
>>> line.upper()
'THE KNIGHTS WHO SAY NI!\n'
>>> line.isalpha()
False
>>> line.endswith('Ni!\n')
True
>>> line.startswith('The')
True
```

Alternative techniques:

```python
>>> line
'The knights who say Ni!\n'
>>> line.find('Ni') != -1
True
>>> 'Ni' in line
True
>>> sub = 'Ni!\n'
>>> line.endswith(sub)
True
>>> line[-len(sub):] == sub
True
```

---

## String Formatting Expressions

String formatting allows multiple type-specific substitutions in a single step. The original technique uses the `%` operator:

```python
>>> 'That is %d %s bird!' % (1, 'dead')
'That is 1 dead bird!'
```

More examples:

```python
>>> exclamation = "Ni"
>>> "The knights who say %s!" % exclamation
'The knights who say Ni!'
>>> "%d %s %d you" % (1, 'spam', 4)
'1 spam 4 you'
>>> "%s -- %s -- %s" % (42, 3.14159, [1, 2, 3])
'42 -- 3.14159 -- [1, 2, 3]'
```

---

## Advanced String Formatting Expressions

Conversion type codes can be used in formatting expressions. The general structure is:

```
%[(name)][flags][width][.precision]typecode
```

Below is a table of common type codes:

| Code | Meaning                                                         |
|------|-----------------------------------------------------------------|
| s    | String (or any object's `str()` string)                         |
| r    | Same as s, but uses `repr()` instead                              |
| c    | Character                                                       |
| d    | Decimal (integer)                                               |
| i    | Integer                                                         |
| u    | Same as d (obsolete)                                              |
| o    | Octal integer                                                   |
| x    | Hex integer                                                     |
| X    | Hex integer (uppercase)                                           |
| e    | Floating-point exponent, lowercase                              |
| E    | Floating-point exponent, uppercase                              |
| f    | Floating-point decimal                                          |
| F    | Floating-point decimal                                          |
| g    | Floating-point (uses `e` or `f`, whichever is shorter)            |
| G    | Floating-point (uses `E` or `F`, whichever is shorter)            |
| %    | Literal `%`                                                     |

Examples:

```python
>>> x = 1234
>>> res = "integers: ...%d...%-6d...%06d" % (x, x, x)
>>> res
'integers: ...1234...1234 ...001234'
```

Floating-point formatting:

```python
>>> x = 1.23456789
>>> x
1.2345678899999999
>>> '%e | %f | %g' % (x, x, x)
'1.234568e+00 | 1.234568 | 1.23457'
>>> '%E' % x
'1.234568E+00'
```

More formatting examples:

```python
>>> '%-6.2f | %05.2f | %+06.1f' % (x, x, x)
'1.23 | 01.23 | +001.2'
>>> "%s" % x, str(x)
('1.23456789', '1.23456789')
```

Dynamic width and precision:

```python
>>> '%f, %.2f, %.*f' % (1/3.0, 1/3.0, 4, 1/3.0)
'0.333333, 0.33, 0.3333'
```

---

## Examples (Strings)

1. **Find the length of a word:**  
   ```python
   len(word)
   ```
2. **Convert a string to upper case:**  
   ```python
   word.upper()
   ```
3. **Capitalize the first word (first letter uppercase, rest lowercase):**  
   ```python
   print(word.capitalize())
   ```
4. **Convert a string to lower case:**  
   ```python
   word.lower()
   ```
5. **Concatenate first name and surname without a space:**  
   ```python
   name = firstname + surname
   ```
6. **Convert a phrase to title case:**  
   ```python
   word.title()
   ```
7. **Remove extra spaces from the start and end of a string:**  
   ```python
   text = " This is some text. "
   print(text.strip(" "))
   ```
8. **Slice a string:**  
   ```python
   print("Hello world"[7:10])
   ```
   (This displays "orl" from "Hello world" where indexing starts at 0.)
9. **Prompt the user for their first name and display its length.**
10. **Prompt for first name and surname, join them with a space, and display the full name and its length.**
11. **Prompt for first name and surname in lower case, convert to title case, join them, and display the result.**
12. **Prompt for the first line of a nursery rhyme, display its length, then ask for a starting and ending number and display that substring.**
13. **Prompt the user to enter any word and display it in upper case.**
14. **Prompt for the user's first name. If its length is under five characters, ask for their surname, join them without a space, and display the result in upper case; otherwise, display the first name in lower case.**
15. **Pig Latin Conversion:**  
    - If a word begins with a consonant, move the first consonant to the end and add "ay".  
    - If a word begins with a vowel, add "way" to the end.  
    Display the resulting word in lower case.

---

## Chapter Summary

- **String Literals:**  
  Various ways to define strings include single, double, and triple quotes, along with escape sequences and raw strings.

- **Escape Sequences:**  
  Special sequences using backslashes allow embedding non-printable or special characters in strings.

- **Basic Operations:**  
  Strings support concatenation with `+`, repetition with `*`, slicing, and length determination using `len()`.

- **String Methods:**  
  Built-in methods offer operations such as case conversion, searching, splitting, joining, and replacing substrings.

- **String Formatting:**  
  Both old-style (`%`) formatting and advanced formatting expressions provide flexible ways to format strings.

- **Practical Examples:**  
  Numerous examples illustrate how to manipulate and format strings, perform substring operations, and convert between mutable and immutable types.
