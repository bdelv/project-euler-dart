/*
The number, 197, is called a circular prime because all rotations of the digits: 197, 971, and 719, are themselves prime.

There are thirteen such primes below 100: 2, 3, 5, 7, 11, 13, 17, 31, 37, 71, 73, 79, and 97.

How many circular primes are there below one million?
*/
import 'dart:core';
import 'dart:math';

const problemNumber = 35;
bool debugMode = false;

int solve(int maxPrime) {
  // fill primes list
  List<int> primesList = [];

  //int idxPrime = 0;
  primesList.add(2);
  //int sumPrimes = 2;
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
      primesList.add(numberToTest);
      //if (showDebug) print(numberToTest);
    }
  }
  // search for circular primes
  List<int> result = [];
  for (int i = 0; i < primesList.length; i++) {
    int currPrime = primesList[i];
    String strCurrPrime = currPrime.toString();
    bool circular = true;
    for (int rotations = 1; rotations < strCurrPrime.length; rotations++) {
      strCurrPrime =
          strCurrPrime.substring(strCurrPrime.length - 1, strCurrPrime.length) +
              strCurrPrime.substring(0, strCurrPrime.length - 1);
      currPrime = int.parse(strCurrPrime);
      if (!primesList.contains(currPrime)) circular = false;
    }
    if (circular) {
      if (!result.contains(currPrime)) result.add(currPrime);
      if (debugMode) print(strCurrPrime);
    }
  }
  return result.length;
}

void main() {
  assert(debugMode = true);

  DateTime startTime = DateTime.now();
  print(
      "Problem ${problemNumber.toString().padLeft(3, '0')}: Solution=${solve(1000000)} (in ${DateTime.now().difference(startTime).inMilliseconds}ms)");
}
