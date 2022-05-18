import 'package:flutter/material.dart';
import 'package:interphlix/main.dart';
import 'package:get/get.dart';

import '../../controller/main.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size preferredSize;
  final bool back;
  MyAppBar({Key? key, required this.back})
      : preferredSize = Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => AppBar(
        backgroundColor: myTheme.value.primaryColor,
        leading: !back
            ? Padding(
                padding: EdgeInsets.all(8.0),
                child: myTheme.value.isDarkMode
                    ? Image.asset("assets/icons/logo1.png")
                    : Image.asset("assets/icons/logo.png"),
              )
            : IconButton(
                onPressed: () {},
                icon: Icon(
                  Icons.arrow_back_ios,
                  color: myTheme.value.secondaryColor,
                ),
              ),
        actions: [
          IconButton(
              onPressed: toggleTheme,
              splashRadius: 0.1,
              icon: myTheme.value.isDarkMode
                  ? Icon(Icons.wb_sunny_rounded,
                      color: myTheme.value.secondaryColor)
                  : Icon(Icons.brightness_2_sharp,
                      color: myTheme.value.secondaryColor),
                      ),
        ],
      ),
    );
  }
}
