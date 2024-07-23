import 'dart:convert';
import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  String api =
      "https://en.wikipedia.org/w/api.php?format=json&action=query&generator=search&gsrnamespace=0&gsrlimit=10&prop=pageimages|extracts&pilimit=max&exintro&explaintext&exsentences=1&exlimit=max&gsrsearch=";
  // print("Enter search item");
  // String? search = stdin.readLineSync();
  // final uri = api + search.toString().replaceAll(" ", "&");
  final uri = "${api}black";
  final httprequest = Uri.parse(uri);
  final httpinfo = await http.read(httprequest);
  final httpjson = json.decode(httpinfo) as Map<String, dynamic>;
  print(httpjson["query"]
      .toString()
      .replaceAll("{pages: ", "")
      .replaceAll("}}}", "}}"));
}
