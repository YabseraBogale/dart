import 'package:http/http.dart' as http;

void main(List<String> arguments) async {
  final uri = Uri.https("google.com", "/");
  final req = await http.get(uri);
  print(req.statusCode);
}
