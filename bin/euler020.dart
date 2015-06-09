/*
	Factorial digit sum
	https://projecteuler.net/problem=20

n! means n × (n − 1) × ... × 3 × 2 × 1
For example, 10! = 10 × 9 × ... × 3 × 2 × 1 = 3628800,
and the sum of the digits in the number 10! is 3 + 6 + 2 + 8 + 8 + 0 + 0 = 27.
Find the sum of the digits in the number 100!

Note:
- SolveInt(): uses Dart internal BigInt (doesn't work with dart2js)
- Solve(): uses a simplified BigInt class (works in the VM and in Javascript)
*/

import 'dart:core';

const int N=100;
const DEBUG_MODE = true;
// true = uses Dart internal BigInt (Doesn't work with dart2js)
const INTERNAL_BIGINT = false;

/* very basic BigInt class */
class BigInt {
  List<int> Digits;
  int get length => _getlength();
  // Returns the object at the given [index] in the list
  int operator [](int index) {
    if (index < 0)
      throw new RangeError("get[]: index $index out of range [0...${this.length}]");
    if (index >= length) return 0;
    return Digits[index];
  }
  // Setter [] on the digits
  void operator []=(int index, int value) {
    if (index<0)
      throw new RangeError("set[]: index $index out of range (<0)");
    for (int i = Digits.length; i <= index; i++) this.addDigit(0);
    Digits[index] = value;
  }
  // constructor
  BigInt([int a]) {
    Digits = new List<int>();
    if (a!=null) this.fromInt(a);
  }
  static BigInt nbi() { return new BigInt(null); }
  // new bigint initialized to i
  static BigInt nbv(int i) {
    var r = nbi();
    r.fromInt(i);
    return r;
  }
  // Add a digit on the left side of the number
  void addDigit(int d) {
    Digits.add(d);
  }
  // removes excessive 0s
  void clamp() {
    if (Digits == null) return;
    if (Digits.length == 0) return;
    for (int i = Digits.length - 1; i>=0; i--)
      if (Digits[i] == 0) Digits.removeAt(i);
      else break;
  }
  // returns the length of the big number
  int _getlength() {
    if (Digits == null) return 0;
    this.clamp();
    return Digits.length;
  }
  // Imports the value of the big number from a regular Integer
  void fromInt(int a) {
    Digits.clear();
    while(a>0) {
      Digits.add(a % 10);
      a ~/=10;
    }
  }
  // Adds a big number and stores the result in r
  void addTo(BigInt a, BigInt r) {
    int _remain = 0;
    int _idx=0;
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
    this.addTo(a,r);
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
      this.multiplyTo(nbv(a),r);
    else
      this.multiplyTo(a,r);
    return r;
  }
  // converts the big number to a string
  String toString() {
    String _res = "";
    int _len = Digits.length;
    for (int _idx = 0; _idx < _len; _idx++) _res = Digits[_idx].toString() + _res;
    return _res;
  }
  BigInt operator +(BigInt other) => add(other);
  BigInt operator *(other) => multiply(other);
}

// ------------ Method 2: Uses simplified BigInt (works in VM and in Javascript) -----------
int Solve(int n) {
  // Factorial
  BigInt res = new BigInt(1);
  for (int i=2;i<=n;i++) res *= i;
  String resStr = res.toString();
  // Sum of the digits of the factorial
  int sum=0;
  for (int i=0;i<resStr.length;i++) sum+=int.parse(resStr[i]);
  if (DEBUG_MODE) print('${N}!: $res');
  return sum;
}

// ------------ Method 1: Uses dart internal BigInt (Doesn't work in Javascript) -----------
int SolveBigInt(int n) {
  // Factorial
  int res=1;
  for (int i=2;i<=n;i++) res*=i;
  String resStr=res.toString();
  // Sum of the digits of the factorial
  int sum=0;
  for (int i=0;i<resStr.length;i++) sum+=int.parse(resStr[i]);
  if (DEBUG_MODE) print('${N}!: $res');
  return sum;
}

void main() {
  if (INTERNAL_BIGINT) {
    print("Using internal BigInt (not dart2js compatible)");
    assert(SolveBigInt(10) == 27);
  }
  else {
    print("Not using internal BigInt (dart2js compatible)");
    assert(Solve(10) == 27);
  }
  DateTime creationTime = new DateTime.now();
  int res;
  if (INTERNAL_BIGINT)
    res = SolveBigInt(N);
  else
    res = Solve(N);
  print('sum of the digits in the number $N!: $res');
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}