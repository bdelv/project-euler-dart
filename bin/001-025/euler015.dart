/*
	Lattice paths
https://projecteuler.net/problem=15

Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down,
there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20×20 grid?
*/
import 'dart:core';

const problemNumber = 15;
bool debugMode = false;

int solve(int gridSizeX, int gridSizeY) {
  if (debugMode) print('Number of routes on a $gridSizeX x $gridSizeY grid:');

  List<List<int>> cacheRoutesCount = [];
  for (int y = 0; y <= gridSizeY; y++) {
    cacheRoutesCount.add(List<int>.filled(gridSizeX + 1, -1, growable: false));
  }
  int calcRoutesCount(int nbx, int nby) {
    if ((nbx == 0) || (nby == 0)) return 1;
    if (cacheRoutesCount[nby][nbx] < 0) {
      cacheRoutesCount[nby][nbx] =
          calcRoutesCount(nbx - 1, nby) + calcRoutesCount(nbx, nby - 1);
    }
    if (debugMode) print("Cache[$nby][$nbx]=${cacheRoutesCount[nby][nbx]}");
    return cacheRoutesCount[nby][nbx];
  }

  return calcRoutesCount(gridSizeX, gridSizeY);
}

void main() {
  assert(debugMode = true);
  assert(solve(2, 2) == 6);

  DateTime startTime = DateTime.now();
  print(
      "Problem ${problemNumber.toString().padLeft(3, '0')}: Solution=${solve(20, 20)} (in ${DateTime.now().difference(startTime).inMilliseconds}ms)");
}
