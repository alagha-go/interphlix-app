import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:interphlix/main.dart';
import 'package:interphlix/theme.dart' as themes;

final DB = GetStorage("Interphlix");

class ThemeController extends GetxController {
  final theme = themes.Theme().obs;
}

initializeTheme() {
  var dark = DB.read("darkmode");
  if (dark == null) {
    DB.write("darkmode", true);
    dark = true;
  }
  myTheme.value.isDarkMode = dark;
  updateTheme();
}

updateTheme() {
  myTheme.update((model) {
    model!.primaryColor = model.isDarkMode ? Colors.black : Colors.white;
    model.secondaryColor = !model.isDarkMode ? Colors.black : Colors.white;
  });
}

toggleTheme() async {
  myTheme.value.isDarkMode = await !myTheme.value.isDarkMode;
  await updateTheme();
  DB.write("darkmode", myTheme.value.isDarkMode);
}
