import 'package:interphlix/main.dart';
import 'package:socket_io_client/socket_io_client.dart' as IO;

String token = "";

IO.Socket socket = IO.io(socketdomain, <String, dynamic>{
  "transports": ["websocket"],
  "autoConnect": false
});

Future ConnectSocket() async {
  var body;
  await socket.connect();
  socket.opts!.addAll(<String, dynamic>{
    "extraHeaders": {"Cookie": token}
  });
  socket.onConnect((data) => print("CONNECTED"));
  print(socket.connected);

  // listen fo endpoints
  socket.on("online", (data) => {print(data)});
}
