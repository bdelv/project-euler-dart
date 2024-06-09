/*
 Double-base palindromes
 https://projecteuler.net/problem=36

The decimal number, 585 = 1001001001 (binary), is palindromic in both bases.
Find the sum of all numbers, less than one million, which are palindromic in base 10 and base 2.
(Please note that the palindromic number, in either base, may not include leading zeros.)
*/
import 'dart:core';

const problemNumber = 36;
bool debugMode = false;

bool isPalindromic(String str) {
  return str.split('').reversed.join() == str;
}

int solve(int maxNumber) {
  int sum = 0;
  for (int i = 1; i < maxNumber; i++) {
    if (isPalindromic(i.toString()) && isPalindromic(i.toRadixString(2))) {
      if (debugMode) print("$i / ${i.toRadixString(2)}");
      sum += i;
    }
  }
  return sum;
}

void main() {
  assert(debugMode = true);
  assert(isPalindromic("585"));
  assert(isPalindromic("1001001001"));
  assert(!isPalindromic("586"));
  assert(!isPalindromic("1001001002"));

  DateTime startTime = DateTime.now();
  print(
      "Problem ${problemNumber.toString().padLeft(3, '0')}: Solution=${solve(1000000)} (in ${DateTime.now().difference(startTime).inMilliseconds}ms)");
}
