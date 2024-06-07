/*
Quadratic primes
https://projecteuler.net/problem=27

Euler discovered the remarkable quadratic formula:

n² + n + 41

It turns out that the formula will produce 40 primes for the consecutive values n = 0 to 39.
However, when n = 40, 402 + 40 + 41 = 40(40 + 1) + 41 is divisible by 41,
and certainly when n = 41, 41² + 41 + 41 is clearly divisible by 41.

The incredible formula  n² − 79n + 1601 was discovered, which produces 80 primes
for the consecutive values n = 0 to 79. The product of the coefficients, −79 and 1601, is −126479.

Considering quadratics of the form:

n² + an + b, where |a| < 1000 and |b| < 1000

where |n| is the modulus/absolute value of n
e.g. |11| = 11 and |−4| = 4
Find the product of the coefficients, a and b, for the quadratic expression that produces
the maximum number of primes for consecutive values of n, starting with n = 0.
*/

import 'dart:core';
import 'dart:math' as math;

const int maxValue = 1000;
const bool showDebug = true;

bool isPrime(int number) {
  if (number <= 1) {
    return false;
  } else if (number <= 3) {
    return true;
  }
  // manually test 2 and 3 divisors
  else if (number % 2 == 0 || number % 3 == 0) {
    return false;
  }
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

// Calculates the number of consecutive prime numbers for the quadratic
// n*n + n*a + b for n >= 0
int quadraticPrimesCount(int a, int b) {
  int count = 0;
  while (isPrime((count * count + a * count + b).abs())) {
    count++;
  }
  return count;
}

// Brute force "find the biggest number of primes"
// for |a|<MAX_VALUE amd |b|<MAX_VALUE
int solve(int maxValue) {
  int maxCount = 0;
  int tmpCount;
  int res = 0;
  for (int a = -maxValue + 1; a < maxValue; a++) {
    for (int b = -maxValue + 1; b < maxValue; b++) {
      tmpCount = quadraticPrimesCount(a, b);
      if (tmpCount > maxCount) {
        if (showDebug) print("QuadraticPrimesCount($a, $b) = $tmpCount");
        maxCount = tmpCount;
        res = a * b;
      }
    }
  }
  return res;
}

void main() {
  assert(isPrime(7));
  assert(isPrime(11));
  assert(isPrime(19));
  assert(!isPrime(49));
  assert(!isPrime(50));
  assert(quadraticPrimesCount(1, 41) == 40);
  assert(quadraticPrimesCount(-79, 1601) == 80);

  DateTime creationTime = DateTime.now();
  int result = solve(maxValue);
  print(
      "Product of the coefficients, a and b, for the quadratic expression that produces the maximum number of primes for consecutive values of n (for |a|<$maxValue and |b|<$maxValue: $result");
  DateTime finishTime = DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
