---
title: "Chapter 8: Tuples, Files, and Everything Else"
order: 8
weight: 8
chapter: 8

---
---
The file object is a commonly used and full-featured tool for processing files; the basic overview here is supplemented by larger examples in later chapters.

## Tuples

The last collection type in our survey is the Python tuple. Tuples construct simple groups of objects. They work exactly like lists, except that tuples can’t be changed in-place (they’re immutable) and are usually written as a series of items in parentheses, not square brackets. Although they don’t support as many methods, tuples share most of their properties with lists. Here’s a quick look at the basics.

Tuples are:
- **Ordered collections of arbitrary objects:** Like strings and lists, tuples are positionally ordered collections of objects (i.e., they maintain a left-to-right order among their contents) and can embed any kind of object.
- **Accessed by offset:** Items in a tuple are accessed by offset (not by key); they support all the offset-based access operations, such as indexing and slicing.
- **Immutable sequences:** Tuples support many of the same operations as strings and lists but are immutable; they don’t support any in-place change operations.
- **Fixed-length, heterogeneous, and arbitrarily nestable:** Because tuples are immutable, you cannot change their size without making a copy. However, they can hold any type of object—including other compound objects—allowing arbitrary nesting.
- **Arrays of object references:** Tuples are best thought of as object reference arrays; they store references to other objects, and indexing a tuple is relatively quick.

Like lists, tuples are best thought of as object reference arrays; they store access points to other objects (references), and indexing a tuple is relatively quick. Table 9-1 highlights common tuple operations. A tuple is written as a series of objects (technically, expressions that generate objects), separated by commas and normally enclosed in parentheses. An empty tuple is just a pair of parentheses with nothing inside.

**[Table 1 Placeholder: Common tuple literals and operations]**

### Tuples in Action

```python
>>> (1, 2) + (3, 4)  # Concatenation
(1, 2, 3, 4)
>>> (1, 2) * 4  # Repetition
(1, 2, 1, 2, 1, 2, 1, 2)
>>> T = (1, 2, 3, 4)
>>> T[0], T[1:3]  # Indexing, slicing
(1, (2, 3))
```

### Tuple Syntax Peculiarities: Commas and Parentheses

The second and fourth entries in Table 1 merit a bit more explanation. Because parentheses can also enclose expressions, you need to do something special to tell Python when a single object in parentheses is a tuple and not a simple expression. If you really want a single-item tuple, simply add a trailing comma after the single item before the closing parenthesis:

```python
>>> x = (40)  # An integer!
>>> x
40
>>> y = (40,)  # A tuple containing an integer
>>> y
(40,)
```

As a special case, Python also allows you to omit the opening and closing parentheses for a tuple in contexts where it isn’t syntactically ambiguous. For instance, in an assignment statement, simply listing four items separated by commas is recognized as a tuple—even without parentheses.

## Conversions, Methods, and Immutability

Apart from literal syntax differences, tuple operations (the middle rows in Table 91) are identical to string and list operations. The only differences worth noting are that the `+`, `*`, and slicing operations return new tuples when applied to tuples, and that tuples don’t provide the same methods available for strings, lists, and dictionaries. If you want to sort a tuple, for example, you’ll usually have to first convert it to a list to access the sorting method or use the built-in `sorted` function:

```python
>>> T = ('cc', 'aa', 'dd', 'bb')  # Original tuple
>>> tmp = list(T)  # Make a list from a tuple's items
>>> tmp.sort()  # Sort the list
>>> tmp
['aa', 'bb', 'cc', 'dd']
>>> T = tuple(tmp)  # Make a tuple from the list's items
>>> T
('aa', 'bb', 'cc', 'dd')
>>> sorted(T)  # Or use the sorted built-in
['aa', 'bb', 'cc', 'dd']
```

Here, the list and tuple built-in functions convert the tuple to a list and then back to a tuple, effectively performing a conversion. List comprehensions can also convert tuples. For example, the following makes a list from a tuple, adding 20 to each item:

```python
>>> T = (1, 2, 3, 4, 5)
>>> L = [x + 20 for x in T]
>>> L
[21, 22, 23, 24, 25]
```

Although tuples don’t have the same methods as lists and strings, they do have two of their own (as of Python 2.6 and 3.0): `index` and `count`. These work as they do for lists:

```python
>>> T = (1, 2, 3, 2, 4, 2)  # Example tuple
>>> T.index(2)  # Offset of first appearance of 2
1
>>> T.index(2, 2)  # Offset of appearance after offset
23
>>> T.count(2)  # How many 2s are there?
3
```

Note that the rule about tuple immutability applies only to the top level of the tuple itself, not to its contents. A list inside a tuple, for instance, can be changed:

```python
>>> T = (1, [2, 3], 4)
>>> T[1] = 'spam'  # This fails: can't change tuple itself
Traceback (most recent call last):
  ...
TypeError: object doesn't support item assignment
>>> T[1][0] = 'spam'  # This works: can change mutables inside
>>> T
(1, ['spam', 3], 4)
```

## Why Lists and Tuples?

A common question for beginners is: why do we need tuples if we have lists? Historically, Python’s creator viewed a tuple as a simple association of objects (constant by nature) and a list as a data structure that changes over time. The immutability of tuples provides integrity—once created, a tuple won’t be changed through another reference in a program. This makes tuples useful for roles similar to constant declarations and allows their use as dictionary keys. In general, use lists for ordered collections that might need to change and tuples for fixed associations.

## Files

You may already be familiar with files—named storage compartments on your computer managed by the operating system. The built-in `open` function creates a file object that links your Python program to an external file. Once opened, you can transfer strings of data to and from the file using its methods. File objects differ from numbers, sequences, or mappings because they primarily provide methods for common file-processing tasks (such as reading, writing, seeking, and flushing output buffers).

**[Table 2 Placeholder: Common file operations]**

### Opening Files

To open a file, call the built-in `open` function with the filename and a processing mode. The mode is typically:
- `'r'` to open for text input (the default)
- `'w'` to create and open for text output
- `'a'` to open for appending text to the end

Additional mode options include:
- Adding a **b** to the mode string for binary data (disabling end-of-line translations and Unicode encodings).
- Adding a **+** to open the file for both input and output (allowing both reading and writing, often with seek operations).

Both arguments to `open` must be strings, and an optional third argument can control output buffering (e.g., passing a zero means unbuffered output). If no directory path is provided, the file is assumed to exist in the current working directory.

### Using Files

Once a file object is created with `open`, you can call its methods to read from or write to the external file. File data is handled as strings in Python. Reading returns strings, and writing requires strings. Although there are many methods (some of which are listed in Table 2), here are a few usage notes:

- **File iterators are best for reading lines:** Rather than reading the entire file at once, you can iterate over a file object to process one line at a time.
- **Content is strings, not objects:** Data read from a file is always returned as a string. You’ll need to convert it to another type if necessary. Likewise, Python does not automatically convert objects to strings when writing—you must format the string yourself.

Additionally, advanced standard library tools (like the `pickle` and `struct` modules) can handle generic object storage and packed binary data.

- **close is usually optional:** While Python automatically closes files when they are garbage-collected, it is good practice to manually close files to free operating system resources and flush output buffers.

Files are buffered and seekable. The `seek` method allows you to jump to specific locations within a file for reading or writing.

### Files in Action

Let’s work through a simple example that demonstrates file-processing basics. The following code opens a new text file for output, writes two lines (each terminated with a newline marker, `\n`), and closes the file. Later, the file is reopened in input mode and the lines are read one at a time with `readline`. Note that the third call to `readline` returns an empty string, indicating the end of the file.

```python
>>> myfile = open('myfile.txt', 'w')  # Open for text output: create/empty
>>> myfile.write('hello text file\n')  # Write a line of text: string
16
>>> myfile.write('goodbye text file\n')  # Write a line of text: string
18
>>> myfile.close()  # Flush output buffers to disk
>>> myfile = open('myfile.txt')  # Open for text input: 'r' is default
>>> myfile.readline()  # Read the first line back
'hello text file\n'
>>> myfile.readline()  # Read the next line back
'goodbye text file\n'
>>> myfile.readline()  # Empty string: end of file
''
```

This example writes each line (including the end-of-line marker) explicitly. If you want to display the file’s content with interpreted newlines, you can read the entire file into a string and print it:

```python
>>> open('myfile.txt').read()  # Read all at once into a string
'hello text file\ngoodbye text file\n'
>>> print(open('myfile.txt').read())  # User-friendly display
hello text file
goodbye text file
```

To scan a text file line by line, file iterators are often the best option:

```python
>>> for line in open('myfile'):
...     print(line, end='')  # Use file iterators, not reads
...
hello text file
goodbye text file
```

When coded this way, the temporary file object created by `open` automatically reads one line per iteration. This method is simple, memory-efficient, and often faster than other options.

### Text and Binary Files in Python 3.0

In both Python 3.0 and 2.6, file type is determined by the mode string passed to `open`—adding a **b** indicates binary mode. In Python 3.0 there is a sharper distinction:
- **Text files** represent content as normal `str` strings, perform Unicode encoding/decoding automatically, and handle end-of-line translation.
- **Binary files** represent content as a special `bytes` type and provide access to file content unaltered.

In Python 2.6, text files handle both 8-bit text and binary data with additional interfaces for Unicode. In practice, if your script deals with simple text, the file interface is largely the same between versions.

For example, when reading a binary file you get a `bytes` object:

```python
>>> data = open('data.bin', 'rb').read()  # Open binary file: rb = read binary
>>> data  # Bytes string holds binary data
b'\x00\x00\x00\x07spam\x00\x08'
>>> data[4:8]  # Act like strings
b'spam'
>>> data[0]  # But really are small 8-bit integers
115
>>> bin(data[0])  # Python 3.0 bin() function
'0b1110011'
```

Binary files do not perform any end-of-line translation; text files automatically map all newline variations to `\n` and handle Unicode encodings.

## Storing and Parsing Python Objects in Files

The next example writes a variety of Python objects into a text file on multiple lines. Since file data is always stored as strings, you must convert objects to strings manually. (For brevity, byte-count return values from `write` are omitted.)

```python
>>> X, Y, Z = 43, 44, 45  # Native Python objects
>>> S = 'Spam'  # Must be strings to store in file
>>> D = {'a': 1, 'b': 2}
>>> L = [1, 2, 3]
>>> F = open('datafile.txt', 'w')  # Create output file
>>> F.write(S + '\n')  # Terminate lines with \n
>>> F.write('%s,%s,%s\n' % (X, Y, Z))  # Convert numbers to strings
>>> F.write(str(L) + '$' + str(D) + '\n')  # Convert and separate with $
>>> F.close()
```

Once created, inspect the file’s contents by reading it into a string. The interactive echo shows the exact byte contents, while printing the string interprets newline characters:

```python
>>> chars = open('datafile.txt').read()  # Raw string display
>>> chars
"Spam\n43,44,45\n[1, 2, 3]${'a': 1, 'b': 2}\n"
>>> print(chars)  # User-friendly display
Spam
43,44,45
[1, 2, 3]${'a': 1, 'b': 2}
```

To work with these strings as actual Python objects, further conversion is needed. For example, read the first line and remove its trailing newline:

```python
>>> F = open('datafile.txt')  # Open again
>>> line = F.readline()  # Read one line
>>> line
'Spam\n'
>>> line.rstrip()
'Spam'
```

Next, read a line containing numbers and split it on commas:

```python
>>> line = F.readline()  # Next line from file: it's a string here
>>> line
'43,44,45\n'
>>> parts = line.split(',')  # Split (parse) on commas
>>> parts
['43', '44', '45\n']
>>> int(parts[1])  # Convert from string to int
44
>>> numbers = [int(P) for P in parts]  # Convert all in list at once
>>> numbers
[43, 44, 45]
```

Finally, convert a stored list and dictionary (separated by `$`) using `eval`:

```python
>>> line = F.readline()
>>> line
"[1, 2, 3]${'a': 1, 'b': 2}\n"
>>> parts = line.split('$')  # Split (parse) on $
>>> parts
['[1, 2, 3]', "{'a': 1, 'b': 2}\n"]
>>> eval(parts[0])
[1, 2, 3]
>>> objects = [eval(P) for P in parts]  # Convert to any object type
>>> objects
[[1, 2, 3], {'a': 1, 'b': 2}]
```

## Storing Native Python Objects with pickle

Using `eval` to convert strings to objects is powerful—but potentially dangerous. If you can’t trust the data source, use Python’s standard library `pickle` module to store native Python objects directly, without manual conversion.

To store a dictionary using pickle:

```python
>>> D = {'a': 1, 'b': 2}  # Pickle any object to file
>>> F = open('datafile.pkl', 'wb')
>>> import pickle
>>> pickle.dump(D, F)
>>> F.close()
```

To retrieve the dictionary later:

```python
>>> F = open('datafile.pkl', 'rb')
>>> E = pickle.load(F)
>>> E  # Load any object from file
{'a': 1, 'b': 2}
```

The pickle module handles object serialization (converting objects to and from byte strings) with minimal effort. For more details, consult the Python standard library manual or use interactive help with `import pickle`.

## Storing and Parsing Packed Binary Data in Files

Some advanced applications require handling packed binary data (perhaps created by a C program). Python’s standard library includes the `struct` module, which can both compose and parse packed binary data.

To create a packed binary data file, open it in binary write mode (`'wb'`), and use `struct.pack` with a format string and the appropriate Python objects. For example, the format string `'>i4sh'` specifies a 4-byte integer, a 4-character string, and a 2-byte integer (all in big-endian form):

```python
>>> F = open('data.bin', 'wb')  # Open binary output file
>>> import struct
>>> data = struct.pack('>i4sh', 7, 'spam', 8)  # Make packed binary
>>> data
b'\x00\x00\x00\x07spam\x00\x08'
>>> F.write(data)  # Write byte string
>>> F.close()
```

To parse the packed data back into Python objects:

```python
>>> F = open('data.bin', 'rb')
>>> data = F.read()  # Get packed binary data
>>> data
b'\x00\x00\x00\x07spam\x00\x08'
>>> values = struct.unpack('>i4sh', data)  # Convert to Python objects
>>> values
(7, 'spam', 8)
``` 
