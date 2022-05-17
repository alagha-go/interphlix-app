import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:interphlix/theme.dart';
import 'package:interphlix/ui/navbar/bottomnavbar.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await GetStorage.init();
  await initializeTheme();
  runApp(const Interphlix());
}

class Interphlix extends StatelessWidget {
  const Interphlix({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        useMaterial3: true,
        backgroundColor: myTheme.primaryColor.value
        ),
      home: Scaffold(
        appBar: AppBar(),
        body: Container(
          color: myTheme.primaryColor.value,
        ),
		bottomNavigationBar: const BottomNavBar(),
      ),
    );
  }
}
