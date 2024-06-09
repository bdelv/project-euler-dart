/*
Sub-string Divisibility
https://projecteuler.net/problem=43

The number, 1406357289, is a 0 to 9 pandigital number because it is made up of each of the digits 0 to 9 in some order,
but it also has a rather interesting sub-string divisibility property.

Let d1 be the 1st digit, d2 be the 2nd digit, and so on. In this way, we note the following:
d2d3d4 is divisible by 2
d3d4d5 is divisible by 3
d4d5d6 is divisible by 5
d5d6d7 is divisible by 7
d6d7d8 is divisible by 11
d7d8d9 is divisible by 13
d8d9d10 is divisible by 17
Find the sum of all 0 to 9 pandigital numbers with this property.
*/
import 'dart:core';

const problemNumber = 43;
bool debugMode = false;

Map<int, int> panMap = {1: 2, 2: 3, 3: 5, 4: 7, 5: 11, 6: 13, 7: 17};

bool isPandigital(String str) {
  for (int key in panMap.keys) {
    if (int.parse(str.substring(key, key + 3)) % panMap[key]! != 0) {
      // print('$str ${str.substring(key, key + 3)} ${panMap[key]!}');
      return false;
    }
  }
  return true;
}

int solve() {
  int count = 0;
  void permut(String leftPart, String rightPart) {
    if (rightPart == '') {
      if (isPandigital(leftPart)) {
        print(leftPart);
        count += int.parse(leftPart);
      }
    }
    for (int i = 0; i < rightPart.length; i++) {
      permut(
          leftPart + rightPart[i],
          rightPart.substring(0, i) +
              rightPart.substring(i + 1, rightPart.length));
    }
  }

  // Create the initial string
  String str = '';
  for (int i = 9; i >= 0; i--) {
    str += i.toString();
  }
  permut('', str);
  if (debugMode) print('res=$count');
  return count;
}

void main() {
  assert(debugMode = true);
  assert(isPandigital('1406357289'));

  DateTime startTime = DateTime.now();
  print(
      "Problem ${problemNumber.toString().padLeft(3, '0')}: Solution=${solve()} (in ${DateTime.now().difference(startTime).inMilliseconds}ms)");
}
