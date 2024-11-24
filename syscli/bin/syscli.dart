import 'dart:io';
void main() async{
  var result=await Process.run("git",["status"]);
  print(result.stdout);

}
