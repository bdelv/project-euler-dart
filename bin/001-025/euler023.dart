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

const problemNumber = 23;
bool debugMode = false;

int sumOfProperDivisors(int num) {
  if (num == 1) return 1;
  int sum = 0;
  for (int i = 1; i <= num ~/ 2; i++) {
    if (num % i == 0) sum += i;
  }
  return sum;
}

int solve(int maxNumber) {
  if (debugMode) {
    print(
        "Sum of all the positive integers (<=$maxNumber) which cannot be written as the sum of two abundant numbers:");
  }
  List<int> abundantList = [];
  List<bool> sumAbundants =
      List<bool>.filled(maxNumber + 1, false, growable: false);
  sumAbundants.fillRange(0, maxNumber + 1, false);

  // List of Abundant numbers
  for (int i = 1; i <= maxNumber; i++) {
    int sumDivisors = sumOfProperDivisors(i);
    if (sumDivisors > i) abundantList.add(i);
  }
  // Calculates the sums of abundant numbers and cache it
  for (int i = 0; i < abundantList.length; i++) {
    for (int j = 0; j < abundantList.length; j++) {
      int sum = abundantList[i] + abundantList[j];
      if (sum <= maxNumber) sumAbundants[sum] = true;
    }
  }
  if (debugMode) print("abundant numbers: $abundantList");
  // Calculate the sum of the numbers that cannot be written by the sum of 2 abundant numbers
  int total = 0;
  for (int i = 1; i <= maxNumber; i++) {
    if (!sumAbundants[i]) total += i;
  }
  return total;
}

void main() {
  assert(debugMode = true);
  assert(sumOfProperDivisors(28) == 28);

  DateTime startTime = DateTime.now();
  print(
      "Problem ${problemNumber.toString().padLeft(3, '0')}: Solution=${solve(28123)} (in ${DateTime.now().difference(startTime).inMilliseconds}ms)");
}
