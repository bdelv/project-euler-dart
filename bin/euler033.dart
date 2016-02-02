/*
The fraction 49/98 is a curious fraction, as an inexperienced mathematician in attempting to simplify
it may incorrectly believe that 49/98 = 4/8, which is correct, is obtained by cancelling the 9s.

We shall consider fractions like, 30/50 = 3/5, to be trivial examples.

There are exactly four non-trivial examples of this type of fraction, less than one in value,
and containing two digits in the numerator and denominator.

If the product of these four fractions is given in its lowest common terms, find the value of the denominator.
*/

import 'dart:core';
import 'dart:math';

const int maxDigits = 2;

String simplifyFraction(int nom, int denom) {
  int tmp = nom;
  while (tmp > 2) {
    if ((nom % tmp == 0) && (denom % tmp == 0)) {
      nom ~/= tmp;
      denom ~/= tmp;
    }
    tmp--;
  }
  return ("${nom.toString()}/${denom.toString()}");
}

bool isCuriousFraction(int nom, int denom) {
  String _strNom = nom.toString();
  String _strDenom = denom.toString();
  for (int digit = 1; digit <= 9; digit++) {
    String _strDigit = digit.toString();
    if ((_strNom.contains(_strDigit)) && (_strDenom.contains(_strDigit))) {
      return (simplifyFraction(int.parse(_strNom.replaceFirst(_strDigit, "")),
              int.parse(_strDenom.replaceFirst(_strDigit, ""))) ==
          simplifyFraction(int.parse(_strNom), int.parse(_strDenom)));
    }
  }
  return false;
}

int solve() {
  int nomProduct = 1;
  int denomProduct = 1;
  for (int denom = pow(10, maxDigits - 1); denom < pow(10, maxDigits); denom++)
    for (int nom = pow(10, maxDigits - 1); nom < denom; nom++) {
    if (isCuriousFraction(nom, denom)) {
      print("$nom/$denom");
      nomProduct *= nom;
      denomProduct *= denom;
    }
  }
  return int.parse(simplifyFraction(nomProduct, denomProduct).split("/")[1]);
}

void main() {
  assert(!isCuriousFraction(30, 50));
  assert(isCuriousFraction(49, 98));
  assert(!isCuriousFraction(40, 50)); // trivial examples excluded
  assert(!isCuriousFraction(39, 98));

  DateTime creationTime = new DateTime.now();
  int result = solve();
  print(
      'Nominators product of the curious fractions of $maxDigits digits = $result');
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
