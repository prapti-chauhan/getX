import 'package:get/get.dart';
import 'package:getx_demo/common/app_pref.dart';

import 'package:getx_demo/modules/home/homescreen.dart';
import 'package:getx_demo/modules/intro/introscreen.dart';
import 'package:getx_demo/modules/login/login_screen.dart';

class SplashController extends GetxController {
  Future checkInstall() async {
    //String _isLogin = prefs.getString('email') ?? '';

    if (AppPref().seen) {
      if (AppPref().email.isEmpty) {
        Get.to(() => LoginScreen());
      } else {
        Get.to(() => HomeScreen());
      }
    } else {
      Get.to(() => const IntroScreen());
    }
  }

  @override
  void onReady() {
    Future.delayed(const Duration(seconds: 5), () {
      checkInstall();
      // Get.to(() =>  LoginScreen());
    });
  }
}
