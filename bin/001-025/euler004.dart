/*
Largest palindrome product
https://projecteuler.net/problem=4

A palindromic number reads the same both ways.
The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
Find the largest palindrome made from the product of two 3-digit numbers.
*/

import 'dart:core';
import 'dart:math';

const problemNumber = 4;
bool debugMode = false;

int solve(int nbDigits) {
  if (debugMode) {
    print(
        'largest palindrome made from the product of two $nbDigits-digit numbers');
  }
  int maxPalindrome = 1;
  for (int i = pow(10, nbDigits - 1) as int; i < pow(10, nbDigits); i++) {
    for (int j = pow(10, nbDigits - 1) as int; j < pow(10, nbDigits); j++) {
      int tmpNb = i * j;
      if (tmpNb > maxPalindrome &&
          tmpNb.toString() == tmpNb.toString().split('').reversed.join('')) {
        maxPalindrome = tmpNb;
        if (debugMode) print(maxPalindrome);
      }
    }
  }
  if (debugMode) print('maxPalindrome=$maxPalindrome');
  return maxPalindrome;
}

void main() {
  assert(debugMode = true);
  assert(solve(2) == 9009);

  DateTime startTime = DateTime.now();
  print(
      "Problem ${problemNumber.toString().padLeft(3, '0')}: Solution=${solve(3)} (in ${DateTime.now().difference(startTime).inMilliseconds}ms)");
}
