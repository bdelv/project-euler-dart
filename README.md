# dart-euler

Some "Project Euler" problems

[Project Euler](https://projecteuler.net/)

[Dart](https://www.dartlang.org/)

## To test in Dartpad

Copy the content of a Dart file (from the **bin** folder) into [dartpad](https://dartpad.dartlang.org/) and run.

Note: In some cases (problems 16, 20, 25), make sure that the use of internal big integer is disabled so to work in Dartpad.

```
const bool useInternalBigInteger = false;
```
## To test in the Dart VM

Install the [Dart SDK](https://www.dartlang.org/downloads/)

### from an editor

Use one of the following:
* [Webstorm](http://www.jetbrains.com/webstorm/) (recommended editor. Great support for Dart).
* [Atom](https://atom.io/) (Great free editor with a Dart plugin)

Just **run** any eulerxxx.dart file from the **bin** folder.

### from the command line

* Make sure **pub** is accessible from the command line. If not, add the PATH in **~/.profile** (Linux) or your environment variables (Windows)
* Go in the **dart-euler** folder
* run a problem by typing something like:
```
pub run euler012.dart
```
or
```
pub run bin/euler25
```
