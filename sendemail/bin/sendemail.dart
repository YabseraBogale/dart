import 'dart:io';
import 'package:sqlite3/sqlite3.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

void main(List<String> arguments) async{
  final db = sqlite3.open("gold.db");
  var index = await File("index.html").readAsString().then((String content) {
    return content;
  });
  final smtpServer=gmail("cheretaaddis@gmail.com","zgzd xtlt emlc tzfb");
  final results = db.select("select * from userdata where Country='Angola' limit 10");
  for (final result in results) {
    print(result['Email']);
     final message = Message()
    ..from = Address("cheretaaddis@gmail.com", 'YabseraBogale')
    ..recipients.add("yabserapython@gmail.com")
    ..subject = 'YabseraBogale Software Developer'
    ..text = 'This is the plain text.\nThis is line 2 of the text part.'
    ..html = index.toString();

  try {
    final sendReport = await send(message, smtpServer);
    print('Message sent: ${sendReport.toString()}');
  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
  }
}
