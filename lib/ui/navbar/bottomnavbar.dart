import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:interphlix/main.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interphlix/ui/navbar/main.dart';
import 'package:interphlix/ui/pages/main.dart';

class BottomNavBar extends StatelessWidget {
  const BottomNavBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Obx((() => CurvedNavigationBar(
          color: myTheme.value.primaryColor,
          backgroundColor: myTheme.value.secondaryColor,
          items: BottomNavBarButtons,
          onTap: (index) {
            if (index >= Pages.length) {
              pageIndex.update((model) {
                model!.index = 0;
              });
              print(pageIndex.value.index);
            } else {
              pageIndex.update((model) {
                model!.index = index;
              });
            }
          },
        )));
  }
}

Widget BottomnavBarButton(icon, index) {
  return Padding(
      padding: const EdgeInsets.all(0),
      child: Obx((() => Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(50),
            ),
            elevation: 5,
            key: UniqueKey(),
            color: myTheme.value.secondaryColor,
            child: CircleAvatar(
              backgroundColor: Colors.transparent,
              radius: 20,
              child: Icon(
                icon,
                key: UniqueKey(),
                size: 30,
                color: myTheme.value.primaryColor,
              ),
            ),
          ))));
}
