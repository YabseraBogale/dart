import 'dart:io';
import 'package:shelf/shelf.dart';
import 'package:shelf_router/shelf_router.dart';
import 'package:shelf/shelf_io.dart' as shelf_io;
import 'package:shelf_static/shelf_static.dart';

void main(List<String> arguments) async {
  final router = Router();
  final staticHandler = createStaticHandler(
    "public",
    defaultDocument: "index.html",
  );
  router.get("/", (Request req) {
    return staticHandler(req);
  });
  router.post("/submit_form", (Request req) async {
    final body = await req.readAsString();
    final data = Uri.splitQueryString(body);
    print(data);
    return Response.ok(data["name"]);
  });
  final handler = Pipeline().addMiddleware(logRequests()).addHandler(router);
  final server = await shelf_io.serve(handler, InternetAddress.anyIPv4, 8080);
  print("Serving at http://${server.address.host}:${server.port}");
}
