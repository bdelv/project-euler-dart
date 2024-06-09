/*
Power digit sum
https://projecteuler.net/problem=16

2^15 = 32768 and the sum of its digits is 3 + 2 + 7 + 6 + 8 = 26.

What is the sum of the digits of the number 2^1000?
*/
import 'dart:core';

const problemNumber = 16;
bool debugMode = false;

int solve(int powerOf2) {
  String str = BigInt.from(2).pow(powerOf2).toString();
  int sum = 0;
  for (int i = 0; i < str.length; i++) {
    sum += int.parse(str[i]);
  }
  if (debugMode) print("2^$powerOf2 = $str");
  return sum;
}

void main() {
  assert(debugMode = true);
  assert(solve(15) == 26);

  DateTime startTime = DateTime.now();
  print(
      "Problem ${problemNumber.toString().padLeft(3, '0')}: Solution=${solve(1000)} (in ${DateTime.now().difference(startTime).inMilliseconds}ms)");
}
