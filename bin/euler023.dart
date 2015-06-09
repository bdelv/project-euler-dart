/*
Non-abundant sums
https://projecteuler.net/problem=23

A perfect number is a number for which the sum of its proper divisors is exactly equal 
to the number. 
For example, the sum of the proper divisors of 28 would be 1 + 2 + 4 + 7 + 14 = 28,
which means that 28 is a perfect number.

A number n is called deficient if the sum of its proper divisors is less than n and 
it is called abundant if this sum exceeds n.

As 12 is the smallest abundant number, 1 + 2 + 3 + 4 + 6 = 16, 
the smallest number that can be written as the sum of two abundant numbers is 24. 
By mathematical analysis, it can be shown that all integers greater than 28123 
can be written as the sum of two abundant numbers. However, this upper limit cannot 
be reduced any further by analysis even though it is known that the greatest number that 
cannot be expressed as the sum of two abundant numbers is less than this limit.

Find the sum of all the positive integers which cannot be written as the sum of two abundant numbers.
*/

import 'dart:core';

const MAX_NUMBER = 28123;
const bool DEBUG_MODE = true;

int SumOfProperDivisors(int num) {
  if (num == 1) return 1;
  int sum = 0;
  for (int i = 1; i <= num ~/ 2; i++) if (num % i == 0) sum += i;
  return sum;
}

int Solve(int MaxNumber) {
  List<int> Abundant = new List<int>();
  List<bool> SumAb = new List<bool>(MaxNumber + 1);
  SumAb.fillRange(0, MaxNumber + 1, false);

  // List of Abundant numbers
  for (int i = 1; i <= MaxNumber; i++) {
    int SumDiv = SumOfProperDivisors(i);
    if (SumDiv > i) Abundant.add(i);
  }
  // Calculates the sums of abundant numbers and cache it
  for (int i = 0; i < Abundant.length; i++)
    for (int j = 0; j < Abundant.length; j++) {
      int sum = Abundant[i] + Abundant[j];
      if (sum <= MaxNumber) SumAb[sum] = true;
  }
  if (DEBUG_MODE) print("abundant numbers: $Abundant");
  // Calculate the sum of the numbers that cannot be written by the sum of 2 abundant numbers
  int total = 0;
  for (int i = 1; i <= MaxNumber; i++) if (!SumAb[i]) total += i;
  return total;
}

void main() {
  assert(SumOfProperDivisors(28) == 28);

  DateTime creationTime = new DateTime.now();
  int res = Solve(MAX_NUMBER);
  print("Sum of all the positive integers (<=$MAX_NUMBER) which cannot be written as the sum of two abundant numbers: $res");
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
