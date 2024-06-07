/*
Longest Collatz sequence
https://projecteuler.net/problem=14

The following iterative sequence is defined for the set of positive integers:
n → n/2 (n is even)
n → 3n + 1 (n is odd)

Using the rule above and starting with 13, we generate the following sequence:

13 → 40 → 20 → 10 → 5 → 16 → 8 → 4 → 2 → 1
It can be seen that this sequence (starting at 13 and finishing at 1) contains 10 terms.
Although it has not been proved yet (Collatz Problem), it is thought that all starting
numbers finish at 1.

Which starting number, under one million, produces the longest chain?

NOTE: Once the chain starts the terms are allowed to go above one million
*/

import 'dart:core';

const int startingUnder = 1000000;
const bool showDebug = true;

int calcChainLength(int start) {
  int nb = 1;
  while (true) {
    nb++;
    if (start.isEven) {
      start ~/= 2;
    } else {
      start = 3 * start + 1;
    }
    if (start == 1) return nb;
  }
}

int solve(int startingUnder) {
  int maxChainLength = 0;
  int startingNbMaxSum = 0;
  for (int i = 1; i < startingUnder; i++) {
    int tempChainLength = calcChainLength(i);
    if (tempChainLength > maxChainLength) {
      maxChainLength = tempChainLength;
      startingNbMaxSum = i;
    }
  }
  if (showDebug) print('Max Chain length($startingUnder): $maxChainLength');
  return startingNbMaxSum;
}

void main() {
  assert(calcChainLength(13) == 10);

  DateTime creationTime = DateTime.now();
  int result = solve(startingUnder);
  print(
      'Starting number (under $startingUnder) that produces the longest chain: $result');
  DateTime finishTime = DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
