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

const problemNumber = 25;
bool debugMode = false;

int solve(int digitsCount) {
  BigInt fibonacci = BigInt.one;
  BigInt prev1 = BigInt.one;
  BigInt prev2 = BigInt.zero;

  BigInt maxNumber = BigInt.from(10).pow(digitsCount - 1);
  int countFibo = 2;
  while (fibonacci < maxNumber) {
    countFibo++;
    prev2 = prev1;
    prev1 = fibonacci;
    fibonacci = prev1 + prev2;
  }
  if (debugMode) {
    print('First Fibonacci number with $digitsCount digits: $fibonacci');
  }
  return countFibo;
}

void main() {
  assert(debugMode = true);
  assert(solve(3) == 12);
  assert(solve(4) == 17);
  assert(solve(5) == 21);

  DateTime startTime = DateTime.now();
  print(
      "Problem ${problemNumber.toString().padLeft(3, '0')}: Solution=${solve(1000)} (in ${DateTime.now().difference(startTime).inMilliseconds}ms)");
}
