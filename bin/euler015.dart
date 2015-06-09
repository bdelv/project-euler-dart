/*
	Lattice paths
https://projecteuler.net/problem=15

Starting in the top left corner of a 2×2 grid, and only being able to move to the right and down,
there are exactly 6 routes to the bottom right corner.

How many such routes are there through a 20×20 grid?
*/

import 'dart:core';

const int GRID_SIZE_X = 20;
const int GRID_SIZE_Y = 20;
const bool DEBUG_MODE = false;

int Solve(int GridSizeX,GridSizeY) {
  List<List<int>> Cache = new List(GridSizeY + 1);
  for (int i = 0; i < GridSizeY + 1; i++) {
    List Tmp = new List<int>(GridSizeX + 1);
    Tmp.fillRange(0, GridSizeX + 1, -1);
    Cache[i] = Tmp;
  }

  int NbRoutes(int nbx, int nby) {
    if ((nbx == 0) || (nby == 0)) return 1;
    if (Cache[nby][nbx] < 0) Cache[nby][nbx] =
        NbRoutes(nbx - 1, nby) + NbRoutes(nbx, nby - 1);
    if (DEBUG_MODE) print("Cache[$nby][$nbx]=${Cache[nby][nbx]}");
    return Cache[nby][nbx];
  }
  return NbRoutes(GridSizeX,GridSizeY);
}

void main() {
  assert(Solve(2,2) == 6);

  DateTime creationTime = new DateTime.now();
  int res = Solve(GRID_SIZE_X,GRID_SIZE_Y);
  print('Number of routes on a $GRID_SIZE_X x $GRID_SIZE_Y grid: $res');
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
