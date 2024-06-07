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

const int spiralSize = 1001;
const bool showDebug = false;

int solve(int spiralSize) {
  if (spiralSize % 2 == 0) {
    throw ArgumentError("Spiral size: $spiralSize (should be odd)");
  }
  // Creates the grid
  List<List<int>> spiralGrid = [];
  for (int i = 0; i < spiralSize; i++) {
    spiralGrid.add(List<int>.filled(spiralSize, 0, growable: false));
  }
  // Fill the grid
  int halfSize = (spiralSize - 1) ~/ 2;
  int x = halfSize;
  int y = x;
  int count = 1;
  // Fills the center with the first value (1)
  spiralGrid[y][x] = count++;
  // Draw the squares around the center
  for (int size = 2; size < spiralSize; size += 2) {
    int incX = 0;
    int incY = 0;
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
      for (int j = 0; j < size; j++) {
        x += incX;
        y += incY;
        spiralGrid[y][x] = count++;
      }
    }
  }
  if (showDebug) {
    for (int i = 0; i < spiralSize; i++) {
      print(spiralGrid[i].join(' '));
    }
  }
  // Calculates the sum of the numbers on the diagonals
  int res = 1; // Center value: 1
  for (int i = 1; i <= halfSize; i++) {
    res += spiralGrid[halfSize + i][halfSize + i] +
        spiralGrid[halfSize + i][halfSize - i] +
        spiralGrid[halfSize - i][halfSize - i] +
        spiralGrid[halfSize - i][halfSize + i];
  }
  return res;
}

void main() {
  assert(solve(5) == 101);

  DateTime creationTime = DateTime.now();
  int result = solve(spiralSize);
  print(
      "sum of the numbers on the diagonals in a $spiralSize by $spiralSize spiral: $result");
  DateTime finishTime = DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
