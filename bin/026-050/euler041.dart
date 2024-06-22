/*
Pandigital Prime
https://projecteuler.net/problem=41

We shall say that an n-digit number is pandigital if it makes use of all the digits 
1 to n exactly once. For example, 2143 is a 4-digit pandigital and is also prime.
What is the largest n-digit pandigital prime that exists?
*/
import 'dart:core';
import 'dart:math' as math;

const problemNumber = 41;
bool debugMode = false;

bool isPrime(int number) {
  if (number <= 1) {
    return false;
  } else if (number <= 3) {
    return true;
  }
  // manually test 2 and 3 divisors
  else if (number % 2 == 0 || number % 3 == 0) {
    return false;
  }
  // we can now avoid to consider multiples
  // of 2 and 3. This can be done really simply
  // by starting at 5 and incrementing by 2 and 4
  // alternatively, that is:
  //    5, 7, 11, 13, 17, 19, 23, 25, 29, 31, 35, 37, ...
  int divisor = 5;
  int increment = 2;
  // we don't need to go higher than the square root of the number
  int maxDivisor = math.sqrt(number).floor();
  while (divisor <= maxDivisor) {
    if (number % divisor == 0) return false;
    divisor += increment;
    // this modifies 2 into 4 and viceversa
    increment = 6 - increment;
  }
  // if we get here, the number is prime
  return true;
}

int solve(int nb) {
  String permut(String leftPart, String rightPart) {
    if (rightPart == '') {
      // print('$leftPart $rightPart');
      if (isPrime(int.parse(leftPart + rightPart))) {
        if (debugMode) print('$leftPart $rightPart');
        return leftPart + rightPart;
      }
    }
    for (int i = 0; i < rightPart.length; i++) {
      String result = permut(
          leftPart + rightPart[i],
          rightPart.substring(0, i) +
              rightPart.substring(i + 1, rightPart.length));
      if (result != '') return (result);
    }
    return '';
  }

  int n = nb;
  String resStr = '';
  do {
    // Create the initial string
    String str = '';
    for (int i = n; i >= 1; i--) {
      str += i.toString();
    }
    // search the biggest prime
    resStr = permut('', str);
    n--;
  } while (resStr == '');
  if (debugMode) print('res=$resStr');
  return int.parse(resStr);
}

void main() {
  assert(debugMode = true);
  assert(isPrime(2143));
  assert(solve(4) == 4231);

  DateTime startTime = DateTime.now();
  print(
      "Problem ${problemNumber.toString().padLeft(3, '0')}: Solution=${solve(9)} (in ${DateTime.now().difference(startTime).inMilliseconds}ms)");
}
