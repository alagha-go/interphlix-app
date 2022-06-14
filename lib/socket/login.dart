import 'dart:convert';

import 'package:get/get.dart';
import 'package:interphlix/main.dart';
import 'package:interphlix/socket/main.dart';
import 'package:interphlix/ui/pages/code.dart';
import 'package:url_launcher/url_launcher.dart';

class LoginUrl {
  LoginUrl({
    required this.url,
  });

  String url;

  factory LoginUrl.fromRawJson(String str) =>
      LoginUrl.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory LoginUrl.fromJson(Map<String, dynamic> json) => LoginUrl(
        url: json["url"] == null ? null : json["url"],
      );

  Map<String, dynamic> toJson() => {
        "url": url,
      };
}

getLoginUrl() {
  String url;
  socket.emitWithAck("login-url", "", ack: (response) async {
    var data = await LoginUrl.fromRawJson(response);
    url = data.url;
    var uri = await Uri.parse(url);
    await launchUrl(uri);
    Get.to(CodePage());
  });
}

sendCode(String code) {
  myTheme.update((model) {
    model.codeLoading = true;
  });
  socket.emitWithAck("code", code, ack: (response) {
    myTheme.update((model) {
      model.codeLoading = false;
      model.codeError = response;
    });
  });
}
