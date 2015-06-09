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

const int MAX_COUNT = 1000;
const bool DEBUG_MODE = true;

int Solve(int MaxCount) {
  bool IsPythagoreanTriplet(int a, int b, int c) {
    return (a * a + b * b == c * c);
  }

  for (int a = 1; a < MaxCount; a++) {
    for (int b = a + 1; b < MaxCount; b++) {
      int c = MaxCount - a - b;
      if (c <= b) break;
      if (IsPythagoreanTriplet(a, b, c)) {
        if (DEBUG_MODE) print('for a^2+b^2=c^2 and a+b+c=$MaxCount: a=$a, b=$b, c=$c, abc=${a*b*c}');
        return a*b*c;
      }
    }
  }
  return -1;
}

void main() {
  assert(Solve(12) == 60);

  DateTime creationTime = new DateTime.now();
  int res = Solve(MAX_COUNT);
  print('Product abc of the Pythagorean triplet for which a + b + c = $MAX_COUNT: $res');
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
