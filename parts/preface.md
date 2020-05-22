#Preface
##Copyright
**Develop Android Applications using Python, Qt and PyQt5**  
by Olaf Art Ananda  
(C) Copyright 2020 Olaf Art Ananda. All rights reserved.
##Motivation

After coding for over 30 years now, I came from C, Assembler, Clipper, Powerbuilder, Java, C#, Objetive-C, C++ to Python. And guess what...   
**I love Python**   
It would be easy for me to develop native apps using Java, C++ or Objective-C and I am also able to learn Kotlin, Dart or Swift, but things are much easier when you just use Python. 
I have done a Django tutorial which is a web framework and the ease they have build a model class to be stored in an SQL server has stunned me. I just had to write a model class with a few line of code, then I had to run a scaffolding job which creates corresponding tables on the SQL server and after that I could run the Python interpreter, import my model class, write some properties and save the instance. 
No SQL coding at all. I have been hooked :-) 
Then I learned about generators, comprehension and meta programming and Python got me. 

Btw...to be able to write this book I wrote an application called EbookCreator. This app is also using PyQt5, QtWigets and I am using QML to serialize book projects, it is open source and you may have a look at the source code for inspiration. You are able to find the <a href="https://github.com/Artanidos/EbookCreator/">sources</a> on github.

When I wrote my first book about Python, I have seen a video with "Uncle" Bob Martin about programming in the future. He says that every 5 years the count of software developers on this planet double. That means that there are at least 50% of all developers that are inexperienced. 
He also said that we as a mature developer are responsible when for example a self driving car is killing other people because of software errors. That heard today I started to teach other developers and I am starting with this book.

##Who This Book Is For
If you are able to write basic Python code and you are interested in developing apps with user interfaces for Android in Python this book is right for you. 
This book does not assume that you are familiar with Qt. 
If you want, try out all of the examples in this book it would be a great benefit if you are also working on a Linux machine like me, but MacOS and Windows should also be ok if your are able to search for help in the internet for OS specific differences. 

##Who This Book Is Not For
If you are new to Python and programming you should consider reading beginner books for Python and watch tutorials on Youtube before continuing to read this book. 
I am not going into Python specific details in this book.  
This is a NO-BUDGET project and I am not a native english speaker.  
So if you like to complain about type errors or grammar you will like my book.  
```
// irony off
```

##How This Book Is Organized
Here are the main topics in each part of the book. 
First in ***Part I*** you are going to install all necessary software to be able to build applications with PyQt5 and Python.
In ***Part II*** you will learn about two different approaches to build apps. 
In ***Part III*** you will learn to code apps using QML and Python.   
In ***Part IV*** you will learn to to create an APK which you can deploy to an Android device.

##Conventions Used In This Book
The following typographical conventions are used in this book. 

*Italic*
<blockquote>
<p>Used for filenames and paths</p>  
</blockquote>

```
Constant width
```

<blockquote>
<p>Used for code samples</p>  
</blockquote>

Also I am using the Pascal convention to put brackets so that the code is more readable. This is a habit from my C/C++ and C# programming experience.    
```qml
Item
{
    SubItem
    {

    }
}
```
##Using Code Examples
All [code examples](https://github.com/Artanidos/PythonAndroidBook/) are available on github .

##How To Contact Me
If you have any questions or comments don't hesitate to send me an email with your questions or comments to the following address: artanidos@gmail.com

##Acknowledgements
First of all I am very thankful to my body which points me to the right ways in life. I know this sounds a bit weird but after learning to be a mechanic many years ago my back hurts after I have worked way too hard and after a half year being ill I decided to study to build machines and then I have learned to do programming just to solve a mathematical problem. Since that time I decided to be a software developer.
Then 5 years ago my body told me to stop working for profit after I had my second burnout. Now I have got much time to develop open source software, try out new stuff and write books like this. 

I am very thankful to Guido van Rossum for inventing Python in 1991.

I am also very thankful to all Pythonistas out there who are creating tutorials and videos on YouTube where one is able to learn Python for free.