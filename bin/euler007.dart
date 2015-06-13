/*
	10001st prime
	https://projecteuler.net/problem=7

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
What is the 10 001st prime number?
*/

import 'dart:core';
import 'dart:math';

const int primeIdxToFind = 10001;
const bool showDebug = true;

int solve(int primeIdxToFind) {
  List<int> primesList = new List<int>(primeIdxToFind);

  int idxPrime = 0;
  primesList[idxPrime++] = 2;
  int numberToTest = 1;
  while (idxPrime < primeIdxToFind) {
    numberToTest += 2; // only checks the odd numbers
    int sqRoot = sqrt(numberToTest).floor();
    bool IsPrime = true;
    for (int i = 0;; i++) {
      // current prime is bigger than the square root of current number => prime number
      if (primesList[i] > sqRoot) break;
      // current prime divides the current number? => non prime number
      if (numberToTest % primesList[i] == 0) {
        IsPrime = false;
        break;
      }
    }
    if (IsPrime) primesList[idxPrime++] = numberToTest;
  }
  if (showDebug) print("PrimesList($primeIdxToFind): ${primesList.join(", ")}");
  return primesList[idxPrime - 1];
}

void main() {
  assert(solve(6) == 13);

  DateTime creationTime = new DateTime.now();
  int result = solve(primeIdxToFind);
  print('Prime nunber $primeIdxToFind: $result');
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
