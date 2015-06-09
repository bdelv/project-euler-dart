/*
Largest palindrome product
https://projecteuler.net/problem=4

A palindromic number reads the same both ways.
The largest palindrome made from the product of two 2-digit numbers is 9009 = 91 × 99.
Find the largest palindrome made from the product of two 3-digit numbers.
*/

import 'dart:core';
import 'dart:math';

const int NB_DIGITS = 3;
const bool DEBUG_MODE = true;

int Solve(int NbDigits) {
  int MaxPal = 1;
  for (int i = pow(10, NbDigits - 1); i < pow(10, NbDigits); i++) {
    for (int j = pow(10, NbDigits - 1); j < pow(10, NbDigits); j++) {
      int Nb = i * j;
      if (Nb > MaxPal &&
          Nb.toString() == Nb.toString().split('').reversed.join('')) {
        MaxPal = Nb;
        if (DEBUG_MODE) print(MaxPal);
      }
    }
  }
  return MaxPal;
}

void main() {
  assert(Solve(2) == 9009);

  DateTime creationTime = new DateTime.now();
  int res = Solve(NB_DIGITS);
  print(
      'largest palindrome made from the product of two $NB_DIGITS-digit numbers: $res');
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
