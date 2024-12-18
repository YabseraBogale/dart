import 'package:sqlite3/sqlite3.dart';
import 'package:http/http.dart' as http;
//import 'package:html/parser.dart';

void main(List<String> arguments) async{

        final db=sqlite3.open("merkato.db");
        final result=db.select("select Link from Company where Link!='null'");
        for(final row in result){

          try{
            var website=await http.get(Uri.parse(row['Link'].toString().replaceAll("www.","")));
            if(website.statusCode!=200){
              print("Link: ${row['Link']}, statusCode: ${website.statusCode}");
            }else{
              try{
                final stmt=db.prepare("Update Company Set ServerInfo=? where Link=?");
                stmt.execute([website.headers.toString(),row['Link']]);
              }catch(e){
                print(e);

              }
            }
          } catch(e){
            print(e);
          }
        }

}
