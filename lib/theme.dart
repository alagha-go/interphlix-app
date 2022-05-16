import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
}

GetTheme(bool isDark) {
  return Theme(
      isDarkMode: isDark ? true.obs : false.obs,
      primaryColor: isDark ? Colors.black.obs : Colors.white.obs,
      secondaryColor: !isDark ? Colors.black.obs : const Color.fromARGB(255, 255, 255, 255).obs,
      actionColor: const Color.fromARGB(255, 169, 0, 199).obs,
	  );
}
