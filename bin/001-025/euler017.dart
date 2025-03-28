/*
Number letter counts
https://projecteuler.net/problem=17

If the numbers 1 to 5 are written out in words: one, two, three, four, five,
then there are 3 + 3 + 5 + 4 + 4 = 19 letters used in total.

If all the numbers from 1 to 1000 (one thousand) inclusive were written out in words,
how many letters would be used?

NOTE: Do not count spaces or hyphens. For example, 342 (three hundred and forty-two)
contains 23 letters and 115 (one hundred and fifteen) contains 20 letters.
The use of "and" when writing out numbers is in compliance with British usage.
*/

import 'dart:core';

const problemNumber = 17;
bool debugMode = false;

Map<int, String> mapNumbers = {
  1: 'one',
  2: 'two',
  3: 'three',
  4: 'four',
  5: 'five',
  6: 'six',
  7: 'seven',
  8: 'eight',
  9: 'nine',
  10: 'ten',
  11: 'eleven',
  12: 'twelve',
  13: 'thirteen',
  14: 'fourteen',
  15: 'fifteen',
  16: 'sixteen',
  17: 'seventeen',
  18: 'eighteen',
  19: 'nineteen',
  20: 'twenty',
  30: 'thirty',
  40: 'forty',
  50: 'fifty',
  60: 'sixty',
  70: 'seventy',
  80: 'eighty',
  90: 'ninety',
  100: 'one hundred',
  1000: 'one thousand'
};

String number2Text(int num) {
  String result = '';
  if (mapNumbers.containsKey(num)) {
    result = mapNumbers[num]!;
  } else if (num < 100) {
    result = number2Text(num - (num % 10));
    if (num % 10 > 0) result += '-${number2Text(num % 10)}';
  } else if (num < 1000) {
    result += '${number2Text(num ~/ 100)} hundred';
    if (num % 100 > 0) result += ' and ${number2Text(num % 100)}';
  }
  return result;
}

int lettersCount(String str) {
  int sum = 0;
  for (int i = 0; i < str.length; i++) {
    if ((str[i] != ' ') && (str[i] != '-')) sum++;
  }
  if (debugMode) print("$str / $sum letters");
  return sum;
}

int solve(int maxNb) {
  if (debugMode) {
    print(
        'Total number of letters in 1 to $maxNb (inclusive) written out in words:');
  }
  int sum = 0;
  for (int i = 1; i <= maxNb; i++) {
    sum += lettersCount(number2Text(i));
  }
  if (debugMode) print('sum=$sum');
  return sum;
}

void main() {
  assert(debugMode = true);
  assert(number2Text(342) == "three hundred and forty-two");
  assert(number2Text(115) == "one hundred and fifteen");
  assert(lettersCount(number2Text(342)) == 23);
  assert(lettersCount(number2Text(115)) == 20);
  assert(solve(5) == 19);

  DateTime startTime = DateTime.now();
  print(
      "Problem ${problemNumber.toString().padLeft(3, '0')}: Solution=${solve(1000)} (in ${DateTime.now().difference(startTime).inMilliseconds}ms)");
}
