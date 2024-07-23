import 'dart:io';

import 'package:wikiapp/wikiapp.dart' as wikiapp;

void main(List<String> arguments) async {
  String api =
      "https://en.wikipedia.org/w/api.php?format=json&action=query&generator=search&gsrnamespace=0&gsrlimit=10&prop=pageimages|extracts&pilimit=max&exintro&explaintext&exsentences=1&exlimit=max&gsrsearch=";
  print("Enter search item");
  String? search = stdin.readLineSync();
  final uri = api + search.toString().replaceAll(" ", "&");
  final httprequest = Uri.parse(uri);
  final httpinfo = await http.read(httprequest);
  print(httpinfo);
}
