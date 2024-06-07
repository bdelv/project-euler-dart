/*
 * 	Multiples of 3 and 5
 * 	https://projecteuler.net/problem=1
 *
 * If we list all the natural numbers below 10 that are multiples of 3 or 5,
 *  we get 3, 5, 6 and 9. The sum of these multiples is 23.
 * Find the sum of all the multiples of 3 or 5 below 1000.
*/

import 'dart:core';

const int maxNumber = 1000;

int solve(int maxNumber) {
  int sum = 0;
  for (int i = 1; i < maxNumber; i++) {
    if ((i % 3 == 0) || (i % 5 == 0)) sum += i;
  }
  return sum;
}

void main() {
  assert(solve(10) == 23);

  DateTime creationTime = DateTime.now();
  int result = solve(maxNumber);
  print('Sum of multiples of 3 or 5 below $maxNumber = $result');
  DateTime finishTime = DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
