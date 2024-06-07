/*
Largest palindrome product
https://projecteuler.net/problem=4

A palindromic number reads the same both ways.
The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
Find the largest palindrome made from the product of two 3-digit numbers.
*/

import 'dart:core';
import 'dart:math';

const int nbDigits = 3;
const bool showDebug = true;

int solve(int nbDigits) {
  int maxPalindrome = 1;
  for (int i = pow(10, nbDigits - 1) as int; i < pow(10, nbDigits); i++) {
    for (int j = pow(10, nbDigits - 1) as int; j < pow(10, nbDigits); j++) {
      int tmpNb = i * j;
      if (tmpNb > maxPalindrome &&
          tmpNb.toString() == tmpNb.toString().split('').reversed.join('')) {
        maxPalindrome = tmpNb;
        if (showDebug) print(maxPalindrome);
      }
    }
  }
  return maxPalindrome;
}

void main() {
  assert(solve(2) == 9009);

  DateTime creationTime = DateTime.now();
  int result = solve(nbDigits);
  print(
      'largest palindrome made from the product of two $nbDigits-digit numbers: $result');
  DateTime finishTime = DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
