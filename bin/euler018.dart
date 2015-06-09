/*
Maximum path sum I
https://projecteuler.net/problem=18

By starting at the top of the triangle below and moving to adjacent numbers on the row below, 
the maximum total from top to bottom is 23.
3
7 4
2 4 6
8 5 9 3

That is, 3 + 7 + 4 + 9 = 23.
Find the maximum total from top to bottom of the triangle below:
75
95 64
17 47 82
18 35 87 10
20 04 82 47 65
19 01 23 75 03 34
88 02 77 73 07 63 67
99 65 04 28 06 16 70 92
41 41 26 56 83 40 80 70 33
41 48 72 33 47 32 37 16 94 29
53 71 44 65 25 43 91 52 97 51 14
70 11 33 28 77 73 17 78 39 68 17 57
91 71 52 38 17 14 91 43 58 50 27 29 48
63 66 04 68 89 53 67 30 73 16 69 87 40 31
04 62 98 27 23 09 70 98 73 93 38 53 60 04 23

NOTE: As there are only 16384 routes, it is possible to solve this problem by trying every route.
However, Problem 67, is the same challenge with a triangle containing one-hundred rows;
it cannot be solved by brute force, and requires a clever method! ;o)
*/

import 'dart:core';
import 'dart:math';

const DEBUG_MODE = true;

List<String> ListStrTest = [
"3",
"7 4",
"2 4 6",
"8 5 9 3"
];

List<String> ListStr = [
  "75",
  "95 64",
  "17 47 82",
  "18 35 87 10",
  "20 04 82 47 65",
  "19 01 23 75 03 34",
  "88 02 77 73 07 63 67",
  "99 65 04 28 06 16 70 92",
  "41 41 26 56 83 40 80 70 33",
  "41 48 72 33 47 32 37 16 94 29",
  "53 71 44 65 25 43 91 52 97 51 14",
  "70 11 33 28 77 73 17 78 39 68 17 57",
  "91 71 52 38 17 14 91 43 58 50 27 29 48",
  "63 66 04 68 89 53 67 30 73 16 69 87 40 31",
  "04 62 98 27 23 09 70 98 73 93 38 53 60 04 23"
];

int Solve(List<String> ListStr) {
  List<List<int>> ListInt = new List<List<int>>();
  List<List<int>> ListCache = new List<List<int>>();

  int MaxTotal(int x, int y) {
    int res = ListCache[y][x];
    if (res >= 0) return res;
    res = ListInt[y][x];
    if (y < ListInt.length - 1) {
      res += max(MaxTotal(x, y + 1), MaxTotal(x + 1, y + 1));
    }
    ListCache[y][x] = res;
    return res;
  }

  // converts the file to integers
  for (int y = 0; y < ListStr.length; y++) {
    var parts = ListStr[y].split(' ');
    List<int> tmpInt = new List<int>();
    List<int> tmpCache = new List<int>();
    parts.forEach((e) {
      tmpInt.add(int.parse(e));
      tmpCache.add(-1);
    });
    ListInt.add(tmpInt);
    ListCache.add(tmpCache);
  }
  // Search for the max total up to bottom
  if (DEBUG_MODE) ListStr.forEach((Str)=>print(Str));
  return MaxTotal(0,0);
}

void main() {
  assert(Solve(ListStrTest) == 23);

  DateTime creationTime = new DateTime.now();
  int res = Solve(ListStr);
  print('Maximum total from top to bottom of the given triangle: $res');
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
