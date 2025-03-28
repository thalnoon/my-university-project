---
title: "Chapter 9: Introducing Python Statements"
order: 9
weight: 9
chapter: 9

---
---
The statements are the things you write to tell Python what your programs should do. If programs “do things with stuff,” statements are the way you specify what sort of things a program does. Python is a procedural, statement-based language; by combining statements, you specify a procedure that Python performs to satisfy a program’s goals.

## Python Program Structure Revisited

Another way to understand the role of statements is to revisit the concept hierarchy, which talked about built-in objects and the expressions used to manipulate them. The hierarchy levels are:
1. **Programs** are composed of modules.
2. **Modules** contain statements.
3. **Statements** contain expressions.
4. **Expressions** create and process objects.

At its core, Python syntax is composed of statements and expressions. Expressions process objects and are embedded in statements. Statements code the larger logic of a program’s operation—they use and direct expressions to process the objects we studied in the preceding chapters. Moreover, statements are where objects spring into existence (e.g., in expressions within assignment statements), and some statements create entirely new kinds of objects (functions, classes, and so on). Statements always exist in modules, which themselves are managed with statements.

## Python’s Statements

Table 1 summarizes Python’s statement set. This part of the book deals with entries in the table from the top through `break` and `continue`. You’ve informally been introduced to a few of the statements in Table 10-1 already; this part of the book will fill in details that were skipped earlier, introduce the rest of Python’s procedural statement set, and cover the overall syntax model. Statements lower in Table 10-1 that have to do with larger program units—functions, classes, modules, and exceptions—lead to larger programming ideas, so they will each have a section of their own. More focused statements (like `del`, which deletes various components) are covered elsewhere in the book, or in Python’s standard manuals.

| Statement                   | Role                    | Example                                                             |
| --------------------------- | ----------------------- | ------------------------------------------------------------------- |
| Assignment                  | Creating references     | a, *b = 'good', 'bad', 'ugly'                                       |
| Calls and other expressions | Running functions       | log.write("spam, ham")                                              |
| print calls                 | Printing objects        | print('The Killer', joke)                                           |
| if/elif/else                | Selecting actions       | if "python" in text: print(text)                                    |
| for/else                    | Sequence iteration      | for x in mylist: print(x)                                           |
| while/else                  | General loops           | while X > Y: print('hello')                                         |
| pass                        | Empty placeholder       | while True: pass                                                    |
| break                       | Loop exit               | while True: if exittest(): break                                    |
| continue                    | Loop continue           | while True: if skiptest(): continue                                 |
| def                         | Functions and methods   | def f(a, b, c=1, *d): print(a+b+c+d[0])                             |
| return                      | Functions results       | def f(a, b, c=1, *d): return a+b+c+d[0]                             |
| yield                       | Generator functions     | def gen(n): for i in n: yield i*2                                   |
| global                      | Namespaces              | x = 'old' def function(): global x, y; x = 'new'                    |
| nonlocal                    | Namespaces (3.0+)       | def outer(): x = 'old' def function(): nonlocal x; x = 'new'        |
| import                      | Module access           | import sys                                                          |
| from                        | Attribute access        | from sys import stdin                                               |
| class                       | Building objects        | class Subclass (Superclass): staticData = [] def method(self): pass |
| try/except/finally          | Catching exceptions     | try: action() except: print('action error')                         |
| raise                       | Triggering exceptions   | raise EndSearch(location)                                           |
| assert                      | Debugging checks        | assert X > Y, 'X too small'                                         |
| with/as                     | Context managers (2.6+) | with open('data') as myfile: process(myfile)                        |
| del                         | Deleting references     | del data[k]<br>del data[i:j]<br>del obj.attr<br>del variable        |

## What Python Adds

The one new syntax component in Python is the colon character (`:`). All Python compound statements (i.e., statements that have statements nested inside them) follow the same general pattern:
- **Header line:** A statement header terminated by a colon.
- **Nested statement block:** A block of code indented underneath the header line.

The colon is required, and omitting it is probably the most common coding mistake among new Python programmers—it’s certainly one I’ve witnessed thousands of times in Python training classes. In fact, if you are new to Python, you’ll almost certainly forget the colon character very soon. Most Python-friendly editors make this mistake easy to spot, and including it eventually becomes an unconscious habit.

## What Python Removes

Although Python requires the extra colon character, there are three things programmers in C-like languages must include that you don’t generally have to in Python:

1. **Parentheses are optional:**  
   In many C-like languages, tests at the top of statements require parentheses:
   ```c
   if (x < y)
   ```
   In Python, you simply omit the parentheses, and the statement works the same way:
   ```python
   if x < y:
   ```

2. **End of line is end of statement:**  
   In C-like languages, statements are terminated with semicolons:
   ```c
   x = 1;
   ```
   In Python, the end of a line automatically terminates the statement. You can leave off the semicolons:
   ```python
   x = 1
   ```

3. **End of indentation is end of block:**  
   In C-like languages, you need explicit markers (begin/end, then/endif, or braces) to indicate the start and end of a nested block:
   ```c
   if (x > y)
   {
       x = 1;
       y = 2;
   }
   ```
   In Python, you consistently indent all the statements in a given nested block, and Python uses that physical indentation to determine where the block starts and stops:
   ```python
   if x > y:
       x = 1
       y = 2
   ```

## Statement Rule Special Cases

Although statements normally appear one per line, it is possible to squeeze more than one statement onto a single line in Python by separating them with semicolons:

```python
a = 1; b = 2; print(a + b)  # Three statements on one line
```

*This is the only place in Python where semicolons are required: as statement separators. This only works if the statements combined are simple statements (like assignments, prints, and function calls). Compound statements must still appear on separate lines.*

Another special rule is that you can make a single statement span multiple lines by enclosing part of your statement in a bracketed pair—parentheses `()`, square brackets `[]`, or curly braces `{}`. Any code enclosed in these constructs can cross multiple lines; the statement doesn’t end until Python reaches the closing part of the pair. For instance, to continue a list literal:

```python
mlist = [111,
         222,
         333]
```

## A Quick Example: Interactive Loops

We’ll see all these syntax rules in action when we tour Python’s specific compound statements in the next few chapters, but they work the same throughout the language. To get started, let’s work through a brief, realistic example that demonstrates how statement syntax and nesting come together in practice.

### A Simple Interactive Loop

Suppose you’re asked to write a Python program that interacts with a user in a console window. Whether you’re accepting inputs to send to a database or reading numbers for a calculation, you need to code a loop that reads one or more inputs from a user typing on a keyboard, and prints back a result for each. In Python, typical boilerplate code for such an interactive loop might look like this:

```python
while True:
    reply = input('Enter text:')
    if reply == 'stop': break
    print(reply.upper())
```

This code makes use of a few new ideas:
- **While Loop:** Uses the `while` loop, which repeats a block of code as long as its test condition is true.
- **Input Function:** Uses the `input` function to display a prompt and capture user input as a string.
- **Single-line If Statement:** Implements a single-line `if` statement to exit the loop if the reply is `'stop'`.
- **Break Statement:** The `break` statement exits the loop immediately, so the program can continue after the loop.

### Doing Math on User Inputs

Suppose that instead of converting a text string to uppercase, you want to perform math (e.g., squaring a number). If you try the following:

```python
>>> reply = '20'
>>> reply ** 2
...error text omitted...
TypeError: unsupported operand type(s) for ** or pow(): 'str' and 'int'
```

This error occurs because Python does not automatically convert strings to numbers. You must convert the string to an integer first:

```python
>>> int(reply) ** 2
400
```

Armed with this information, you can recode your loop to perform the necessary math. For example, type the following in a file to test it:

```python
while True:
    reply = input('Enter text:')
    if reply == 'stop': break
    print(int(reply) ** 2)
print('Bye')
```

This script exits on `"stop"` as before, but it also converts inputs to perform the required math.

### Handling Errors by Testing Inputs

If the input is invalid (for example, non-numeric text), the built-in `int` function raises an exception:

```python
Enter text:xxx
...error text omitted...
ValueError: invalid literal for int() with base 10: 'xxx'
```

To avoid this, you can check the string’s content using the `isdigit` method:

```python
>>> S = '123'
>>> T = 'xxx'
>>> S.isdigit(), T.isdigit()
(True, False)
```

Using this, you can further nest your statements. Consider the following revised interactive script that avoids errors:

```python
while True:
    reply = input('Enter text:')
    if reply == 'stop':
        break
    elif not reply.isdigit():
        print('Bad!' * 8)
    else:
        print(int(reply) ** 2)
print('Bye')
```

### Nesting Code Three Levels Deep

Finally, consider another version of the script that branches based on the magnitude of valid input:

```python
while True:
    reply = input('Enter text:')
    if reply == 'stop':
        break
    elif not reply.isdigit():
        print('Bad!' * 8)
    else:
        num = int(reply)
        if num < 20:
            print('low')
        else:
            print(num ** 2)
print('Bye')
```

This example shows how you can nest code to multiple levels if needed.
