/*
Number spiral diagonals
https://projecteuler.net/problem=28

Starting with the number 1 and moving to the right in a clockwise direction a 5 by 5 spiral is formed as follows:

[21] 22  23  24 [25]
 20  [7]  8  [9] 10
 19   6  [1]  2  11
 18  [5]  4  [3] 12
[17] 16  15  14 [13]

It can be verified that the sum of the numbers on the diagonals is 101.

What is the sum of the numbers on the diagonals in a 1001 by 1001 spiral formed in the same way?
*/

import 'dart:core';

const int SPIRAL_SIZE = 1001;
const bool DEBUG_MODE = false;

int Solve(int SpiralSize) {
  if (SpiralSize % 2 ==
      0) throw new ArgumentError("Spiral size: $SpiralSize (should be odd)");
  // Creates the grid
  List<List<int>> Spiral = new List<List<int>>(SpiralSize);
  for (int i = 0; i < SpiralSize; i++) Spiral[i] = new List<int>(SpiralSize);
  // Fill the grid
  int _halfSize = (SpiralSize - 1) ~/ 2;
  int x = _halfSize;
  int y = x;
  int _count = 1;
  // Fills the center with the first value (1)
  Spiral[y][x] = _count++;
  // Draw the squares around the center
  for (int _size = 2; _size < SpiralSize; _size += 2) {
    int incX;
    int incY;
    // Starts from top right cell
    x++;
    y--;
    // fills a square
    for (int i = 0; i < 4; i++) {
      // 4 sides of the square: goind down, left, up, then right
      switch (i) {
        case 0: // fills down
          incX = 0;
          incY = 1;
          break;
        case 1: // fills left
          incX = -1;
          incY = 0;
          break;
        case 2: // fills up
          incX = 0;
          incY = -1;
          break;
        case 3: // fills right
          incX = 1;
          incY = 0;
          break;
      }
      // fills the line
      for (int j = 0; j < _size; j++) {
        x += incX;
        y += incY;
        Spiral[y][x] = _count++;
      }
    }
  }
  if (DEBUG_MODE) for (int i = 0; i < SpiralSize; i++) print(Spiral[i].join(' '));
  // Calculates the sum of the numbers on the diagonals
  int _res = 1; // Center value: 1
  for (int i = 1;
      i <= _halfSize;
      i++) _res += Spiral[_halfSize + i][_halfSize + i] +
          Spiral[_halfSize + i][_halfSize - i] +
          Spiral[_halfSize - i][_halfSize - i] +
          Spiral[_halfSize - i][_halfSize + i];
  return _res;
}

void main() {
  assert(Solve(5) == 101);

  DateTime creationTime = new DateTime.now();
  int res = Solve(SPIRAL_SIZE);
  print(
      "sum of the numbers on the diagonals in a $SPIRAL_SIZE by $SPIRAL_SIZE spiral: $res");
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
