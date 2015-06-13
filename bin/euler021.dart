/*
	Amicable numbers
	https://projecteuler.net/problem=21

Let d(n) be defined as the sum of proper divisors of n
(numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a ≠ b, then a and b are an
amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110;
therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
*/

import 'dart:core';

const int maxAmicablesNumber = 10000;
const bool showDebug = true;

int sumOfDivisors(int num) {
  int sum = 0;
  for (int i = 1; i <= num ~/ 2; i++) if (num % i == 0) sum += i;
  return sum;
}

int solve(int maxAmicablesNumber) {
  int sum = 0;
  for (int i = 1; i < maxAmicablesNumber; i++) {
    int sumDiv = sumOfDivisors(i);
    if ((sumDiv != i) && (sumDiv < maxAmicablesNumber)) {
      if (sumOfDivisors(sumDiv) == i) {
        sum += i;
        if (showDebug) print("amicable number: $sumDiv");
      }
    }
  }
  return sum;
}

void main() {
  assert(sumOfDivisors(220) == 284);
  assert(sumOfDivisors(284) == 220);

  DateTime creationTime = new DateTime.now();
  int result = solve(maxAmicablesNumber);
  print('Sum of amicables < $maxAmicablesNumber: $result');
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
