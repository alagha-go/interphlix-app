import 'dart:convert';

import 'package:get/get.dart';
import 'package:interphlix/main.dart';
import 'package:interphlix/socket/main.dart';
import 'package:interphlix/ui/pages/code.dart';
import 'package:url_launcher_platform_interface/url_launcher_platform_interface.dart';

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
  final UrlLauncherPlatform launcher = UrlLauncherPlatform.instance;
  String url;
  socket.emitWithAck("login-url", "", ack: (response) async {
    var data = await LoginUrl.fromRawJson(response);
    url = data.url;
    await launcher.launch(url,
        useSafariVC: false,
        useWebView: false,
        enableJavaScript: true,
        enableDomStorage: false,
        universalLinksOnly: false,
        headers: {
          // "User Agent": "Mozilla/5.0 (Linux; Android 8.0; Pixel 2 Build/OPD3.170816.012) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/93.0.4577.82 Mobile Safari/537.36"
        });
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
