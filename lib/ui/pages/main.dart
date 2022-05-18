import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:interphlix/ui/pages/homepage.dart';

List<Widget> Pages = [HomePage()];

Rx<int> pageIndex = 0.obs;

