/*
Largest prime factor
https://projecteuler.net/problem=3

The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?
*/

import 'dart:core';

const int NB = 600851475143;
const bool DEBUG_MODE = false;

int Solve(int Nb) {
  int MaxPrime = 1;
  int CurrentNb = Nb;
  int i = 2;
  while (CurrentNb > 1) {
    while (CurrentNb % i == 0) {
      if (DEBUG_MODE) print('Prime factor found: $i');
      CurrentNb = CurrentNb ~/ i;
      MaxPrime = i;
    }
    i++;
  }
  return MaxPrime;
}

void main() {
  assert(Solve(13195) == 29);

  DateTime creationTime = new DateTime.now();
  int res = Solve(NB);
  print('Largest prime factor of $NB = $res');
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
