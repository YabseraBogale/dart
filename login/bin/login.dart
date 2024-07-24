import 'dart:convert';

import 'package:http/http.dart' as http;

void main() async {
  final respone = await http.post(Uri.parse("https://stmu.edu.pk/wp-login.php"),
      headers: <String, String>{
        'Content-Type': 'application/x-www-form-urlencoded'
      },
      body: jsonEncode(<String, String>{"log": "admin", "pwd": "admin"}));
  print(respone);
}
