/*
 Truncatable primes
 https://projecteuler.net/problem=37

 The number 3797 has an interesting property. Being prime itself, it is possible to continuously remove digits from left to right,
 and remain prime at each stage: 3797, 797, 97, and 7. Similarly we can work from right to left: 3797, 379, 37, and 3.
 Find the sum of the only eleven primes that are both truncatable from left to right and right to left.
 NOTE: 2, 3, 5, and 7 are not considered to be truncatable primes.
*/

import 'dart:core';
import 'dart:math' as math;

const maxNumber = 11;
const bool showDebug = true;

bool isPrime(int number) {
  if (number <= 1)
    return false;
  else if (number <= 3)
    return true;
  // manually test 2 and 3 divisors
  else if (number % 2 == 0 || number % 3 == 0) return false;
  // we can now avoid to consider multiples
  // of 2 and 3. This can be done really simply
  // by starting at 5 and incrementing by 2 and 4
  // alternatively, that is:
  //    5, 7, 11, 13, 17, 19, 23, 25, 29, 31, 35, 37, ...
  int divisor = 5;
  int increment = 2;
  // we don't need to go higher than the square root of the number
  int maxDivisor = math.sqrt(number).floor();
  while (divisor <= maxDivisor) {
    if (number % divisor == 0) return false;
    divisor += increment;
    // this modifies 2 into 4 and viceversa
    increment = 6 - increment;
  }
  // if we get here, the number is prime
  return true;
}

bool isTruncatableLeft(int num) {
  if (isPrime(num)) {
    String str = num.toString();
    str = str.substring(1);
    if (str.length <= 0)
      return true;
    else
      return isTruncatableLeft(int.parse(str));
  }
  return false;
}

bool isTruncatableRight(int num) {
  if (isPrime(num)) {
    String str = num.toString();
    str = str.substring(0, str.length - 1);
    if (str.length <= 0)
      return true;
    else
      return isTruncatableRight(int.parse(str));
  }
  return false;
}

bool isTruncatable(int num) {
  return (isTruncatableLeft(num) && isTruncatableRight(num));
}

int solve(int maxNumber) {
  int sum = 0;
  int nbTruncatable = 0;
  int nb = 11;
  while (nbTruncatable < maxNumber) {
    if (isTruncatable(nb)) {
      if (showDebug) print("$nb");
      sum += nb;
      nbTruncatable++;
    }
    nb += 2;
  }
  return sum;
}

void main() {
  assert(isPrime(11));
  assert(isPrime(17));
  assert(isPrime(3797));
  assert(!isPrime(12));
  assert(isTruncatable(3797));
  assert(!isTruncatable(3798));

  DateTime creationTime = new DateTime.now();
  int result = solve(maxNumber);
  print(
      "Sum of the only $maxNumber primes that are both truncatable from left to right and right to left: $result");
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
