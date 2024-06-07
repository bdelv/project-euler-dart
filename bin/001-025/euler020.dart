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

// ------------ Method 1: Uses dart internal BigInt (Doesn't work in Javascript) -----------
int solve(int N) {
  // Factorial
  BigInt result = BigInt.one;
  for (int i = 2; i <= N; i++) {
    result *= BigInt.from(i);
  }
  String resStr = result.toString();
  // Sum of the digits of the factorial
  int sum = 0;
  for (int i = 0; i < resStr.length; i++) {
    sum += int.parse(resStr[i]);
  }
  if (showDebug) print('$N!: $result');
  return sum;
}

void main() {
  assert(solve(10) == 27);

  DateTime creationTime = DateTime.now();
  int result = solve(N);
  print('sum of the digits in the number $N!: $result');
  DateTime finishTime = DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
