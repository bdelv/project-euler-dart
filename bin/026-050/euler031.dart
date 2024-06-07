/*
Coin sums
https://projecteuler.net/problem=31

In England the currency is made up of pound, £, and pence, p, and there are eight coins in general circulation:

1p, 2p, 5p, 10p, 20p, 50p, £1 (100p) and £2 (200p).
It is possible to make £2 in the following way:

1×£1 + 1×50p + 2×20p + 1×5p + 1×2p + 3×1p
How many different ways can £2 be made using any number of coins?
*/

import 'dart:core';

const int cashAmount = 200;
const bool showDebug = false;

List<int> coinsAvailable = [200, 100, 50, 20, 10, 5, 2, 1];

int solve(int cashAmount) {
  int coinsPermut(
      int remaining, List<int> coinsTaken, List<int> coinsAvailable) {
    if (remaining == 0) {
      if (showDebug) print(coinsTaken);
      return 1;
    }
    int res = 0;
    List<int> tmpCoinsAvailable = [];
    tmpCoinsAvailable.addAll(coinsAvailable);
    for (int idx = 0; idx < tmpCoinsAvailable.length; idx++) {
      if (tmpCoinsAvailable[idx] > 0) {
        int tmpRemaining = remaining - tmpCoinsAvailable[idx];
        if (tmpRemaining >= 0) {
          List<int> tmpCoinsTaken = [];
          tmpCoinsTaken.addAll(coinsTaken);
          tmpCoinsTaken[idx]++;
          res += coinsPermut(tmpRemaining, tmpCoinsTaken, tmpCoinsAvailable);
        }
      }
      tmpCoinsAvailable[idx] = -1;
    }
    return res;
  }

  List<int> emptyCoinsTaken =
      List<int>.filled(coinsAvailable.length, 0, growable: false);
  int res = coinsPermut(cashAmount, emptyCoinsTaken, coinsAvailable);
  return res;
}

void main() {
  DateTime creationTime = DateTime.now();
  int result = solve(cashAmount);
  print(
      "Dfferent ways $cashAmount pences can be made using any number of the coins $coinsAvailable: $result");
  DateTime finishTime = DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
