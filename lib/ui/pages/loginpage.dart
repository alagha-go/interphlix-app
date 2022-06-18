import 'package:flutter/material.dart';
import 'package:flutter_signin_button/button_list.dart';
import 'package:flutter_signin_button/button_view.dart';
import 'package:get/get.dart';
import 'package:interphlix/socket/login.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../main.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(()
        => Container(
          color: myTheme.value.primaryColor,
          child: Center(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                SignInButton(
                  padding: EdgeInsets.all(6),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(8)
                  ),
                  onPressed: getLoginUrl,
                  (myTheme.value.isDarkMode)
                      ? Buttons.Google
                      : Buttons.GoogleDark,
                  text: "Sign Up",
                ),
                SizedBox(
                  height: 30,
                ),
                SignInButton(
                  padding: EdgeInsets.all(6),
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(8)),
                  onPressed: getLoginUrl,
                  (myTheme.value.isDarkMode)?Buttons.Google:Buttons.GoogleDark,
                  text: "Log in",
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
