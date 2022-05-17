import 'package:flutter/material.dart';
import 'package:interphlix/theme.dart';

class MyAppBar extends StatelessWidget implements PreferredSizeWidget {
  final Size preferredSize;
  final bool back;
  MyAppBar({Key? key, required this.back})
      : preferredSize = Size.fromHeight(60.0),
        super(key: key);

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: myTheme.primaryColor.value,
      leading: back? 
      Padding(
        padding: EdgeInsets.all(8.0),
        child: myTheme.isDarkMode.value
        ?Image.asset("assets/icons/logo1.png")
        :Image.asset("assets/icons/logo.png"),
      ):IconButton(
        onPressed: (){},
        icon: Icon(Icons.arrow_back_ios, color: myTheme.secondaryColor.value,),
        ),
    );
  }
}
