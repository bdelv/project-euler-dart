/*
	Reciprocal cycles
	https://projecteuler.net/problem=26

A unit fraction contains 1 in the numerator. The decimal representation
of the unit fractions with denominators 2 to 10 are given:

1/2 =   0.5
1/3 =   0.(3)
1/4 =   0.25
1/5 =   0.2
1/6 =   0.1(6)
1/7 =   0.(142857)
1/8 =   0.125
1/9 =   0.(1)
1/10  =   0.1
Where 0.1(6) means 0.166666..., and has a 1-digit recurring cycle.
It can be seen that 1/7 has a 6-digit recurring cycle.

Find the value of d < 1000 for which 1/d contains the longest recurring cycle
in its decimal fraction part.
*/

import 'dart:core';

const MAX = 1000;
const bool DEBUG_MODE = true;

String FindCycle(int denominator) {
  String res = '';
  List<int> Used = new List<int>(denominator);
  Used.fillRange(0, denominator, -1);

  int nominator = 1;
  while (nominator > 0) {
    nominator *= 10;
    int newnum = nominator ~/ denominator;
    nominator %= denominator;
    int idx = Used[nominator];
    if (idx >= 0) {
      res = res.substring(idx, res.length);
      break;
    } else {
      Used[nominator] = res.length;
      res += newnum.toString();
    }
  }
  return res;
}

int Solve(int Max) {
  String MaxCycle = '';
  int MaxValue = 0;

  for (int i = 2; i < Max; i++) {
    String tmpCycle = FindCycle(i);
    if (tmpCycle.length > MaxCycle.length) {
      MaxCycle = tmpCycle;
      MaxValue = i;
    }
  }
  if (DEBUG_MODE) {
    print("Cycle($Max): $MaxCycle");
    print("CycleLength($Max): ${MaxCycle.length}");
  }
  return MaxValue;
}

void main() {
  assert(FindCycle(6).length == 1);
  assert(FindCycle(7).length == 6);

  DateTime creationTime = new DateTime.now();
  int res = Solve(MAX);
  print("Value of d < $MAX for which 1/d contains the longest recurring cycle in its decimal fraction part: $res");
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
