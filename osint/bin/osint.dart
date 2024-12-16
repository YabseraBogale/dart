import 'package:sqlite3/sqlite3.dart';
//import 'package:http/http.dart' as http;
//import 'package:html/parser.dart';

void main(List<String> arguments) async{
    try{
        final db=sqlite3.open("merkato.db");
        final result=db.select("select Link from Company where Link!='null'");
        for(final row in result){
          print(row['Link']);
        }
    } catch(e){
      print(e);
    }
}
