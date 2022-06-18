import 'package:interphlix/controller/main.dart';
import 'package:interphlix/main.dart';
import 'package:interphlix/objects/cookie.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

String token = "";

IO.Socket socket = IO.io(socketdomain, <String, dynamic>{
  "transports": ["websocket"],
  "autoConnect": false
});

Future ConnectSocket() async {
  var data = await DB.read("token");
  if (data != null) {
    token = data;
  }
  loggedIn();
  await socket.connect();
  socket.opts!.addAll(<String, dynamic>{
    "extraHeaders": {"Cookie": token}
  });
  socket.onConnect((data) => print("CONNECTED"));
  print(socket.connected);

  // listen fo endpoints
  socket.on("online", (data) => {print(data)});
  socket.on("token", onLogin);
}

onLogin(data) async {
  Cookie cookie = Cookie.fromRawJson(data);
  await DB.write("token", cookie.value);
  await DB.write("logedin", true);
  loggedIn();
}

loggedIn() {
  dataHolder.update((val) async {
    var login = await DB.read("logedin");
    if (login == true) {
      val!.pageIndex.index = 1;
      val.pageIndex.logedin = true;
    }
  });
}
