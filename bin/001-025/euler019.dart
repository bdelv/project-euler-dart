/*
Counting Sundays
https://projecteuler.net/problem=19

You are given the following information, but you may prefer to do some research for yourself.

    1 Jan 1900 was a Monday.

    Thirty days has September, April, June and November.
    All the rest have thirty-one,
    Saving February alone, Which has twenty-eight, rain or shine.

    And on leap years, twenty-nine.
    A leap year occurs on any year evenly divisible by 4,
    but not on a century unless it is divisible by 400.

How many Sundays fell on the first of the month during the twentieth century
(1 Jan 1901 to 31 Dec 2000)?
*/
const problemNumber = 19;
bool debugMode = false;

bool isLeapYear(int year) {
  if (year % 100 == 0) return (year % 400 == 0);
  return (year % 4 == 0);
}

int daysCountInMonth(int month, int year) {
  if ([1, 3, 5, 7, 8, 10, 12].contains(month)) {
    return 31;
  } else if ([4, 6, 9, 11].contains(month)) {
    return 30;
  } else {
    if (isLeapYear(year)) {
      return 29;
    } else {
      return 28;
    }
  }
}

int solve(int startingYear, int endingYear) {
  if (debugMode) {
    print(
        'Number of Sundays that fell on the first of the month between $startingYear and $endingYear:');
  }
  int currentDay = 0;
  int sundaysCount = 0;
  int currentYear;
  // Go to the StartingYear
  for (currentYear = 1900; currentYear < startingYear; currentYear++) {
    for (int month = 1; month <= 12; month++) {
      currentDay = (currentDay + daysCountInMonth(month, currentYear)) % 7;
    }
  }
  // Nb of Sundays between StartingYear and EndingYear
  for (; currentYear <= endingYear; currentYear++) {
    if (debugMode) {
      print(
          'Number of Sundays that fell on the first of the month during the year $currentYear: $currentDay');
    }
    for (int month = 1; month <= 12; month++) {
      if (currentDay == 6) sundaysCount++;
      currentDay = (currentDay + daysCountInMonth(month, currentYear)) % 7;
    }
  }
  return sundaysCount;
}

void main() {
  assert(debugMode = true);

  assert(isLeapYear(2000));
  assert(isLeapYear(2004));
  assert(!isLeapYear(1900));
  assert(!isLeapYear(2001));
  assert(daysCountInMonth(1, 1900) == 31);
  assert(daysCountInMonth(2, 1900) == 28);
  assert(daysCountInMonth(2, 2000) == 29);
  assert(daysCountInMonth(3, 1900) == 31);
  assert(daysCountInMonth(4, 1900) == 30);
  assert(daysCountInMonth(5, 1900) == 31);
  assert(daysCountInMonth(6, 1900) == 30);
  assert(daysCountInMonth(7, 1900) == 31);
  assert(daysCountInMonth(8, 1900) == 31);
  assert(daysCountInMonth(9, 1900) == 30);
  assert(daysCountInMonth(10, 1900) == 31);
  assert(daysCountInMonth(11, 1900) == 30);
  assert(daysCountInMonth(12, 1900) == 31);

  DateTime startTime = DateTime.now();
  print(
      "Problem ${problemNumber.toString().padLeft(3, '0')}: Solution=${solve(1901, 2000)} (in ${DateTime.now().difference(startTime).inMilliseconds}ms)");
}
