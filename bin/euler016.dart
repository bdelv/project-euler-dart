/*
Power digit sum
https://projecteuler.net/problem=16

2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?
*/

import 'dart:core';
import 'dart:math';

const int POWER = 1000;
const bool DEBUG_MODE = true;
// true uses Dart internal BigInt. Doesn't work through dart2js
const bool INTERNAL_BIGINT = false;

// ------------- Method 1: works on VM but not on JS (BigInt) --------
int SolveBigInt(int Power) {
  int res = pow(2, Power);
  String str = res.toString();
  int sum = 0;
  for (int i = 0; i < str.length; i++) sum += int.parse(str[i]);
  if (DEBUG_MODE) print("2^$Power = $str");
  return sum;
}

// ------------- Method 2: works on VM and JS --------
int Solve(int Power) {
  List<int> res = new List<int>();
  res.add(1);
  int remain = 0;
  for (int ipow = 1; ipow <= Power; ipow++) {
    for (int icar = 0; icar < res.length; icar++) {
      int subsum = remain + (res[icar] * 2);
      res[icar] = subsum % 10;
      remain = subsum ~/ 10;
    }
    if (remain > 0) {
      res.add(remain);
      remain = 0;
    }
  }
  if (DEBUG_MODE) print("2^$Power = $res");
  // calculate the sum of the digits
  int sum = 0;
  for (int i = 0; i < res.length; i++) sum += res[i];
  return sum;
}

void main() {
  if (INTERNAL_BIGINT)
    assert(SolveBigInt(15) == 26);
  else
    assert(Solve(15) == 26);
  //assert(Solve(1000) == 1366);

  DateTime creationTime = new DateTime.now();
  int res;
  if (INTERNAL_BIGINT) res=SolveBigInt(POWER);
  else res=Solve(POWER);
  print('Sum of digits of 2^$POWER = $res');
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
