import 'package:sqlite3/sqlite3.dart';
//import 'package:http/http.dart' as http;
//import 'package:html/parser.dart';

void main(List<String> arguments) async{

        final db=sqlite3.open("merkato.db");
        final result=db.select("select Link from Company where Link!='null'");
        var count=0;
        for(final row in result){
          print(row['Link']);
          count+=1;
          print(count);
        }

}
