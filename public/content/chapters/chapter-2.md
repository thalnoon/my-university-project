---
title: "Chapter 2: How Python Runs Programs"
order: 2
weight: 2
chapter: 2
pdf: "/pdf/chapter2.pdf"
ppt: "/ppt/chapter2.pptx"

---

## Introducing the Python Interpreter

Python is a software package called an interpreter—a program that executes other programs. When you write a Python program, the Python interpreter reads your code and carries out the instructions it contains.

After installation on your machine, the Python package generates a few components—minimally, an interpreter and a support library. Depending on how you use it, the Python interpreter may be an executable program or a set of libraries linked into another program. The Python code you write must always be run by this interpreter. To enable that, you must install a Python interpreter on your computer.

- **Windows users:** Fetch and run a self-installing executable file that puts Python on their machines. Simply double-click and say Yes or Next at all prompts.
- Python can be downloaded from the [Python website](http://www.python.org) or through various other distribution channels. Always check whether Python is already present before installing it.

## The Programmer’s View

In its simplest form, a Python program is just a text file containing Python statements. For example, the following file, named `script0.py`, is one of the simplest Python scripts, yet it functions as a complete program:

```python
Print ('hello world')
print (2 ** 100)
```

## Byte Code Compilation

When you execute a Python program, the interpreter first compiles your source code into a format known as **byte code**. This compilation step translates each source statement into a set of lower-level, platform-independent instructions. Byte code execution is faster than running the original source code line by line. If the Python process has write access, it stores this compiled byte code in files ending with a `.pyc` extension. These files are created in the same directory as your source code after you run your programs.

## The Python Virtual Machine (PVM)

Once your program has been compiled to byte code (or loaded from existing `.pyc` files), it is handed off to the **Python Virtual Machine (PVM)** for execution. The PVM is essentially a loop that iterates through your byte code instructions one by one, performing their operations. It serves as the **runtime engine** of Python—integral to the Python system and responsible for actually running your scripts. In essence, the PVM is the final stage of the Python interpreter.

**Figure 2-1:** Python’s traditional runtime execution model – source code is automatically compiled to byte code, which is then interpreted by the Python Virtual Machine.

---

## Chapter Summary

- **Python Interpreter:**  
  Acts as the core software that executes Python programs. It reads your source code and runs the instructions contained within it.

- **The Programmer’s View:**  
  A Python program is simply a text file of statements. Even a minimal script, like one that prints a message or calculates a power, is a complete program.

- **Byte Code Compilation:**  
  Python automatically compiles source code into a lower-level byte code, stored as `.pyc` files, to enhance execution speed.

- **Python Virtual Machine (PVM):**  
  The PVM is the runtime engine that executes the byte code in a continuous loop, forming the final step in running your Python programs.
