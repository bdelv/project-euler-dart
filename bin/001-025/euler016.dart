/*
Power digit sum
https://projecteuler.net/problem=16

2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?
*/

import 'dart:core';

const int powerOf2 = 1000;
const bool showDebug = true;

int solve(int powerOf2) {
  String str = BigInt.from(2).pow(powerOf2).toString();
  int sum = 0;
  for (int i = 0; i < str.length; i++) {
    sum += int.parse(str[i]);
  }
  if (showDebug) print("2^$powerOf2 = $str");
  return sum;
}

void main() {
  assert(solve(15) == 26);

  DateTime creationTime = DateTime.now();
  int result = solve(powerOf2);
  print('Sum of digits of 2^$powerOf2 = $result');
  DateTime finishTime = DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
