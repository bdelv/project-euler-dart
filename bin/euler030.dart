/*
Digit fifth powers
https://projecteuler.net/problem=30

Surprisingly there are only three numbers that can be written as the sum of fourth powers of their digits:

1634 = 1^4 + 6^4 + 3^4 + 4^4
8208 = 8^4 + 2^4 + 0^4 + 8^4
9474 = 9^4 + 4^4 + 7^4 + 4^4
As 1 = 1^4 is not a sum it is not included.

The sum of these numbers is 1634 + 8208 + 9474 = 19316.

Find the sum of all the numbers that can be written as the sum of fifth powers of their digits.
*/

import 'dart:core';
import 'dart:math' as math;

const int POWER = 5;
const bool DEBUG_MODE = true;

int Solve(int Power) {
  // Cache the power calculations
  List<int> powerTable = new List<int>(10);
  for (int i = 0; i < 10; i++) powerTable[i] = math.pow(i, Power);
  // Search for the maximum number worth testing
  int nbDigits = 1;
  while ((powerTable[9] * nbDigits).toString().length > nbDigits) nbDigits++;
  int MaxNumber = powerTable[9] * (nbDigits - 1);
  // search for the correct numbers
  int _sum;
  int _digitsCount;
  int _res = 0;
  for (int _num = 2; _num <= MaxNumber; _num++) {
    _digitsCount = 0;
    _sum = 0;
    _num.toString().split("").forEach((E) {
      if (E != "0") {
        _sum += powerTable[int.parse(E)];
        _digitsCount++;
      }
    });
    // It's a match!
    if (_digitsCount > 1 && _num == _sum) {
      _res += _num;
      if (DEBUG_MODE) print("power($Power): $_num");
    }
  }
  if (DEBUG_MODE) print("power($Power): sum = $_res");
  return _res;
}

void main() {
  assert(Solve(4) == 19316);

  DateTime creationTime = new DateTime.now();
  int res = Solve(POWER);
  print(
      "Sum of all the numbers that can be written as the sum of fifth powers of their digits: $res");
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
