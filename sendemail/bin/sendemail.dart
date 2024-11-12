import 'dart:io';
import 'package:sqlite3/sqlite3.dart';

void main(List<String> arguments) {
  final db = sqlite3.open("gold.db");
  File("index.html").readAsString().then((String content) {
    print(content);
  });
  final results =
      db.select("select * from userdata where Country='Angola' limit 10");
  for (final result in results) {
    print("${result['Email']} ${result['Sent']} ${result['Country']}");
  }
}
