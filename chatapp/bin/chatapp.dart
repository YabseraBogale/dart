import 'dart:io';

void main() async{
  var server= await HttpServer.bind(InternetAddress.anyIPv4,8080);
  print("server starting at localhost:${server.port}");
  List<WebSocket> clients=[];

  await for (HttpRequest request in server){
    if(request.uri.path=="/ws" && WebSocketTransformer.isUpgradeRequest(request)){
      WebSocket socket= await WebSocketTransformer.upgrade(request);
      clients.add(socket);
      print("Client connected: ${clients.length} total");
      socket.listen(
             (message){
               print("Recived $message");
              for(var client in clients){
                if(client!=socket){
                  client.add(message);
                }
              }

            },
            onDone: (){
              print("Client Disconnected");
              clients.remove(socket);
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
