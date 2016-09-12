/*
	Factorial digit sum
	https://projecteuler.net/problem=20

n! means n × (n − 1) × ... × 3 × 2 × 1
For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
Find the sum of the digits in the number 100!

Note:
- solveInt(): uses Dart internal BigInt (doesn't work with dart2js)
- solve(): uses a simplified BigInt class (works in the VM and in Javascript)
*/

import 'dart:core';

const int N = 100;
const showDebug = true;
// true = uses Dart internal BigInt (Doesn't work with dart2js)
const useInternalBigInteger = false;

/* very basic BigInt class */
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

  // adds a big number to this and returns the result
  BigInt add(BigInt a) {
    BigInt r = nbi();
    this.addTo(a, r);
    return r;
  }

  // Multiplies the current value by a big number and stores the result in r
  void multiplyTo(BigInt a, BigInt r) {
    r.fromInt(0);
    int _nbA = a.length;
    int _nbThis = this.length;
    for (int _idxa = 0; _idxa < _nbA; _idxa++) {
      int _remain = 0;
      int _idxThis = 0;
      while (_idxThis < _nbThis || _remain > 0) {
        int _product = a[_idxa] * this[_idxThis] + _remain;
        r[_idxThis + _idxa] = r[_idxThis + _idxa] + (_product % 10);
        _remain = _product ~/ 10;
        _idxThis++;
      }
    }
  }

  // Multiplies a big number to this and returns the result
  BigInt multiply(a) {
    var r = nbi();
    if (a is num)
      this.multiplyTo(nbv(a), r);
    else
      this.multiplyTo(a, r);
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
  BigInt operator *(other) => multiply(other);
}

// ------------ Method 1: Uses dart internal BigInt (Doesn't work in Javascript) -----------
int solve(int N) {
  if (useInternalBigInteger) {
    // ------------ Method 1: Uses dart internal BigInt (Doesn't work in Javascript) -----------
    if (showDebug) print("Using internal BigInt (not dart2js compatible)");
    // Factorial
    int result = 1;
    for (int i = 2; i <= N; i++) result *= i;
    String resStr = result.toString();
    // Sum of the digits of the factorial
    int sum = 0;
    for (int i = 0; i < resStr.length; i++) sum += int.parse(resStr[i]);
    if (showDebug) print('${N}!: $result');
    return sum;
  } else {
    // ------------ Method 2: Uses simplified BigInt (works in VM and in Javascript) -----------
    if (showDebug) print("Not using internal BigInt (dart2js compatible)");
    // Factorial
    BigInt result = new BigInt(1);
    for (int i = 2; i <= N; i++) result *= i;
    String resultStr = result.toString();
    // Sum of the digits of the factorial
    int sum = 0;
    for (int i = 0; i < resultStr.length; i++) sum += int.parse(resultStr[i]);
    if (showDebug) print('${N}!: $result');
    return sum;
  }
}

void main() {
  assert(solve(10) == 27);

  DateTime creationTime = new DateTime.now();
  int result = solve(N);
  print('sum of the digits in the number $N!: $result');
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
