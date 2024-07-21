import 'dart:js_interop';
import 'dart:math';

void main(List<String> arguments) {
  var A = GiveRandom(5, 20);
  var B = GiveRandom(5, 20);
  var C = GiveRandom(5, 20);
  print("set A: $A");
  print("set B: $B");
  print("set C: $C");
  print("the difference A △ B ${A.difference(B)}");
  var result = C.difference(A.difference(B));
  print("the result of ( A △ B ) △ C $result");
}

Set GiveRandom(int LengthOfSet, int RangeOfNumber) {
  var RandomSetOfNumber = <int>{};
  for (int i = 0; i < LengthOfSet; i++) {
    RandomSetOfNumber.add(Random.secure().nextInt(RangeOfNumber));
  }
  return RandomSetOfNumber;
}
