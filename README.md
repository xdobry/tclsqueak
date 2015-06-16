#TclSqueak
Is graphical objectoriented programming environment for [Tcl](http://tcl.tk) programming language inspired by famous [Squeak](http://www.squeak.org).

It is fun and experimental project . 

##Homepage

http://www.xdobry.de/tclsqueak

TclSquak was programmed by Artur Trzewik (mail@xdobry.de)

##History

TclSqueak is former redesigned and relaunched *XOTclIDE* project. The renaming was needed because the IDE is not limited to XOTcl
but supports also the new object oriented extension TclOO introduced Tcl 8.6 as core.
The new name also point more to origin of project and the main idea for it.

*Program Smalltalk way in Tcl.*

I have started XOTclIDE 2001 and uses it for many years also to implement my another software. I was quite impressed
by Tcl8.6 release, which finally includes good object oriented extension and also sqlite and data base bindings.
So It was enough for me to refresh the project and add support for TclOO.
I also wanted to make the project easier to install and begin with coding.

##How to start

The easiest way is to get binary distribution from release page
https://github.com/xdobry/tclsqueak/releases
use tclsqueak-portable-winlinux.zip file
It contains Tcl interpreter for windows and linux (based on tclkit)
and all needed libraries (XOTcl).
After unzipping start by using start.bat or start.sh

But you may also check out the sources and lunch the start.tcl
The prerequist are Tcl interpreter (Version 8.6) http://tcl.tk and installed XOTcl extension http://www.xotcl.org (or http://www.next-scripting.org)
The binary XOTcl extension for windows can be taken from release zip.

##Documentation

There is old XOTclIDE Documentation http://www.xdobry.de/xotclIDE/docs/index.html

There are also screen casts tutorials on youtube
* part 1 - http://youtu.be/6g7XcKqgObM - basics create code, evaluating tcl scripts in transcript window
* part 2 - https://youtu.be/zmi6rt4K2sI - object inspector and debugger
* part 3 - https://youtu.be/_XohZFiJ3sk - version control
* part 4 - https://youtu.be/C8_3QhBV9Hk - searching and navigating in code, code completion 
* part 5 - http://youtu.be/VGE9pmso7Us - syntax checker

##What makes TclSquaek different?

* Interactive smalltalk way of programming
* code repository (every code change is persistent)
* advanced static code analyze and edit support

###Smalltalk way

TclSqueak is not just IDE in the meaning just another implementation of Visual Studio or Eclispe.
It is not extended file editor which can lunch compiler, debugger or version control.
It is to program in Smalltalk way by just adding functionality to running system.
There are no edit/compile/run cycles. You program running system. The programmed code runs in same
Tcl interpreter as the TclSqueak.

Image you have tcl console with not just text entry but with several special tools, for inspecting and changing
the system.

For TclSquaek Tcl is not just script language but full-fledged programming language for applications.

###Code repository

TclSquaek saves all your code immediately in code repository (per default sqlite data base). You will not lose
any code (You should not). You can see every change you made and can revert it.

This repository does not version files but small tcl code parts as methods and procedures.
This version control follows the structure of code.

This way to program makes it ideal for play with programming, to extend program step by step.

###Static code analyze

TclSqueak includes advanced typed syntax checker that is used to check and syntax highlighting.
The syntax checker can be used also as separate project http://www.xdobry.de/ttclcheck

This syntax check allows to have the comfortable edit support of typed language also in dynamic language.
Ttclcheck is probably the first tcl checker that can derive and check types by using type inference.
It is probably the most unique characteristic of this IDE for dynamic scripting language.
 
