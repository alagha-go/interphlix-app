import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:interphlix/controller/main.dart';
import 'package:interphlix/ui/navbar/appbar.dart';
import 'package:interphlix/ui/navbar/bottomnavbar.dart';
import 'package:interphlix/ui/pages/main.dart';

late final themeController;
late final myTheme;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init("Interphlix");
  themeController = Get.put(ThemeController());
  myTheme = themeController.theme;
  await initializeTheme();
  runApp(const Interphlix());
}

class Interphlix extends StatelessWidget {
  const Interphlix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(useMaterial3: true),
      home: Scaffold(
        appBar: MyAppBar(back: false),
        body: Pages[pageIndex.value],
        bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
