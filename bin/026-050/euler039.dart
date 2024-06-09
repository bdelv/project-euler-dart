/*
Integer Right Triangles
https://projecteuler.net/problem=39

If p is the perimeter of a right angle triangle with integral length sides, 
{a, b, c}, there are exactly three solutions for p=120.
{20,48,52}, {24,45,51}, {30,40,50}
For which value of p<=1000 is the number of solutions maximised?
*/
import 'dart:core';

const problemNumber = 39;
bool debugMode = false;

int solve(int pMax) {
  int getNumSolutions(int perimeter) {
    // search for 2𝑥:𝑥2−1:𝑥2+1
    // a+b>=c
    // a<b<c (a not up to 1/3 of p)
    // a2+b2 = c2
    // a+b+c = p
    // 𝑏=𝑝2−2𝑎𝑝/2(𝑝−𝑎).
    int numSolutions = 0;
    for (int a = 1; a <= perimeter ~/ 3; a++) {
      int numerator = perimeter * perimeter - (2 * a * perimeter);
      int denominator = 2 * (perimeter - a);
      if (numerator % denominator == 0) {
        int b = numerator ~/ denominator;
        if ((a <= b) && (b < 1000)) {
          numSolutions += 1;
        }
      }
    }
    if (debugMode) {
      if (numSolutions > 0) print('solutions for p=$perimeter: $numSolutions');
    }
    return numSolutions;
  }

  assert(getNumSolutions(120) == 3);
  if (debugMode) {
    print('Value of p<=$pMax for which the number solutions i smaximized:');
  }
  int res = 0;
  int nbMax = 0;
  for (int p = 1; p <= pMax; p++) {
    int tmpRes = getNumSolutions(p);
    if (tmpRes > nbMax) {
      res = p;
      nbMax = tmpRes;
    }
  }
  return res;
}

void main() {
  assert(debugMode = true);

  DateTime startTime = DateTime.now();
  print(
      "Problem ${problemNumber.toString().padLeft(3, '0')}: Solution=${solve(1000)} (in ${DateTime.now().difference(startTime).inMilliseconds}ms)");
}
