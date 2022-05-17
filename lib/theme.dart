import 'package:flutter/material.dart';

class Theme {
  bool isDarkMode;
  Color primaryColor;
  Color secondaryColor;
  Color actionColor;

  Theme({
    this.isDarkMode = true,
    this.primaryColor = Colors.black,
    this.secondaryColor = Colors.white,
    this.actionColor = Colors.purple,
  });
}
