import 'dart:io';

void main(List<String> arguments) async {
  var file = File("pubspec.lock");
  var length = await file.length();
  print(length);
}
