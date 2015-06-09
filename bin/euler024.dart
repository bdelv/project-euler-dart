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

const int MAX_DIGIT = 9;
const int COUNT_STOP = 1000000;
const bool DEBUG_MODE = false;

int Solve(int MaxDigit, int CountStop) {
  int Count = 0;

  // Create the initial string
  String str = '';
  for (int i = 0; i <= MaxDigit; i++) str += i.toString();

  String Permut(String Left, String right) {
    if (Count >= CountStop) return(Left+right);
    if (right == "") {
      Count++;
      if (DEBUG_MODE) print(Left);
    }
    for (int i = 0; i < right.length; i++) {
      if (Count >= CountStop) return(Left+right);
      else {
        String res = Permut(Left + right[i], right.substring(0, i) + right.substring(i + 1, right.length));
        if (Count >= CountStop) return(res);
      }
    }
    return Left+right;
  }
  return int.parse(Permut('', str));
}

void main() {
  assert(Solve(2,6) == 210);

  DateTime creationTime = new DateTime.now();
  int res = Solve(MAX_DIGIT, COUNT_STOP);
  print("millionth lexicographic permutation of the digits 0, 1, 2, 3, 4, 5, 6, 7, 8 and 9: $res");
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
