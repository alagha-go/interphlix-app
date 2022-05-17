import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

late Theme myTheme;

var DB = GetStorage();

class Theme {
  Rx<bool> isDarkMode;
  Rx<Color> primaryColor;
  Rx<Color> secondaryColor;
  Rx<Color> actionColor;

  Theme({
    required this.isDarkMode,
    required this.primaryColor,
    required this.secondaryColor,
    required this.actionColor,
  });

  toggleTheme() {
    if (this.isDarkMode.value == false) {
      this.isDarkMode = true.obs;
    } else {
      this.isDarkMode = false.obs;
    }
    DB.write("darkmode", this.isDarkMode.value);
  }
}

GetTheme(bool isDark) {
  return Theme(
    isDarkMode: isDark ? true.obs : false.obs,
    primaryColor: isDark ? Colors.black.obs : Colors.white.obs,
    secondaryColor: !isDark
        ? Colors.black.obs
        : const Color.fromARGB(255, 255, 255, 255).obs,
    actionColor: const Color.fromARGB(255, 169, 0, 199).obs,
  );
}

initializeTheme() {
  var dark = DB.read("darkmode");
  if (dark == null) {
    DB.write("darkmode", true);
    dark = true;
  }
  myTheme = GetTheme(dark);
}
