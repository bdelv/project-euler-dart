/*
	Summation of primes
	https://projecteuler.net/problem=10

The sum of the primes below 10 is 2 + 3 + 5 + 7 = 17.
Find the sum of all the primes below two million.
*/

import 'dart:core';
import 'dart:math';

const problemNumber = 10;
bool debugMode = false;

int solve(int maxPrime) {
  List<int> primesList = List<int>.filled(maxPrime, 0, growable: false);

  if (debugMode) print('Sum of primes below $maxPrime');
  int idxPrime = 0;
  primesList[idxPrime++] = 2;
  int sumPrimes = 2;
  int numberToTest = 1;
  while (numberToTest + 2 < maxPrime) {
    numberToTest += 2; // only checks the odd numbers
    int sqRoot = sqrt(numberToTest).floor();
    bool isPrime = true;
    for (int i = 0;; i++) {
      // current prime is bigger than the square root of current number => prime number
      if (primesList[i] > sqRoot) break;
      // current prime divides the current number? => non prime number
      if (numberToTest % primesList[i] == 0) {
        isPrime = false;
        break;
      }
    }
    if (isPrime) {
      primesList[idxPrime++] = numberToTest;
      sumPrimes += numberToTest;
      // if (debugMode) print(numberToTest);
    }
  }
  return sumPrimes;
}

void main() {
  assert(debugMode = true);
  assert(solve(10) == 17);

  DateTime startTime = DateTime.now();
  print(
      "Problem ${problemNumber.toString().padLeft(3, '0')}: Solution=${solve(2000000)} (in ${DateTime.now().difference(startTime).inMilliseconds}ms)");
}
