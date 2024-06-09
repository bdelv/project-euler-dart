/*
	Amicable numbers
	https://projecteuler.net/problem=21

Let d(n) be defined as the sum of proper divisors of n
(numbers less than n which divide evenly into n).
If d(a) = b and d(b) = a, where a ≠ b, then a and b are an
amicable pair and each of a and b are called amicable numbers.

For example, the proper divisors of 220 are 1, 2, 4, 5, 10, 11, 20, 22, 44, 55 and 110;
therefore d(220) = 284. The proper divisors of 284 are 1, 2, 4, 71 and 142; so d(284) = 220.

Evaluate the sum of all the amicable numbers under 10000.
*/
import 'dart:core';

const problemNumber = 21;
bool debugMode = false;

int sumOfDivisors(int num) {
  int sum = 0;
  for (int i = 1; i <= num ~/ 2; i++) {
    if (num % i == 0) sum += i;
  }
  return sum;
}

int solve(int maxAmicablesNumber) {
  if (debugMode) print('Sum of amicables < $maxAmicablesNumber:');
  int sum = 0;
  for (int i = 1; i < maxAmicablesNumber; i++) {
    int sumDiv = sumOfDivisors(i);
    if ((sumDiv != i) && (sumDiv < maxAmicablesNumber)) {
      if (sumOfDivisors(sumDiv) == i) {
        sum += i;
        if (debugMode) print("amicable number: $sumDiv");
      }
    }
  }
  return sum;
}

void main() {
  assert(debugMode = true);
  assert(sumOfDivisors(220) == 284);
  assert(sumOfDivisors(284) == 220);

  DateTime startTime = DateTime.now();
  print(
      "Problem ${problemNumber.toString().padLeft(3, '0')}: Solution=${solve(10000)} (in ${DateTime.now().difference(startTime).inMilliseconds}ms)");
}
