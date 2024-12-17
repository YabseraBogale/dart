import 'package:sqlite3/sqlite3.dart';
import 'package:http/http.dart' as http;
//import 'package:html/parser.dart';

void main(List<String> arguments) async{
    try{
        final db=sqlite3.open("merkato.db");
        final result=db.select("select Link from Company where Link!='null'");
        for(final row in result){
          var website=await http.get(Uri.parse(row['Link']));
          if(website.statusCode!=200){
            print("Link: ${row['Link']}, statusCode: ${website.statusCode}");
          }else{
            print("Link: ${row['Link']}, statusCode: ${website.statusCode}");
          }
        }
    } catch(e){
      print(e);
    }
}
