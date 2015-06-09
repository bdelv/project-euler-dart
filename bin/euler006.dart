/*
	Sum square difference
https://projecteuler.net/problem=6

The sum of the squares of the first ten natural numbers is,
1^2 + 2^2 + ... + 10^2 = 385

The square of the sum of the first ten natural numbers is,
(1 + 2 + ... + 10)^2 = 55^2 = 3025

Hence the difference between the sum of the squares of the first ten natural numbers
and the square of the sum is 3025 − 385 = 2640.

Find the difference between the sum of the squares of the first one hundred natural
numbers and the square of the sum.
*/

import 'dart:core';

const int NB_COUNT = 100;
const bool DEBUG_MODE = true;

int Solve(int NbCount) {
  int SquareOfSum = 0;
  int SumOfSquare = 0;
  for (int i = 1; i <= NbCount; i++) {
    SquareOfSum += i;
    SumOfSquare += i * i;
  }
  SquareOfSum *=SquareOfSum;
  if (DEBUG_MODE) {
    print("SquareOfSum($NbCount)=$SquareOfSum, SumOfSquare($NbCount)=$SumOfSquare");
  }
  return SquareOfSum - SumOfSquare;
}

void main() {
  assert(Solve(10) == 2640);

  DateTime creationTime = new DateTime.now();
  int res = Solve(NB_COUNT);
  print('Square_of_the_sum($NB_COUNT) - sum_of_the_squares($NB_COUNT) = $res');
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}