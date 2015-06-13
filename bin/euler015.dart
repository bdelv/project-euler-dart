/*
	Lattice paths
https://projecteuler.net/problem=15

Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down,
there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20×20 grid?
*/

import 'dart:core';

const int gridSizeX = 20;
const int gridSizeY = 20;
const bool showDebug = false;

int solve(int gridSizeX,gridSizeY) {
  List<List<int>> cacheRoutesCount = new List(gridSizeY + 1);
  for (int i = 0; i < gridSizeY + 1; i++) {
    List Tmp = new List<int>(gridSizeX + 1);
    Tmp.fillRange(0, gridSizeX + 1, -1);
    cacheRoutesCount[i] = Tmp;
  }

  int calcRoutesCount(int nbx, int nby) {
    if ((nbx == 0) || (nby == 0)) return 1;
    if (cacheRoutesCount[nby][nbx] < 0) cacheRoutesCount[nby][nbx] =
        calcRoutesCount(nbx - 1, nby) + calcRoutesCount(nbx, nby - 1);
    if (showDebug) print("Cache[$nby][$nbx]=${cacheRoutesCount[nby][nbx]}");
    return cacheRoutesCount[nby][nbx];
  }
  return calcRoutesCount(gridSizeX,gridSizeY);
}

void main() {
  assert(solve(2,2) == 6);

  DateTime creationTime = new DateTime.now();
  int result = solve(gridSizeX,gridSizeY);
  print('Number of routes on a $gridSizeX x $gridSizeY grid: $result');
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
