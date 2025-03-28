---
title: "Chapter 3: How You Run the Programs"
order: 3
weight: 3
chapter: 3
---
There are a variety of ways to tell Python to execute the code you type. Along the way, you’ll learn how to type code interactively and how to save it in files to be run with system command lines, icon clicks, module imports and reloads, `exec` calls, menu options in GUIs such as IDLE, and more.

## The Interactive Prompt

Perhaps the simplest way to run Python programs is to type them at Python’s interactive command line, sometimes called the interactive prompt. There are a variety of ways to start this command line: in an IDE, from a system console, and so on. Assuming the interpreter is installed as an executable program on your system, the most platform-neutral way to start an interactive interpreter session is usually just to type `python` at your operating system’s prompt, without any arguments.  
For example:

```sh
% python
Python 3.0.1 (r301:69561, Feb 13 2009, 20:04:18) [MSC v.1500 32 bit (Intel)] ...
Type "help", "copyright", "credits" or "license" for more information.
>>>
```

## Running Code Interactively

However it’s started, the Python interactive session begins by printing two lines of informational text (which I’ll omit from most of this book’s examples to save space), then prompts for input with `>>>` when it’s waiting for you to type a new Python statement or expression. When working interactively, the results of your code are displayed after the `>>>` lines after you press the Enter key.  
For instance, here are the results of two Python `print` statements:

```sh
% python
>>> print('Hello world!')
Hello world!
>>> print(2 ** 8)
256
```

When coding interactively like this, you can type as many Python commands as you like. For example:

```sh
>>> lumberjack = 'okay'
>>> lumberjack
'okay'
>>> 2 ** 8
256
>>> <== Use Ctrl-D (on Unix) or Ctrl-Z (on Windows) to exit
%
```

In this section, you’ll learn how to run files in the most basic way: by listing their names in a `python` command line entered at your computer’s system prompt. Though it might seem primitive to some, for many programmers a system shell command line window, together with a text editor window, constitutes as much of an integrated development environment as they will ever need.

## A First Script

Open your favorite text editor (e.g., `vi`, Notepad, or the IDLE editor), and type the following statements into a new text file named `script1.py`:

```python
# A first Python script
import sys  # Load a library module
print(2 ** 100)  # Raise 2 to a power
x = 'Spam!'  
print(x * 8)  # String repetition
print(sys.platform)  # Print the system platform
```

You shouldn’t worry too much about this file’s code, but as a brief description, this file:

- Imports a Python module (libraries of additional tools) to fetch the name of the platform.
- Runs three `print` function calls to display the script’s results.
- Uses a variable named `x`, created when it’s assigned, to hold onto a string object.
- Applies various object operations that we’ll begin studying.

The `sys.platform` here is just a string that identifies the kind of computer you’re working on; it lives in a standard Python module called `sys`, which you must import to load.

## Running Files with Command Lines

You can ask Python to run it by listing its full filename as the first argument to a `python` command, typed at the system shell prompt:

```sh
% python script1.py
win32
1267650600228229401496703205376
Spam!Spam!Spam!Spam!Spam!Spam!Spam!Spam!
```

## The Input Trick

If you need your script’s output to stick around when you launch it with an icon click, simply put a call to the built-in `input` function at the very bottom of the script.  
For example:

```python
# A first Python script
import sys  # Load a library module
print(sys.platform)  
print(2 ** 100)  # Raise 2 to a power
x = 'Spam!'  
print(x * 8)  # String repetition
input()  # <== ADDED
```

In general, `input()` reads the next line of standard input, waiting if there is none yet available. The net effect in this context will be to pause the script, thereby keeping the output window shown in Figure 3-2 open until you press the Enter key.

**Figure 3-1:** When you click a program’s icon on Windows, you will be able to see its printed output if you include an `input()` call at the very end of the script. But you only need to do so in this context!

## The Attributes

Imports and reloads provide a natural program launch option because import operations execute files as a last step. In the broader scheme of things, though, modules serve the role of libraries of tools. More generally, a module is mostly just a package of variable names, known as a **namespace**. The names within that package are called **attributes**—an attribute is simply a variable name that is attached to a specific object (like a module).  

Externally, a module file’s names can be fetched with two Python statements, `import` and `from`, as well as the `reload` call.  
To illustrate, use a text editor to create a one-line Python module file called `myfile.py` with the following contents:

```python
title = "The Meaning of Life"
```

This may be one of the world’s simplest Python modules (it contains a single assignment statement), but it’s enough to illustrate the point. When this file is imported, its code is run to generate the module’s attribute. The assignment statement creates a module attribute named `title`.  

You can access this module’s `title` attribute in other components in two different ways.  
First, you can load the module as a whole with an `import` statement, and then qualify the module name with the attribute name to fetch it:

```sh
% python
>>> import myfile  # Run file; load module as a whole
>>> print(myfile.title)  # Use its attribute names: '.' to qualify
The Meaning of Life
```

In general, the dot expression syntax `object.attribute` lets you fetch any attribute attached to any object, and this is a very common operation in Python code. Here, we’ve used it to access the string variable `title` inside the module `myfile`—in other words, `myfile.title`.  

Alternatively, you can fetch (really, copy) names out of a module with `from` statements:

```sh
% python
>>> from myfile import title  # Run file; copy its names
>>> print(title)  # Use name directly: no need to qualify
The Meaning of Life
```

## The IDLE User Interface

So far, we’ve seen how to run Python code with the interactive prompt, system command lines, icon clicks, and module imports and `exec` calls. If you’re looking for something a bit more visual, **IDLE** provides a graphical user interface for doing Python development, and it’s a standard and free part of the Python system. It is usually referred to as an **integrated development environment (IDE)** because it binds together various development tasks into a single view.  

In short, **IDLE is a GUI** that lets you edit, run, browse, and debug Python programs, all from a single interface. Moreover, because IDLE is a Python program that uses the `tkinter` GUI toolkit, it runs portably on most Python platforms, including Microsoft Windows and X Windows.

## IDLE Basics

Let’s jump right into an example. IDLE is easy to start under Windows—it has an entry in the **Start** button menu for Python, and it can also be selected by right-clicking on a Python program icon.

**Figure 3-2:** The main Python shell window of the IDLE development GUI, shown here running on Windows. Use the **File** menu to begin (New Window) or change (Open...) a source file; use the text edit window’s **Run** menu to run the code in that window (Run Module).

