/*
	Summation of primes
	https://projecteuler.net/problem=10

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
Find the sum of all the primes below two million.
*/

import 'dart:core';
import 'dart:math';

const int MAX_PRIME = 2000000;
const bool DEBUG_MODE = false;

int Solve(int MaxPrime) {
  List<int> PrimesList = new List<int>(MaxPrime);

  int IdxPrime = 0;
  PrimesList[IdxPrime++] = 2;
  int Sum = 2;
  int NumberToTest = 1;
  while (NumberToTest + 2 < MaxPrime) {
    NumberToTest += 2; // only checks the odd numbers
    int SqRoot = sqrt(NumberToTest).floor();
    bool IsPrime = true;
    for (int i = 0; ; i++) {
      // current prime is bigger than the square root of current number => prime number
      if (PrimesList[i] > SqRoot) break;
      // current prime divides the current number? => non prime number
      if (NumberToTest % PrimesList[i] == 0) {
        IsPrime = false;
        break;
      }
    }
    if (IsPrime) {
      PrimesList[IdxPrime++] = NumberToTest;
      Sum += NumberToTest;
      if (DEBUG_MODE) print(NumberToTest);
    }
  }
  return Sum;
}

void main() {
  assert(Solve(10) == 17);

  DateTime creationTime = new DateTime.now();
  int res = Solve(MAX_PRIME);
  print('Sum of primes below $MAX_PRIME = $res');
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}