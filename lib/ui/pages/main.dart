import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interphlix/ui/pages/categoriespage.dart';
import 'package:interphlix/ui/pages/homepage.dart';

import 'loginpage.dart';

List<Widget> Pages = [LoginPage(), HomePage(), CategoriesPage()];

class PageIndex {
  int index;
  bool logedin;
  PageIndex({this.index = 0, this.logedin = false});
}
