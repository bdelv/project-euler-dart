/*
 * 	Multiples of 3 and 5
 * 	https://projecteuler.net/problem=1
 *
 * If we list all the natural numbers below 10 that are multiples of 3 or 5,
 *  we get 3, 5, 6 and 9. The sum of these multiples is 23.
 * Find the sum of all the multiples of 3 or 5 below 1000.
*/

import 'dart:core';

const int MAX_COUNT = 1000;

int Solve(int MaxCount) {
  int Sum = 0;
  for (int i = 1;
      i < MaxCount;
      i++) if ((i % 3 == 0) || (i % 5 == 0)) Sum += i;
  return Sum;
}

void main() {
  assert(Solve(10) == 23);

  DateTime creationTime = new DateTime.now();
  int res = Solve(1000);
  print('Sum of multiples of 3 or 5 below $MAX_COUNT = $res');
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
