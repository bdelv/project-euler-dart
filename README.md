# dartpad-euler

Some Project Euler problems Dartpad-ified (1 file / 1 problem solved / no funky libraries)

Just a few different personnal tests that bumped together.

[Project Euler](https://projecteuler.net/) is a series of mathematical/computer programming problems that are fun to solve.

[Dart](https://www.dartlang.org/) is a programming language that is very fun to play with.

[Dartpad](https://dartpad.dartlang.org/) The UI client for a web based interactive Dart service.

**Dartpad** fits very well with **Project Euler** type of sites (like [Codingame](https://www.codingame.com/) for example)

## To test in Dartpad

Copy the content of a Dart file (from the **bin** folder) into [dartpad](https://dartpad.dartlang.org/) and run.

Note: In some cases (problems 16, 20, 25), make sure that the use of internal big integer is disabled so to work in Dartpad.

```
const bool INTERNAL_BIGINT = false;
```
## To test in the Dart VM

Install the [Dart SDK](https://www.dartlang.org/downloads/)

### from an editor

Use one of the following:
* [Webstorm](http://www.jetbrains.com/webstorm/) (recommended editor. Great support for Dart).
* [Sublime Text](http://www.sublimetext.com/) and the [Dart plugin](https://github.com/guillermooo/dart-sublime-bundle)
* [Eclipse](http://www.eclipse.org/) and the [Dart plugin](https://www.dartlang.org/tools/eclipse-plugin/)

Just **run in Dartium** any eulerxxx.dart file from the **bin** folder.

### from the command line

* Make sure **pub** is accessible from the command line. If not, add the PATH in **.profile** (Linux) or your environment variables (Windows)
* Go in the **dartpad-euler** folder
* run a file by typing something like: 
```
pub run euler012.dart
```
or
```
pub run bin/euler25
```
Disclaimer: Not claiming it is always beautiful Dart code ... blabla ... lawyer terms ... blabla ... not even claiming it is interesting ... blabla ... running the code will display a number ... youhou ... only educative purpose ... hum ... self-educative purpose. 

It's free to use; if you find any use for it.