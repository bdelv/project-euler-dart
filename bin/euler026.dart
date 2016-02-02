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

const maxD = 1000;
const bool showDebug = true;

String findCycle(int denominator) {
  String result = '';
  List<int> usedNominators = new List<int>(denominator);
  usedNominators.fillRange(0, denominator, -1);

  int nominator = 1;
  while (nominator > 0) {
    nominator *= 10;
    int newnum = nominator ~/ denominator;
    nominator %= denominator;
    int idx = usedNominators[nominator];
    if (idx >= 0) {
      result = result.substring(idx, result.length);
      break;
    } else {
      usedNominators[nominator] = result.length;
      result += newnum.toString();
    }
  }
  return result;
}

int solve(int maxD) {
  String maxCycle = '';
  int maxValue = 0;

  for (int i = 2; i < maxD; i++) {
    String tmpCycle = findCycle(i);
    if (tmpCycle.length > maxCycle.length) {
      maxCycle = tmpCycle;
      maxValue = i;
    }
  }
  if (showDebug) {
    print("Cycle($maxD): $maxCycle");
    print("CycleLength($maxD): ${maxCycle.length}");
  }
  return maxValue;
}

void main() {
  assert(findCycle(6).length == 1);
  assert(findCycle(7).length == 6);

  DateTime creationTime = new DateTime.now();
  int result = solve(maxD);
  print(
      "Value of d < $maxD for which 1/d contains the longest recurring cycle in its decimal fraction part: $result");
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
