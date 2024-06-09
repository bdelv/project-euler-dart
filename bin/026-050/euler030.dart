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

const problemNumber = 30;
bool debugMode = false;

int solve(int nthPower) {
  // Cache the power calculations
  List<int> powerTable = [];
  for (int i = 0; i < 10; i++) {
    powerTable.add(math.pow(i, nthPower) as int);
  }
  // Search for the maximum number worth testing
  int nbDigits = 1;
  while ((powerTable[9] * nbDigits).toString().length > nbDigits) {
    nbDigits++;
  }
  int maxNumber = powerTable[9] * (nbDigits - 1);
  // search for the correct numbers
  int sum;
  int digitsCount;
  int res = 0;
  for (int num = 2; num <= maxNumber; num++) {
    digitsCount = 0;
    sum = 0;
    num.toString().split("").forEach((E) {
      if (E != "0") {
        sum += powerTable[int.parse(E)];
        digitsCount++;
      }
    });
    // It's a match!
    if (digitsCount > 1 && num == sum) {
      res += num;
      if (debugMode) print("power($nthPower): $num");
    }
  }
  if (debugMode) print("power($nthPower): sum = $res");
  return res;
}

void main() {
  assert(debugMode = true);
  assert(solve(4) == 19316);

  DateTime startTime = DateTime.now();
  print(
      "Problem ${problemNumber.toString().padLeft(3, '0')}: Solution=${solve(5)} (in ${DateTime.now().difference(startTime).inMilliseconds}ms)");
}
