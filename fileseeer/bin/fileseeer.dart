import 'dart:io';
import 'dart:async';
void main() async{

  var server=await HttpServer.bind(InternetAddress.loopbackIPv4,8080);
  List<WebSocket> clients=[];
  Timer.periodic(Duration(seconds: 5),(timer){
    for(var client in clients){
      client.add();
    }
  });
  await for (HttpRequest request in server){
    if(request.uri.path=="/ws" && WebSocketTransformer.isUpgradeRequest(request)){
      var socket=await WebSocketTransformer.upgrade(request);
      socket.listen(
             (message){
                for(var client in clients){
                  if(client!=socket){
                    client.add(message);
                  }
                }
            },
            onError: (error){
              print("Error: $error");
            }
      );

    } else{
      request.response.statusCode=HttpStatus.notFound;
      await request.response.close();
    }
  }

}
