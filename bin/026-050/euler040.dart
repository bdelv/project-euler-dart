/*
Champernowne's Constant
https://projecteuler.net/problem=40

An irrational decimal fraction is created by concatenating the positive integers:
0.123456789101112131415161718192021...
It can be seen that the 12th digit of the fractional part is 1.
If dn represents the nth digit of the fractional part, find the value of the following expression.
d1 x d10 x d100 x d1000 x d10000 x d100000 x 1000000
*/
import 'dart:core';
import 'dart:math';

const problemNumber = 40;
bool debugMode = false;

int myPow(int exp) {
  switch (exp) {
    case -1:
      return 0;
    case 0:
      return 1;
    default:
      return pow(10, exp).toInt();
  }
  // return (exp <= 0 ? 1 : pow(10, exp).toInt());
}

// 1 number: 9x10^0 begins at 0
// 2 numbers: 9x10^1 begins 10^0 + 9x10^0x1
// 3 numbers: 9x10^2 begins 10^1 + 9x10^2x2
// 4 numbers: 9x10^4 begins 10^2 + 9x10^3x3
// pos to number
// 0 -> 0
// 10 -> 10
// 10+90*2 = 190 -> 100
// 190+900*3 = 2890 -> 1000
int nbAtPos(int pos) {
  int powTen = 0;
  int posOfFirst = 1;
  int nb = 1;
  while (pos >= posOfFirst + 9 * myPow(powTen) * (powTen + 1)) {
    posOfFirst += 9 * myPow(powTen) * (powTen + 1);
    nb += 9 * myPow(powTen);
    powTen++;
  }
  nb += ((pos - posOfFirst) ~/ (powTen + 1));
  if (debugMode) print('pos:$pos powTen:$powTen posOfFirst:$posOfFirst nb:$nb');
  int res = int.parse(nb.toString()[((pos - posOfFirst) % (powTen + 1))]);
  if (debugMode) print('res=$res');
  return res;
}

int solve() {
  return nbAtPos(1) *
      nbAtPos(10) *
      nbAtPos(100) *
      nbAtPos(1000) *
      nbAtPos(10000) *
      nbAtPos(100000) *
      nbAtPos(1000000);
}

void main() {
  assert(debugMode = true);
  assert(nbAtPos(1) == 1);
  assert(nbAtPos(10) == 1);
  assert(nbAtPos(11) == 0);
  assert(nbAtPos(12) == 1);
  assert(nbAtPos(13) == 1);
  assert(nbAtPos(15) == 2);
  assert(nbAtPos(100) == 5);
  assert(nbAtPos(190) == 1);

  DateTime startTime = DateTime.now();
  print(
      "Problem ${problemNumber.toString().padLeft(3, '0')}: Solution=${solve()} (in ${DateTime.now().difference(startTime).inMilliseconds}ms)");
}
