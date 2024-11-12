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
  final results = db.select("select * from userdata where Country='Angola' and Sent='not_sent' limit 10");
  for (final result in results) {

     final message = Message()
    ..from = Address("cheretaaddis@gmail.com", 'YabseraBogale')
    ..recipients.add(result['Email'])
    ..subject = 'YabseraBogale Software Developer'
    ..html = index.toString();

  try {
    final sendReport = await send(message, smtpServer);
    print("Message: ${sendReport.toString()}");
    final stmt=db.prepare("Update userdata set Sent='sent' where Email=(?)");
    stmt.execute(sendReport.mail.recipients);

  } on MailerException catch (e) {
    print('Message not sent.');
    for (var p in e.problems) {
      print('Problem: ${p.code}: ${p.msg}');
    }
  }
  }
}
