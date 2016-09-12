/*
Power digit sum
https://projecteuler.net/problem=16

2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?
*/

import 'dart:core';
import 'dart:math';

const int powerOf2 = 1000;
const bool showDebug = true;
// true uses Dart internal BigInt. Doesn't work through dart2js
const bool useInternalBigInteger = false;

int solve(int powerOf2) {
  // ------------- Method 1: works on VM but not on JS (BigInt) --------
  if (useInternalBigInteger) {
    String str = pow(2, powerOf2).toString();
    int sum = 0;
    for (int i = 0; i < str.length; i++) sum += int.parse(str[i]);
    if (showDebug) print("2^$powerOf2 = $str");
    return sum;
  } else {
    // ------------- Method 2: works on VM and JS --------
    List<int> result = new List<int>();
    result.add(1);
    int remain = 0;
    for (int ipow = 1; ipow <= powerOf2; ipow++) {
      for (int icar = 0; icar < result.length; icar++) {
        int subsum = remain + (result[icar] * 2);
        result[icar] = subsum % 10;
        remain = subsum ~/ 10;
      }
      if (remain > 0) {
        result.add(remain);
        remain = 0;
      }
    }
    if (showDebug) print("2^$powerOf2 = $result");
    // calculate the sum of the digits
    int sum = 0;
    for (int i = 0; i < result.length; i++) sum += result[i];
    return sum;
  }
}

void main() {
  assert(solve(15) == 26);

  DateTime creationTime = new DateTime.now();
  int result = solve(powerOf2);
  print('Sum of digits of 2^$powerOf2 = $result');
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
