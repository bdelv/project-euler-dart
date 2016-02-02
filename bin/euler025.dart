/*
	1000-digit Fibonacci number
	https://projecteuler.net/problem=25

The Fibonacci sequence is defined by the recurrence relation:

Fn = Fn−1 + Fn−2, where F1 = 1 and F2 = 1.
Hence the first 12 terms will be:

F1 = 1
F2 = 1
F3 = 2
F4 = 3
F5 = 5
F6 = 8
F7 = 13
F8 = 21
F9 = 34
F10 = 55
F11 = 89
F12 = 144
The 12th term, F12, is the first term to contain three digits.

What is the first term in the Fibonacci sequence to contain 1000 digits?
*/

// solveInt() Works in VM but not after dart2js
// solve() works in both

import 'dart:core';
import 'dart:math' as math;

const int digitsCount = 1000;
const bool showDebug = true;
// true = uses Dart internal BigInt (not compatible with dart2js)
const bool useInternalBigInteger = false;

/* very basic BigInt class
* Supports only the +operator for the need of this problem */
class BigInt {
  List<int> digitsList;
  int get length => _getlength();
  // Returns the object at the given [index] in the list
  int operator [](int index) {
    if (index < 0)
      throw new RangeError(
          "get[]: index $index out of range [0...${this.length}]");
    if (index >= length) return 0;
    return digitsList[index];
  }

  // Setter [] on the digits
  void operator []=(int index, int value) {
    if (index < 0)
      throw new RangeError("set[]: index $index out of range (<0)");
    for (int i = digitsList.length; i <= index; i++) this.addDigit(0);
    digitsList[index] = value;
  }

  // constructor
  BigInt([int a]) {
    digitsList = new List<int>();
    if (a != null) this.fromInt(a);
  }
  // new bigint initialized to nothing
  static BigInt nbi() {
    return new BigInt(null);
  }

  // new bigint initialized to i
  static BigInt nbv(int i) {
    var r = nbi();
    r.fromInt(i);
    return r;
  }

  // Add a digit on the left side of the number
  void addDigit(int d) {
    digitsList.add(d);
  }

  // removes excessive 0s
  void clamp() {
    if (digitsList == null) return;
    if (digitsList.length == 0) return;
    for (int i = digitsList.length - 1; i >= 0; i--)
      if (digitsList[i] == 0)
        digitsList.removeAt(i);
    else
      break;
  }

  // returns the length of the big number
  int _getlength() {
    if (digitsList == null) return 0;
    this.clamp();
    return digitsList.length;
  }

  // Imports the value of the big number from a regular Integer
  void fromInt(int a) {
    digitsList.clear();
    while (a > 0) {
      digitsList.add(a % 10);
      a ~/= 10;
    }
  }

  // Adds a big number and stores the result in r
  void addTo(BigInt a, BigInt r) {
    int _remain = 0;
    int _idx = 0;
    int _sum;
    while (_idx < a.length || _idx < this.length || _remain > 0) {
      _sum = this[_idx] + a[_idx] + _remain;
      r[_idx] = _sum % 10;
      _remain = _sum ~/ 10;
      _idx++;
    }
  }

  // adds a big number to this and retrns the result
  BigInt add(BigInt a) {
    BigInt r = nbi();
    this.addTo(a, r);
    return r;
  }

  // converts the big number to a string
  String toString() {
    String _res = "";
    int _len = digitsList.length;
    for (int _idx = 0; _idx < _len; _idx++)
      _res = digitsList[_idx].toString() + _res;
    return _res;
  }

  BigInt operator +(BigInt other) => add(other);
}

// ------------- Method 2: Using a simplified BigInt class ------------
int solveWithoutBigInt(int digitsCount) {
  BigInt fibonacci = new BigInt(1);
  BigInt prev1 = new BigInt(1);
  BigInt prev2 = new BigInt(0);

  int i = 2;
  while (true) {
    i++;
    prev2 = prev1;
    prev1 = fibonacci;
    fibonacci = prev1 + prev2;
    if (fibonacci.length >= digitsCount) break;
  }
  if (showDebug)
    print('First Fibo number with $digitsCount digits: $fibonacci');
  return i;
}

// --------------- Method 1: Using Dart internal BigInt (doesn't work in Javascript) ----------
int solveBigInt(int digitsCount) {
  int fibonacci = 1;
  int Prev1 = 1;
  int Prev2 = 0;

  int maxNumber = math.pow(10, digitsCount - 1);
  int countFibo = 2;
  while (fibonacci < maxNumber) {
    countFibo++;
    Prev2 = Prev1;
    Prev1 = fibonacci;
    fibonacci = Prev1 + Prev2;
  }
  if (showDebug)
    print('First Fibonacci number with $digitsCount digits: $fibonacci');
  return countFibo;
}

int solve(int digitsCount) {
  if (useInternalBigInteger) {
    if (showDebug) print("Using Internal BigInt (not compatible with dart2js)");
    return solveBigInt(digitsCount);
  } else {
    if (showDebug) print("Not using Internal BigInt (compatible with dart2js)");
    return solveWithoutBigInt(digitsCount);
  }
}

void main() {
  assert(solve(3) == 12);
  assert(solve(4) == 17);
  assert(solve(5) == 21);

  DateTime creationTime = new DateTime.now();
  int result = solve(digitsCount);
  print(
      'First term in the Fibonacci sequence to contain $digitsCount digits: $result');
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
