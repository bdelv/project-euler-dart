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
      int remaining, List<int> _coinsTaken, List<int> _coinsAvailable) {
    if (remaining == 0) {
      if (showDebug) print(_coinsTaken);
      return 1;
    }
    int _res = 0;
    List<int> _tmpCoinsAvailable = new List<int>()..addAll(_coinsAvailable);
    for (int _idx = 0; _idx < _tmpCoinsAvailable.length; _idx++) {
      if (_tmpCoinsAvailable[_idx] > 0) {
        int _tmpRemaining = remaining - _tmpCoinsAvailable[_idx];
        if (_tmpRemaining >= 0) {
          List<int> _tmpCoinsTaken = new List<int>()..addAll(_coinsTaken);
          _tmpCoinsTaken[_idx]++;
          _res +=
              coinsPermut(_tmpRemaining, _tmpCoinsTaken, _tmpCoinsAvailable);
        }
      }
      _tmpCoinsAvailable[_idx] = -1;
    }
    return _res;
  }
  List<int> _emptyCoinsTaken = new List<int>(coinsAvailable.length)
    ..fillRange(0, coinsAvailable.length, 0);
  int _res = coinsPermut(cashAmount, _emptyCoinsTaken, coinsAvailable);
  return _res;
}

void main() {
  DateTime creationTime = new DateTime.now();
  int result = solve(cashAmount);
  print(
      "Dfferent ways $cashAmount pences can be made using any number of the coins $coinsAvailable: $result");
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
