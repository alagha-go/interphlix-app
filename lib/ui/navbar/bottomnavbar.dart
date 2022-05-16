import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interphlix/theme.dart';
import 'package:interphlix/ui/navbar/main.dart';
import 'package:interphlix/ui/pages/main.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((() => CurvedNavigationBar(
          color: myTheme.secondaryColor.value,
          backgroundColor: myTheme.primaryColor.value,
          items: BottomNavBarButtons,
          onTap: (index) {
            pageIndex = index.obs;
          },
        )));
  }
}

Widget BottomnavBarButton(icon, index) {
  return Padding(
    padding: EdgeInsets.all(5),
    child: Card(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
        ),
        elevation: 5,
        key: UniqueKey(),
        color: myTheme.primaryColor.value,
        child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 20,
          child: Icon(
            icon,
            key: UniqueKey(),
            size: 30,
            color: myTheme.secondaryColor.value,
          ),
        ),
    ),
    );
}
