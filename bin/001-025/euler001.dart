/*
 * 	Multiples of 3 and 5
 * 	https://projecteuler.net/problem=1
 *
 * If we list all the natural numbers below 10 that are multiples of 3 or 5,
 *  we get 3, 5, 6 and 9. The sum of these multiples is 23.
 * Find the sum of all the multiples of 3 or 5 below 1000.
*/
import 'dart:core';

const problemNumber = 1;
bool debugMode = false;

int solve(int maxNumber) {
  if (debugMode) print('Sum of multiples of 3 or 5 below $maxNumber');
  int sum = 0;
  for (int i = 1; i < maxNumber; i++) {
    if ((i % 3 == 0) || (i % 5 == 0)) sum += i;
  }
  if (debugMode) print('sum=$sum');
  return sum;
}

void main() {
  assert(debugMode = true);
  assert(solve(10) == 23);

  DateTime startTime = DateTime.now();
  print(
      "Problem ${problemNumber.toString().padLeft(3, '0')}: Solution=${solve(1000)} (in ${DateTime.now().difference(startTime).inMilliseconds}ms)");
}
