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

const int STARTING_UNDER = 1000000;
const bool DEBUG_MODE = true;

int CalcChainLength(int start) {
  int nb = 1;
  while (true) {
    nb++;
    if (start.isEven) start ~/= 2;
    else start = 3 * start + 1;
    if (start == 1) return nb;
  }
}

int Solve(int StartingUnder) {
  int MaxChainL = 0;
  int MaxStarting = 0;
  for (int i = 1; i < StartingUnder; i++) {
    int TempChainL = CalcChainLength(i);
    if (TempChainL > MaxChainL) {
      MaxChainL = TempChainL;
      MaxStarting = i;
    }
  }
  if (DEBUG_MODE) print('Max Chain length($StartingUnder): $MaxChainL');
  return MaxStarting;
}

void main() {
  assert(CalcChainLength(13) == 10);

  DateTime creationTime = new DateTime.now();
  int res = Solve(STARTING_UNDER);
  print('Starting number (under $STARTING_UNDER) that produces the longest chain: $res');
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
