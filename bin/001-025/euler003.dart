/*
Largest prime factor
https://projecteuler.net/problem=3

The prime factors of 13195 are 5, 7, 13 and 29.
What is the largest prime factor of the number 600851475143 ?
*/
import 'dart:core';

const problemNumber = 3;
bool debugMode = false;

int solve(int number) {
  if (debugMode) print('Largest prime factor of $number');
  int maxPrime = 1;
  int currentnumber = number;
  int i = 2;
  while (currentnumber > 1) {
    while (currentnumber % i == 0) {
      if (debugMode) print('Prime factor found: $i');
      currentnumber = currentnumber ~/ i;
      maxPrime = i;
    }
    i++;
  }
  if (debugMode) print('maxPrime=$maxPrime');
  return maxPrime;
}

void main() {
  assert(debugMode = true);
  assert(solve(13195) == 29);

  DateTime startTime = DateTime.now();
  print(
      "Problem ${problemNumber.toString().padLeft(3, '0')}: Solution=${solve(600851475143)} (in ${DateTime.now().difference(startTime).inMilliseconds}ms)");
}
