/*
145 is a curious number, as 1! + 4! + 5! = 1 + 24 + 120 = 145.

Find the sum of all numbers which are equal to the sum of the factorial of their digits.

Note: as 1! = 1 and 2! = 2 are not sums they are not included.
*/
import 'dart:core';

const problemNumber = 34;
bool debugMode = false;

List<int> factorials = List<int>.filled(10, 0, growable: false);

int searchCuriousNumbers(String num) {
  int start = 0;
  int numInt = 0;

// 9! = 32880. 6x9!=197280 (max 6 chiffres)
  if (num.length > 6) return 0;
  int res = 0;
  if (num == "") {
    start = 1;
  } else {
    int sum = 0;
    numInt = int.parse(num);
    for (int i = 0; i < num.length; i++) {
      sum += factorials[int.parse(num.substring(i, i + 1))];
    }
    if (sum > 2 && sum == numInt) {
      if (debugMode) print('Curious number: $sum');
      res += numInt;
    }
  }
  for (int i = start; i < 10; i++) {
    res += searchCuriousNumbers(num + i.toString());
  }
  return res;
}

int solve() {
  // precalculate the factorials
  factorials[0] = 1;
  for (int i = 1; i < 10; i++) {
    factorials[i] = factorials[i - 1] * i;
  }

  return searchCuriousNumbers("");
}

void main() {
  assert(debugMode = true);

  DateTime startTime = DateTime.now();
  print(
      "Problem ${problemNumber.toString().padLeft(3, '0')}: Solution=${solve()} (in ${DateTime.now().difference(startTime).inMilliseconds}ms)");
}
