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

const int MAX_NB = 10000;
const bool DEBUG_MODE = true;

int SumOfDivisors(int num) {
  int sum = 0;
  for (int i = 1; i <= num ~/ 2; i++) if (num % i == 0) sum += i;
  return sum;
}

int Solve(int MaxNb) {
  int Sum = 0;
  for (int i = 1; i < MaxNb; i++) {
    int SumDiv = SumOfDivisors(i);
    if ((SumDiv != i) && (SumDiv < MaxNb)) {
      if (SumOfDivisors(SumDiv) == i) {
        Sum += i;
        if (DEBUG_MODE) print("amicable number: $SumDiv");
      }
    }
  }
  return Sum;
}

void main() {
  assert(SumOfDivisors(220) == 284);
  assert(SumOfDivisors(284) == 220);

  DateTime creationTime = new DateTime.now();
  int res = Solve(MAX_NB);
  print('Sum of amicables < $MAX_NB: $res');
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
