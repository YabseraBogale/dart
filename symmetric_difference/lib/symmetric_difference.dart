import 'dart:math';

int calculate() {
  return 6 * 7;
}

Set GiveRandom(int LengthOfSet, int RangeOfNumber) {
  var RandomSetOfNumber = <int>{};
  for (int i = 0; i < LengthOfSet; i++) {
    RandomSetOfNumber.add(Random.secure().nextInt(RangeOfNumber));
  }
  return RandomSetOfNumber;
}
