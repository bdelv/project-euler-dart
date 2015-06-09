/*
	10001st prime
	https://projecteuler.net/problem=7

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
What is the 10 001st prime number?
*/

import 'dart:core';
import 'dart:math';

const int MAX_COUNT = 10001;
const bool DEBUG_MODE = true;

int Solve(int MaxCount) {
  List<int> PrimesList = new List<int>(MaxCount);

  int IdxPrime = 0;
  PrimesList[IdxPrime++] = 2;
  int NumberToTest = 1;
  while (IdxPrime < MaxCount) {
    NumberToTest += 2; // only checks the odd numbers
    int SqRoot = sqrt(NumberToTest).floor();
    bool IsPrime = true;
    for (int i = 0;; i++) {
      // current prime is bigger than the square root of current number => prime number
      if (PrimesList[i] > SqRoot) break;
      // current prime divides the current number? => non prime number
      if (NumberToTest % PrimesList[i] == 0) {
        IsPrime = false;
        break;
      }
    }
    if (IsPrime) PrimesList[IdxPrime++] = NumberToTest;
  }
  if (DEBUG_MODE) print("PrimesList($MaxCount): ${PrimesList.join(", ")}");
  return PrimesList[IdxPrime - 1];
}

void main() {
  assert(Solve(6) == 13);

  DateTime creationTime = new DateTime.now();
  int res = Solve(MAX_COUNT);
  print('Prime nunber $MAX_COUNT: $res');
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
