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

const int numberCount = 100;
const bool showDebug = true;

int solve(int numberCount) {
  int squareOfSum = 0;
  int sumOfSquare = 0;
  for (int i = 1; i <= numberCount; i++) {
    squareOfSum += i;
    sumOfSquare += i * i;
  }
  squareOfSum *= squareOfSum;
  if (showDebug) {
    print(
        "SquareOfSum($numberCount)=$squareOfSum, SumOfSquare($numberCount)=$sumOfSquare");
  }
  return squareOfSum - sumOfSquare;
}

void main() {
  assert(solve(10) == 2640);

  DateTime creationTime = new DateTime.now();
  int result = solve(numberCount);
  print(
      'Square_of_the_sum($numberCount) - sum_of_the_squares($numberCount) = $result');
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
