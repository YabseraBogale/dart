import 'dart:io';

import 'package:wikiapp/wikiapp.dart' as wikiapp;

void main(List<String> arguments) {
  final api =
      "https://en.wikipedia.org/w/api.php?format=json&action=query&generator=search&gsrnamespace=0&gsrlimit=10&prop=pageimages|extracts&pilimit=max&exintro&explaintext&exsentences=1&exlimit=max&gsrsearch=";

  stdin.readLineSync();
}
