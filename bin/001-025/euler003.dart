/*
Largest prime factor
https://projecteuler.net/problem=3

The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?
*/

import 'dart:core';

const int number = 600851475143;
const bool showDebug = false;

int solve(int number) {
  int maxPrime = 1;
  int currentnumber = number;
  int i = 2;
  while (currentnumber > 1) {
    while (currentnumber % i == 0) {
      if (showDebug) print('Prime factor found: $i');
      currentnumber = currentnumber ~/ i;
      maxPrime = i;
    }
    i++;
  }
  return maxPrime;
}

void main() {
  assert(solve(13195) == 29);

  DateTime creationTime = DateTime.now();
  int result = solve(number);
  print('Largest prime factor of $number = $result');
  DateTime finishTime = DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
