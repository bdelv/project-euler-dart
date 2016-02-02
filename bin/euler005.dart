/*
Smallest multiple
https://projecteuler.net/problem=5

2520 is the smallest number that can be divided by each of the numbers
from 1 to 10 without any remainder.
What is the smallest positive number that is evenly divisible by all of the numbers from 1 to 20?
*/

import 'dart:core';

const int nbDividers = 20;
const bool showDebug = true;

// ------------------- Method 1: Brute force ---------------------
int solveBruteForce(int nbDividers) {
  bool divideTest(int Nb, int nbDividers) {
    for (int i = (nbDividers ~/ 2) + 1; i <= nbDividers; i++) {
      if (Nb % i != 0) return false;
    }
    return true;
  }
  int currentNb;
  for (currentNb = 1; !divideTest(currentNb, nbDividers); currentNb++);
  return currentNb;
}

// ------------------- Method 2: Search max number of prime dividers ---------------------
int solve(int nbDividers) {
  // create the lists of dividers for each number
  List<int> listNbDividers = new List<int>(nbDividers);
  listNbDividers.fillRange(0, nbDividers, 0);
  listNbDividers[0] = 1;
  // Searches the prime dividers
  for (int currentNb = 2; currentNb < nbDividers; currentNb++) {
    int remaining = currentNb;
    int currentDivisor = 2;
    while (remaining > 1) {
      int divCount = 0;
      while (remaining % currentDivisor == 0) {
        divCount++;
        remaining ~/= currentDivisor;
      }
      if (listNbDividers[currentDivisor - 1] < divCount)
        listNbDividers[currentDivisor - 1] = divCount;
      if (currentDivisor.isEven)
        currentDivisor++;
      else
        currentDivisor += 2;
    }
  }
  if (showDebug)
    print('Prime divisors found in 1..$nbDividers: $listNbDividers');
  // Calculate the smallest number
  int result = 1;
  for (int CurrDiv = 1; CurrDiv < listNbDividers.length; CurrDiv++) {
    for (int i = 1; i <= listNbDividers[CurrDiv - 1]; i++) result *= CurrDiv;
  }
  return result;
}

void main() {
  assert(solve(10) == 2520);

  DateTime creationTime = new DateTime.now();
  int result = solve(nbDividers);
  print(
      'Smallest Number that can be divided by all numbers from 1 to $nbDividers : $result');
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
