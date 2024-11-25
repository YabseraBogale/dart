import 'dart:io';
void main() async{
    var server=await HttpServer.bind(InternetAddress.loopbackIPv4,8080);
    List<WebSocket> clients=[];
    await for(HttpRequest request in server){
        if(request.uri.path=="/ws" && WebSocketTransformer.isUpgradeRequest(request)){
          var socket=await WebSocketTransformer.upgrade(request);
          clients.add(socket);
          socket.listen(
                 (message){
                  for(var client in clients){
                    if(client!=socket){
                      client.add(message);
                    }
                  }
                },
                onDone: (){
                  request.response.close();

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
