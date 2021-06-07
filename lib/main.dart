import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:giasu_vn/screen/home/home_screen.dart';
import 'package:sp_util/sp_util.dart';

import 'common/theme/app_colors.dart';


void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await SpUtil.getInstance();
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle(
      statusBarColor: AppColors.primary1574D0,
    ));

    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      enableLog: true,
      theme: ThemeData(
        brightness: Brightness.light,
      ),
      darkTheme: ThemeData(
        brightness: Brightness.dark,
      ),
      themeMode: ThemeMode.dark,
      // getPages: AppPages.routes,
      home: HomeScreen(),
    );
  }
}
