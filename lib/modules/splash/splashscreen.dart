import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/modules/splash/splash_controller.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return GetBuilder<SplashController>(
      init: SplashController(),
      builder: (_) {
        return const Scaffold(
          body: Center(
            child: FlutterLogo(
              size: 400,
            ),
          ),
        );
      },
    );
  }
}
