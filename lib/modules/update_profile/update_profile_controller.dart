// ignore_for_file: avoid_single_cascade_in_expression_statements, avoid_print

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_pref.dart';
import 'package:getx_demo/local/db.dart';
import 'package:getx_demo/modules/home/homescreen.dart';
import 'package:getx_demo/modules/home/homescreen_controller.dart';

class UpdateProfileController extends GetxController {
  final homeCtrl = Get.put(HomeScreenController());
  final GlobalKey<FormState> rstFormStateKey = GlobalKey<FormState>();
  final TextEditingController rstFnameController = TextEditingController();
  final TextEditingController rstLnameController = TextEditingController();
  final TextEditingController rstEmailController = TextEditingController();


  @override
  void onInit() {
    super.onInit();
    updateControl();
  }

  updateControl() {
    rstFnameController..text = homeCtrl.userData!.fname;
    rstLnameController..text = homeCtrl.userData!.lname;
    rstEmailController..text = homeCtrl.userData!.email;
  }

  rstProfile( ) {
    if (rstFormStateKey.currentState!.validate()) {
      DB().dao.updateAccount(rstFnameController.text, rstLnameController.text,
          rstEmailController.text, homeCtrl.userData!.email);
      AppPref().email = rstEmailController.text;
      print(AppPref().email);
      DB().dao.retrieveEmail(AppPref().email).listen((event) {
        homeCtrl.userData = event;
        update();
      });
      Get.off(HomeScreen());
    }
  }
}
