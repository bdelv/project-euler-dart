/*
Lexicographic permutations
https://projecteuler.net/problem=24

A permutation is an ordered arrangement of objects.
For example, 3124 is one possible permutation of the digits 1, 2, 3 and 4.
If all of the permutations are listed numerically or alphabetically,
we call it lexicographic order. The lexicographic permutations of 0, 1 and 2 are:

012   021   102   120   201   210

What is the millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9?
*/

import 'dart:core';

const int digitsCount = 9;
const int nthPermutation = 1000000;
const bool showDebug = false;

int solve(int digitsCount, int nthPermutation) {
  int Count = 0;

  // Create the initial string
  String str = '';
  for (int i = 0; i <= digitsCount; i++) str += i.toString();

  String permut(String leftPart, String rightPart) {
    if (Count >= nthPermutation) return (leftPart + rightPart);
    if (rightPart == "") {
      Count++;
      if (showDebug) print(leftPart);
    }
    for (int i = 0; i < rightPart.length; i++) {
      if (Count >= nthPermutation)
        return (leftPart + rightPart);
      else {
        String result = permut(
            leftPart + rightPart[i],
            rightPart.substring(0, i) +
                rightPart.substring(i + 1, rightPart.length));
        if (Count >= nthPermutation) return (result);
      }
    }
    return leftPart + rightPart;
  }
  return int.parse(permut('', str));
}

void main() {
  assert(solve(2, 6) == 210);

  DateTime creationTime = new DateTime.now();
  int result = solve(digitsCount, nthPermutation);
  print(
      "millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9: $result");
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
