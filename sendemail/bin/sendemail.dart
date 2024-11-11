import 'dart:io';

void main(List<String> arguments) {
  File("index.html").readAsString().then((String content) {
    print(content);
  });
}
