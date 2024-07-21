import 'package:symmetric_difference/symmetric_difference.dart';

void main(List<String> arguments) {
  var A = GiveRandom(5, 20);
  var B = GiveRandom(5, 20);
  print("set A: $A");
  print("set B: $B");
  print("the difference A - B ${A.difference(B)}");
  print("the difference B - A ${B.difference(A)}");
  var result = A.difference(B).union(B.difference(A));
  print("the result of A △ B $result");
}
