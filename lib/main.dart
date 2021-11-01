import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_pref.dart';
import 'package:getx_demo/local/db.dart';
import 'package:getx_demo/modules/splash/splashscreen.dart';

void main() {
  runApp(
    const MyApp(),
  );
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {



  @override
  Widget build(BuildContext context) {
    return const GetMaterialApp(
        debugShowCheckedModeBanner: false, home: SplashScreen());
  }

  @override
  void initState() {
    DB();
    AppPref();
    super.initState();
  }
}
