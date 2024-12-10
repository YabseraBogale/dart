import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
import 'package:sqlite3/sqlite3.dart';

void main() async{
  final db=sqlite3.open("merkato.db");
  final regx=RegExp(r"directory/\d+-",multiLine: true);
  final stmt=db.prepare("Insert into Company(CompanyName,CompanyLink,CompanyInformation) values(?,?,?)");
  for(var i=1;i<53;i++){
   try{
     print("Number of links collected at $i");
     if(i==1){
       var merkato=await http.get(Uri.parse("https://www.2merkato.com/directory/"));
       if(merkato.statusCode==200){

         final document=parse(merkato.body);
         final links=document.querySelectorAll("h4").map((a)=>a.innerHtml);

         for(var link in links){
           if(regx.hasMatch(link)){
              var companyName=parse(link).querySelectorAll("a").map((a)=>{a.text}).first.first;
              var companyLink=parse(link).querySelectorAll("a").map((a)=>{a.attributes['href']}).first.first;
              final content=await http.get(Uri.parse("https://www.2merkato.com$companyLink"));
              var companyInformation=parse(content.body)
                                          .querySelectorAll(".table-condensed")
                                          .map((a)=>a.text)
                                          .first
                                          .trim()
                                          .replaceAll("\n","")
                                          .replaceAll("\t","");
              stmt.execute([companyName,"https://www.2merkato.com$companyLink",companyInformation]);

           }
         }

       } else{
         print("connection response ${merkato.statusCode}");
       }
     } else{
       var merkato=await http.get(Uri.parse("https://www.2merkato.com/directory/page:$i"));
       if(merkato.statusCode==200){
         final document=parse(merkato.body);
         final links=document.querySelectorAll("h4").map((a)=>a.innerHtml);
         for(var link in links){
           if(regx.hasMatch(link)){
             var companyName=parse(link).querySelectorAll("a").map((a)=>{a.text}).first.first;
             var companyLink=parse(link).querySelectorAll("a").map((a)=>{a.attributes['href']}).first.first;
             final content=await http.get(Uri.parse("https://www.2merkato.com$companyLink"));
             var companyInformation=parse(content.body)
                                          .querySelectorAll(".table-condensed")
                                          .map((a)=>a.text)
                                          .first
                                          .trim()
                                          .replaceAll("\n","")
                                          .replaceAll("\t","");
             stmt.execute([companyName,"https://www.2merkato.com$companyLink",companyInformation]);

           }
         }
       } else{
         print("connection response ${merkato.statusCode}");
       }
     }
  } catch(e){
    print(e);
  }
}



}
