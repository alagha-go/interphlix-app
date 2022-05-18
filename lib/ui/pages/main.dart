import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interphlix/ui/pages/categoriespage.dart';
import 'package:interphlix/ui/pages/homepage.dart';

List<Widget> Pages = [HomePage(), CategoriesPage()];


class PageIndex {
  int index;
  PageIndex({this.index = 0});
}
