import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_pref.dart';
import 'package:getx_demo/local/db.dart';
import 'package:getx_demo/models/user.dart';
import 'package:getx_demo/modules/home/homescreen.dart';
import 'package:getx_demo/modules/home/homescreen_controller.dart';
import 'package:getx_demo/modules/signup/signup_screen.dart';

class SignupController extends GetxController{
  final homeCtrl = Get.put(HomeScreenController());

  final GlobalKey<FormState> formStateKey = GlobalKey<FormState>();
  final TextEditingController passwordController = TextEditingController();
  final TextEditingController fnameController = TextEditingController();
  final TextEditingController lnameController = TextEditingController();
  final TextEditingController confirmPasswordController =
  TextEditingController();
  final TextEditingController emailController = TextEditingController();
  var obscureText = false;
  int radioValue = 0;

  Rx<RadioValue> val = (RadioValue.male).obs;

  submit(){
    if (formStateKey.currentState!.validate()) {
      final _user = Users(
        email: emailController.text,
        password: passwordController.text,
        confirmPassword:
        confirmPasswordController.text,
        gender: radioValue.toString(),
        fname: fnameController.text,
        lname: lnameController.text,
      );
      DB().dao.insertUser(_user);
      AppPref().email = emailController.text;

      DB().dao.retrieveEmail(AppPref().email).listen((event) {
        homeCtrl.userData = event;
        update();
      });

      Get.to(() => HomeScreen());
    }
  }
}