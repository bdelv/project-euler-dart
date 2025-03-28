/*
Pandigital products
https://projecteuler.net/problem=32

We shall say that an n-digit number is pandigital if it makes use of all the digits 1 to n exactly once;
 or example, the 5-digit number, 15234, is 1 through 5 pandigital.

The product 7254 is unusual, as the identity, 39 × 186 = 7254, containing multiplicand, multiplier,
and product is 1 through 9 pandigital.

Find the sum of all products whose multiplicand/multiplier/product identity can be written as a 1 through 9 pandigital.

HINT: Some products can be obtained in more than one way so be sure to only include it once in your sum.
*/
import 'dart:core';

const problemNumber = 32;
bool debugMode = false;

int solve(int digitsCount) {
  if (debugMode) {
    print(
        "Sum of all unique products whose multiplicand/multiplier/product identity can be written as a 1 through $digitsCount pandigital:");
  }
  // list of available digits to make the pandigital numbers
  String availableDigits =
      List<String>.generate(digitsCount, (int idx) => (idx + 1).toString())
          .join("");

  // list to store the unique results
  List<int> results = [];

  int digitsPermut(String permut, String remaining) {
    int res = 0;
    if (remaining == "") {
      // we have 1 permutation. Let's test if we can find a pandigital multiplicand/multiplier/product
      for (int count1 = 1; count1 < permut.length - 2; count1++) {
        for (int count2 = count1;
            permut.length - ((count1 + count2) * 2 - 1) >= 0;
            count2++) {
          int countp = permut.length - (count1 + count2);
          if (countp == count1 + count2 || countp == count1 + count2 - 1) {
            //int countProduct=permut.length-(count1+count2);
            int a = int.parse(permut.substring(0, count1));
            int b = int.parse(permut.substring(count1, count1 + count2));
            int p = int.parse(permut.substring(count1 + count2, permut.length));
            if (a < b && a * b == p) {
              // we found a pandigital product
              if (!results.contains(p)) {
                if (debugMode) print("$a x $b = $p");
                results.add(p);
                res += p;
              }
            }
          }
        }
      }
      return res;
    }
    // we are still making the permutations
    for (int idx = 0; idx < remaining.length; idx++) {
      res += digitsPermut(permut + remaining.substring(idx, idx + 1),
          remaining.replaceRange(idx, idx + 1, ""));
    }
    return res;
  }

  digitsPermut("", availableDigits);

  return results.fold(0, (prev, element) => prev + element);
}

void main() {
  assert(debugMode = true);

  DateTime startTime = DateTime.now();
  print(
      "Problem ${problemNumber.toString().padLeft(3, '0')}: Solution=${solve(9)} (in ${DateTime.now().difference(startTime).inMilliseconds}ms)");
}
