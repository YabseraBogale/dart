import 'dart:io';
import 'package:sqlite3/sqlite3.dart';
import 'package:mailer/mailer.dart';
import 'package:mailer/smtp_server.dart';

void main(List<String> arguments) async{
  // the password is changed but this is great
  final smtpServer = SmtpServer(
    'smtp.gmail.com',
    username: 'cheretaaddis@gmail.com',
    password: 'zgzd xtlt emlc tzfb',
    port: 587,
    ignoreBadCertificate: true, // Optional, useful for self-signed certificates
    ssl: false,
    allowInsecure: true, // Useful for STARTTLS connections
  );
  final resume=File("resume.pdf");
  final db = sqlite3.open("gold.db");
  var index = await File("index.html").readAsString().then((String content) {
    return content;
  });

  final results = db.select("select * from userdata where Country='Angola' and Sent='not_sent' limit 10");
  for (final result in results) {

     final message = Message()
    ..from = Address("yabsera@frielvh.com", 'YabseraBogale')
    ..recipients.add(result['Email'])
    ..subject = 'YabseraBogale Software Developer'
    ..html = index.toString()
    ..attachments.add(FileAttachment(resume));

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
