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

const int START_YEAR = 1901;
const int END_YEAR = 2000;
const bool DEBUG_MODE = true;

bool IsLeapYear(int year) {
  if (year % 100 == 0) return (year % 400 == 0);
  return (year % 4 == 0);
}

int DaysInMonth(int month, int year) {
  if ([1, 3, 5, 7, 8, 10, 12].contains(month)) return 31;
  else if ([4, 6, 9, 11].contains(month)) return 30;
  else {
    if (IsLeapYear(year)) return 29;
    else return 28;
  }
  ;
}

int Solve(int StartYear, int EndYear) {
  int CurrentDay = 0;
  int NbSundays = 0;
  int CurrYear;
  // Go to the StartYear
  for (CurrYear = 1900; CurrYear < StartYear; CurrYear++)
    for (int month = 1; month <= 12; month++)
      CurrentDay = (CurrentDay + DaysInMonth(month, CurrYear)) % 7;
  // Nb of Sundays between StartYear and EndYear
  for (; CurrYear <= EndYear; CurrYear++) {
    if (DEBUG_MODE) print('Number of Sundays that fell on the first of the month during the year ${CurrYear}: ${CurrentDay}');
    for (int month = 1; month <= 12; month++) {
      if (CurrentDay == 6) NbSundays++;
      CurrentDay = (CurrentDay + DaysInMonth(month, CurrYear)) % 7;
    }
  }
  return NbSundays;
}

void main() {
  assert(IsLeapYear(2000));
  assert(IsLeapYear(2004));
  assert(!IsLeapYear(1900));
  assert(!IsLeapYear(2001));
  assert(DaysInMonth(1, 1900) == 31);
  assert(DaysInMonth(2, 1900) == 28);
  assert(DaysInMonth(2, 2000) == 29);
  assert(DaysInMonth(3, 1900) == 31);
  assert(DaysInMonth(4, 1900) == 30);
  assert(DaysInMonth(5, 1900) == 31);
  assert(DaysInMonth(6, 1900) == 30);
  assert(DaysInMonth(7, 1900) == 31);
  assert(DaysInMonth(8, 1900) == 31);
  assert(DaysInMonth(9, 1900) == 30);
  assert(DaysInMonth(10, 1900) == 31);
  assert(DaysInMonth(11, 1900) == 30);
  assert(DaysInMonth(12, 1900) == 31);

  DateTime creationTime = new DateTime.now();
  int res = Solve(START_YEAR,END_YEAR);
  print('Number of Sundays that fell on the first of the month between $START_YEAR and $END_YEAR: $res');
  DateTime finishTime = new DateTime.now();
  print('Elapsed time: ${finishTime.difference(creationTime)}');
}
