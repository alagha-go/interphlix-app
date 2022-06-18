import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:interphlix/controller/main.dart';
import 'package:interphlix/socket/main.dart';
import 'package:interphlix/ui/navbar/appbar.dart';
import 'package:interphlix/ui/navbar/bottomnavbar.dart';
import 'package:interphlix/ui/pages/main.dart';

late final getxController;
String apisdomain = "https://apis.interphlix.com";
String socketdomain = "wss://apis.interphlix.com";
late final myTheme;
late final dataHolder;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init("Theme");
  getxController = Get.put(ThemeController());
  myTheme = getxController.theme;
  dataHolder = getxController.data;
  await initializeTheme();
  await ConnectSocket();
  await Future.delayed(Duration(milliseconds: 1000));
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
        body: Obx(()=> Pages[dataHolder.value.pageIndexvalue.index]),
        bottomNavigationBar: (dataHolder.value.pageIndexvalue.logedin)? BottomNavBar():null,
      ),
    );
  }
}
