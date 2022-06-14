import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interphlix/socket/login.dart';

import '../../main.dart';

class CodePage extends StatelessWidget {
  CodePage({Key? key}) : super(key: key);

  final TextEditingController codeController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => Container(
            width: double.infinity,
            color: myTheme.value.primaryColor,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  myTheme.value.codeError,
                  style: TextStyle(color: Colors.red),
                ),
                SizedBox(
                  height: 20,
                ),
                SizedBox(
                  width: 300,
                  child: TextField(
                    controller: codeController,
                    decoration: InputDecoration(
                        border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        filled: true,
                        fillColor: myTheme.value.secondaryColor,
                        labelText: "4 digit Code",
                        labelStyle: const TextStyle(color: Colors.green)),
                  ),
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton.icon(
                  onPressed: () {
                    sendCode(codeController.text);
                  },
                  icon: (myTheme.value.codeLoading)
                      ? CircularProgressIndicator(
                          color: Colors.purple,
                        )
                      : Container(),
                  label: Text("submit"),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
