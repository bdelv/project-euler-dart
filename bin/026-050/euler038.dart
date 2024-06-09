/*
Take the number 192 and multiply it by each of 1, 2, and 3:
    192 × 1 = 192
    192 × 2 = 384
    192 × 3 = 576
By concatenating each product we get the 1 to 9 pandigital, 192384576. We will call 192384576 the concatenated product of 192 and (1,2,3)
The same can be achieved by starting with 9 and multiplying by 1, 2, 3, 4, and 5, giving the pandigital, 918273645,
which is the concatenated product of 9 and (1,2,3,4,5).
What is the largest 1 to 9 pandigital 9-digit number that can be formed as the concatenated product of an integer with (1,2, ... , n) where n > 1?
*/
import 'dart:core';

const problemNumber = 38;
bool debugMode = false;

int concatenatedProduct(int nb1, int nb2) {
  String strProduct = "";
  for (int i = 1; i <= nb2; i++) {
    strProduct += (nb1 * i).toString();
  }
  return int.parse(strProduct);
}

bool isPandigital(int nb) {
  String strnb =
      (nb.toString().split('')..sort((a, b) => a.compareTo(b))).join();
  return strnb == "123456789";
}

int solve(int maxNumber) {
  int largestPandigital = 0;
  for (int nb1 = 9999; nb1 > 0; nb1--) {
    for (int nb2 = 2;; nb2++) {
      int res = concatenatedProduct(nb1, nb2);
      int lenres = res.toString().length;
      if (lenres > 9) break;
      if (lenres == 9) {
        if ((isPandigital(res)) && (res > largestPandigital)) {
          largestPandigital = res;
          if (debugMode) print("pandigital( $nb1, $nb2) = $res");
        }
      }
    }
  }
  return largestPandigital;
}

void main() {
  assert(debugMode = true);
  assert(concatenatedProduct(192, 3) == 192384576);
  assert(concatenatedProduct(9, 5) == 918273645);
  assert(isPandigital(192384576));
  assert(isPandigital(918273645));
  assert(!isPandigital(918273644));

  DateTime startTime = DateTime.now();
  print(
      "Problem ${problemNumber.toString().padLeft(3, '0')}: Solution=${solve(11)} (in ${DateTime.now().difference(startTime).inMilliseconds}ms)");
}
