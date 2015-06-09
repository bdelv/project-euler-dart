/*
Smallest multiple
https://projecteuler.net/problem=5

2520 is the smallest number that can be divided by each of the numbers
from 1 to 10 without any remainder.
What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
*/

import 'dart:core';

const int NB_DIVIDERS = 20;
const bool DEBUG_MODE = true;

// ------------------- Method 1: Brute force ---------------------
int SolveBruteForce(int NbDividers) {
  bool DivideTest(int Nb, int NbDividers) {
    for (int i = (NbDividers ~/ 2) + 1; i <= NbDividers; i++) {
      if (Nb % i != 0) return false;
    }
    return true;
  }

  int CurrentNb;
  for (CurrentNb = 1; !DivideTest(CurrentNb, NbDividers); CurrentNb++);
  return CurrentNb;
}

// ------------------- Method 2: Search max number of prime dividers ---------------------
int Solve(int NB_DIVIDERS) {
  // create the lists of dividers for each number
  List<int> NbDividers = new List<int>(NB_DIVIDERS);
  NbDividers.fillRange(0, NB_DIVIDERS, 0);
  NbDividers[0]=1;
  // Searches the prime dividers
  for (int CurrentNb = 2; CurrentNb < NB_DIVIDERS; CurrentNb++) {
    int Remaining = CurrentNb;
    int CurrDiv = 2;
    while (Remaining > 1) {
      int NbDiv = 0;
      while (Remaining % CurrDiv == 0) {
        NbDiv++;
        Remaining ~/= CurrDiv;
      }
      if (NbDividers[CurrDiv - 1] < NbDiv) NbDividers[CurrDiv - 1] = NbDiv;
      if (CurrDiv%2==0)CurrDiv++;
      else CurrDiv+=2;
    }
  }
  if (DEBUG_MODE) print('Prime divisors found in 1..$NB_DIVIDERS: $NbDividers');
  // Calculate the smallest number
  int Res = 1;
  for (int CurrDiv = 1; CurrDiv < NbDividers.length; CurrDiv++) {
    for (int i = 1; i <= NbDividers[CurrDiv - 1]; i++) Res *= CurrDiv;
  }
  return Res;
}

void main() {
  assert(Solve(10) == 2520);

  DateTime creationTime = new DateTime.now();
  int res = Solve(NB_DIVIDERS);
  print('Smallest Number that can be divided by all numbers from 1 to $NB_DIVIDERS : $res');
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
