/*
	10001st prime
	https://projecteuler.net/problem=7

By listing the first six prime numbers: 2, 3, 5, 7, 11, and 13, we can see that the 6th prime is 13.
What is the 10 001st prime number?
*/
import 'dart:core';
import 'dart:math';

const problemNumber = 7;
bool debugMode = false;

int solve(int primeIdxToFind) {
  List<int> primesList = List<int>.filled(primeIdxToFind, 0, growable: false);

  int idxPrime = 0;
  primesList[idxPrime++] = 2;
  int numberToTest = 1;
  while (idxPrime < primeIdxToFind) {
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
    if (isPrime) primesList[idxPrime++] = numberToTest;
  }
  int res = primesList[idxPrime - 1];
  if (debugMode) {
    print("PrimesList($primeIdxToFind): ${primesList.join(", ")}");
    print('Prime nunber $primeIdxToFind: $res');
  }
  return res;
}

void main() {
  assert(debugMode = true);
  assert(solve(6) == 13);

  DateTime startTime = DateTime.now();
  print(
      "Problem ${problemNumber.toString().padLeft(3, '0')}: Solution=${solve(10001)} (in ${DateTime.now().difference(startTime).inMilliseconds}ms)");
}
