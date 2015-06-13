/*
Largest prime factor
https://projecteuler.net/problem=3

The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?
*/

import 'dart:core';

const int NB = 600851475143;
const bool showDebug = false;

int solve(int NB) {
  int maxPrime = 1;
  int currentNb = NB;
  int i = 2;
  while (currentNb > 1) {
    while (currentNb % i == 0) {
      if (showDebug) print('Prime factor found: $i');
      currentNb = currentNb ~/ i;
      maxPrime = i;
    }
    i++;
  }
  return maxPrime;
}

void main() {
  assert(solve(13195) == 29);

  DateTime creationTime = new DateTime.now();
  int result = solve(NB);
  print('Largest prime factor of $NB = $result');
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
