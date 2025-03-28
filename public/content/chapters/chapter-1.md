---
title: "Chapter 1: Introduction to Python"
order: 1
weight: 1
chapter: 1
pdf: "/static/pdf/chapter1.pdf"
ppt: "/static/ppt/chapter1.pptx"
summary: "This chapter covers the basics of the subject..."
---

This book introduces the Python programming language. Python is a popular open source programming language used for both standalone programs and scripting applications in a wide variety of domains. It is free, portable, powerful, and remarkably easy and fun to use. Programmers from every corner of the software industry have found Python’s focus on developer productivity and software quality to be a strategic advantage in projects both large and small.

## Is Python a “Scripting Language”?

Python is a general-purpose programming language that is often applied in scripting roles. It is commonly defined as an object-oriented scripting language—a definition that blends support for OOP with an overall orientation toward scripting roles. In fact, people often use the word “script” instead of “program” to describe a Python code file. In this book, the terms “script” and “program” are used interchangeably, with a slight preference for “script” to describe a simpler top-level file and “program” to refer to a more sophisticated multifile application.

## Who Uses Python Today?

At this writing, the best estimate anyone can seem to make of the size of the Python user base is that there are roughly 1 million Python users around the world today (plus or minus a few). This estimate is based on various statistics, like download rates and developer surveys. Because Python is open source, a more exact count is difficult; there are no license registrations to tally. Moreover, Python is automatically included with Linux distributions, Macintosh computers, and some products and hardware, further clouding the user-base picture. By individual users, Python is also being applied in real revenue-generating products by real companies. For instance:

- **Google** makes extensive use of Python in its web search systems and employs Python’s creator.
- **YouTube** is largely written in Python.
- The popular **BitTorrent** peer-to-peer file sharing system is a Python program.
- Google’s popular **App Engine** web development framework uses Python as its application language.
- **EVE Online**, a Massively Multiplayer Online Game (MMOG), makes extensive use of Python.
- **Maya**, a powerful integrated 3D modeling and animation system, provides a Python scripting API.
- **Intel, Cisco, Hewlett-Packard, Seagate, Qualcomm, and IBM** use Python for hardware testing.
- **Industrial Light & Magic, Pixar,** and others use Python in the production of animated movies.
- **JPMorgan Chase, UBS, Getco, and Citadel** apply Python for financial market forecasting.
- **NASA, Los Alamos, Fermilab, JPL,** and others use Python for scientific programming tasks.
- **iRobot** uses Python to develop commercial robotic devices.
- **ESRI** uses Python as an end-user customization tool for its popular GIS mapping products.
- The **NSA** uses Python for cryptography and intelligence analysis.
- The **IronPort** email server product uses more than 1 million lines of Python code to do its job.
- The **One Laptop Per Child (OLPC)** project builds its user interface and activity model in Python.

## What Can I Do with Python?

Python is useful for accomplishing real-world tasks. It’s commonly used in a variety of domains, as a tool for scripting other components and implementing standalone programs. In fact, as a general-purpose language, Python’s roles are virtually unlimited: you can use it for everything from website development and gaming to robotics and spacecraft control. However, the most common Python roles currently seem to fall into a few broad categories. The next few sections describe some of Python’s most common applications today, as well as tools used in each domain. We will not be able to explore the tools mentioned here in any depth—if you are interested in any of these topics, see the [Python website](http://www.python.org) or other resources for more details.

### Systems Programming

Python’s built-in interfaces to operating-system services make it ideal for writing portable, maintainable system-administration tools and utilities (sometimes called shell tools). Python programs can search files and directory trees, launch other programs, do parallel processing with processes and threads, and so on. Python’s standard library comes with POSIX bindings and support for all the usual OS tools: environment variables, files, sockets, pipes, processes, multiple threads, regular expression pattern matching, command-line arguments, standard stream interfaces, shell-command launchers, filename expansion, and more. In addition, the bulk of Python’s system interfaces are designed to be portable; for example, a script that copies directory trees typically runs unchanged on all major Python platforms. The Stackless Python system, used by EVE Online, also offers advanced solutions to multiprocessing requirements.

### GUIs

Python’s simplicity and rapid turnaround also make it a good match for graphical user interface programming. Python comes with a standard object-oriented interface to the Tk GUI API called `tkinter` (Tkinter in 2.6) that allows Python programs to implement portable GUIs with a native look and feel. Python/tkinter GUIs run unchanged on Microsoft Windows, X Windows (on Unix and Linux), and the Mac OS (both Classic and OS X). A free extension package, PMW, adds advanced widgets to the tkinter toolkit. In addition, the `wxPython` GUI API, based on a C++ library, offers an alternative toolkit for constructing portable GUIs in Python. Higher-level toolkits such as PythonCard and Dabo are built on top of base APIs such as wxPython and tkinter. With the proper library, you can also use GUI support in other toolkits in Python, such as Qt with PyQt, GTK with PyGTK, MFC with PyWin32, .NET with IronPython, and Swing with Jython or JPype. For applications that run in web browsers or have simple interface requirements, both Jython and Python web frameworks and server-side CGI scripts provide additional user interface options.

### Internet Scripting

Python comes with standard Internet modules that allow Python programs to perform a wide variety of networking tasks, in client and server modes. Scripts can communicate over sockets; extract form information sent to server-side CGI scripts; transfer files by FTP; parse, generate, and analyze XML files; send, receive, compose, and parse email; fetch web pages by URLs; parse the HTML and XML of fetched web pages; and communicate over XML-RPC, SOAP, and Telnet; and more. Python’s libraries make these tasks remarkably simple. In addition, a large collection of third-party tools are available on the Web for doing Internet programming in Python. For instance, the HTMLGen system generates HTML files from Python class-based descriptions, the `mod_python` package runs Python efficiently within the Apache web server and supports server-side templating with its Python Server Pages, and the Jython system provides for seamless Python/Java integration and supports coding of server-side applets that run on clients. In addition, full-blown web development framework packages for Python, such as Django, TurboGears, web2py, Pylons, Zope, and WebWare, support quick construction of full-featured and production-quality websites with Python. Many of these include features such as object-relational mappers, a Model/View/Controller architecture, server-side scripting and templating, and AJAX support, to provide complete and enterprise-level web development solutions.

### Component Integration

We discussed the component integration role earlier when describing Python as a control language. Python’s ability to be extended by and embedded in C and C++ systems makes it useful as a flexible glue language for scripting the behavior of other systems and components. For instance, integrating a C library into Python enables Python to test and launch the library’s components, and embedding Python in a product enables onsite customizations to be coded without having to recompile the entire product (or ship its source code at all). Tools such as the SWIG and SIP code generators can automate much of the work needed to link compiled components into Python for use in scripts, and the Cython system allows coders to mix Python and C-like code. Larger frameworks, such as Python’s COM support on Windows, the Jython Java-based implementation, the IronPython .NET-based implementation, and various CORBA toolkits for Python, provide alternative ways to script components. On Windows, for example, Python scripts can use frameworks to script Word and Excel.

### Database Programming

For traditional database demands, there are Python interfaces to all commonly used relational database systems—Sybase, Oracle, Informix, ODBC, MySQL, PostgreSQL, SQLite, and more. The Python world has also defined a portable database API for accessing SQL database systems from Python scripts, which looks the same on a variety of underlying database systems. For instance, because the vendor interfaces implement the portable API, a script written to work with the free MySQL system will work largely unchanged on other systems (such as Oracle); all you have to do is replace the underlying vendor interface. Python’s standard `pickle` module provides a simple object persistence system—it allows programs to easily save and restore entire Python objects to files and file-like objects. On the Web, you’ll also find a third-party open source system named ZODB that provides a complete object-oriented database system for Python scripts, and others (such as SQLObject and SQLAlchemy) that map relational tables onto Python’s class model. Furthermore, as of Python 2.5, the in-process SQLite embedded SQL database engine is a standard part of Python itself.

### Rapid Prototyping

To Python programs, components written in Python and C look the same. Because of this, it’s possible to prototype systems in Python initially, and then move selected components to a compiled language such as C or C++ for delivery.

### Numeric and Scientific Programming

The NumPy numeric programming extension for Python mentioned earlier includes such advanced tools as an array object, interfaces to standard mathematical libraries, and much more. By integrating Python with numeric routines coded in a compiled language for speed, NumPy turns Python into a sophisticated yet easy-to-use numeric programming tool that can often replace existing code written in traditional compiled languages.

### Gaming, Images, Serial Ports, XML, Robots, and More

Python is commonly applied in more domains than can be mentioned here. For example, you can do:

- **Game programming and multimedia** with the pygame system.
- **Serial port communication** on Windows, Linux, and more with the PySerial Extension.
- **Image processing** with PIL, PyOpenGL, Blender, Maya, and others.
- **Robot control programming** with the PyRo toolkit.
- **XML parsing** with the xml library package, the xmlrpclib module, and third-party extensions.
- **Artificial intelligence programming** with neural network simulators and expert system shells.
- **Natural language analysis** with the NLTK package.

You can even play solitaire with the PySol program. You will find support for many such fields at the [PyPI website](https://pypi.org) and via web searches (search Google or [Python.org](http://www.python.org) for links).

Many of these specific domains are largely just instances of Python’s component integration role in action again.

## Chapter Summary

- **Introduction to Python:**  
  Python is introduced as a popular, open source programming language that is both powerful and easy to learn. It is designed to boost developer productivity and is suitable for both standalone programs and scripting applications.

- **Scripting and Programming:**  
  The chapter clarifies that while Python is a general-purpose language, it is often used in scripting roles. The terms “script” and “program” are used interchangeably, with “script” typically referring to simpler, single-file applications and “program” referring to larger, multifile projects.

- **User Base and Industry Adoption:**  
  With roughly 1 million users worldwide, Python’s user base includes individuals and major companies alike. It is employed by organizations such as Google, YouTube, NASA, and many others for diverse applications—from web development and scientific research to finance and multimedia production.

- **Wide Range of Applications:**  
  Python is versatile, supporting various domains including:
  - **Systems Programming:** Portable system-administration tools and utilities.
  - **Graphical User Interfaces (GUIs):** Using libraries like `tkinter` and `wxPython` for cross-platform applications.
  - **Internet Scripting:** Networking, web development frameworks, and server-side applications.
  - **Component Integration:** Acting as a glue language to integrate C/C++ libraries and other systems.
  - **Database Programming:** Interfaces for popular relational databases and object persistence.
  - **Rapid Prototyping and Scientific Computing:** Enabling quick development and numerical analysis with tools like NumPy.
  - **Additional Domains:** Gaming, image processing, robotics, and more.

- **Extensibility and Community Support:**  
  Python’s rich standard library, coupled with a vast ecosystem of third-party modules and frameworks, makes it a flexible tool for addressing a wide range of real-world problems. This extensibility is one of the key reasons for its widespread adoption across different industries.

