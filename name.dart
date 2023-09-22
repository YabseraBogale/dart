import 'dart:io';

void main() {
  print("Enter you fist name");
  String? firstName = stdin.readLineSync();
  print("Enter last name");
  String? lastName = stdin.readLineSync();
  print("Your Name is $firstName $lastName");
}
