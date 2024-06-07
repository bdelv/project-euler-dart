/*
	Special Pythagorean triplet
	https://projecteuler.net/problem=9

A Pythagorean triplet is a set of three natural numbers, a < b < c, for which,
a^2 + b^2 = c^2

For example, 3^2 + 4^2 = 9 + 16 = 25 = 5^2.

There exists exactly one Pythagorean triplet for which a + b + c = 1000.
Find the product abc.
*/

import 'dart:core';

const int sumPythagoreanTriplet = 1000;
const bool showDebug = true;

int solve(int sumPythagoreanTriplet) {
  bool isPythagoreanTriplet(int a, int b, int c) {
    return (a * a + b * b == c * c);
  }

  for (int a = 1; a < sumPythagoreanTriplet; a++) {
    for (int b = a + 1; b < sumPythagoreanTriplet; b++) {
      int c = sumPythagoreanTriplet - a - b;
      if (c <= b) break;
      if (isPythagoreanTriplet(a, b, c)) {
        if (showDebug) {
          print(
              'for a^2+b^2=c^2 and a+b+c=$sumPythagoreanTriplet: a=$a, b=$b, c=$c, abc=${a * b * c}');
        }
        return a * b * c;
      }
    }
  }
  return -1;
}

void main() {
  assert(solve(12) == 60);

  DateTime creationTime = DateTime.now();
  int result = solve(sumPythagoreanTriplet);
  print(
      'Product abc of the Pythagorean triplet for which a + b + c = $sumPythagoreanTriplet: $result');
  DateTime finishTime = DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
