import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interphlix/main.dart';
import 'package:interphlix/ui/navbar/appbar.dart';
import 'package:interphlix/ui/pages/main.dart';

class SideBar extends StatelessWidget {
  const SideBar({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Scaffold(
      appBar: MyAppBar(back: false),
      body: Obx(
        () => Container(
          height: double.infinity,
          width: double.infinity,
          color: myTheme.value.primaryColor,
          child: Row(
            children: [
              Container(
                child: Column(
                  children: [
                    sideButton(Icons.home, "Home", width, 1),
                    sideButton(Icons.category, "Categories", width, 2),
                    sideButton(Icons.notifications, "Notifications", width, 3),
                    sideButton(Icons.featured_play_list, "Library", width, 4),
                  ],
                ),
              ),
              Expanded(child: Pages[pageIndex.value.index])
            ],
          ),
        ),
      ),
    );
  }

  sideButton(IconData icon, String title, double width, int index) {
    double limit = 950;
    return Obx(
      () => Card(
        elevation: 10,
        color: (pageIndex.value.index == index)
            ? Colors.purple
            : myTheme.value.primaryColor,
        child: ElevatedButton(
          style: ElevatedButton.styleFrom(
            primary: (pageIndex.value.index == index)
                ? Colors.purple
                : myTheme.value.primaryColor,
          ),
          onPressed: () {
            pageIndex.update((val) {
              val!.index = index;
            });
          },
          child: (width > limit
              ? Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Icon(icon),
                    Container(
                      color: (pageIndex.value.index == index)
                          ? Colors.purple
                          : myTheme.value.primaryColor,
                      width: (width > limit) ? 200 : 25,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Text(
                          title,
                          style: TextStyle(
                            color: (pageIndex.value.index == index)
                                ? Colors.white
                                : myTheme.value.secondaryColor,
                            fontSize: 20,
                          ),
                        ),
                      ),
                    )
                  ],
                )
              : Icon(icon)),
        ),
      ),
    );
  }
}
