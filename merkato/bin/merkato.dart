import 'package:http/http.dart' as http;
import 'package:html/parser.dart';
void main() async{
  var a=[];
  final regx=RegExp(r"directory/\d+-",multiLine: true);
 for(var i=1;i<53;i++){
   try{
     print("Number of links collected ${a.length} and i at $i");
     if(i==1){
       var merkato=await http.get(Uri.parse("https://www.2merkato.com/directory/"));
       if(merkato.statusCode==200){
         final document=parse(merkato.body);
         final links=document.querySelectorAll("h4");
         for(var link in links){
           if(regx.hasMatch(link.innerHtml)){
             a.add(link.innerHtml);
           }
         }
       } else{
         print("connection response ${merkato.statusCode}");
       }
     } else{
       var merkato=await http.get(Uri.parse("https://www.2merkato.com/directory/page:$i"));
       if(merkato.statusCode==200){
         final document=parse(merkato.body);
         final links=document.querySelectorAll("h4");
         for(var link in links){
           if(regx.hasMatch(link.innerHtml)){
             a.add(link.innerHtml);
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
for(var link in a){
  print(link);
}

}
