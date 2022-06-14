import 'dart:ffi';

import 'package:flutter/material.dart';

class Theme {
  bool isDarkMode;
  Color primaryColor;
  Color secondaryColor;
  bool codeLoading;
  String codeError;
  Color actionColor;

  Theme({
    this.isDarkMode = true,
    this.primaryColor = Colors.black,
    this.codeError = "",
    this.codeLoading = false,
    this.secondaryColor = Colors.white,
    this.actionColor = Colors.purple,
  });
}
