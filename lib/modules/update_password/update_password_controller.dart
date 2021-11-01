import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/local/db.dart';
import 'package:getx_demo/modules/home/homescreen_controller.dart';
class UpdatePasswordController extends GetxController {
  HomeScreenController homeCtrl = Get.find();
  final TextEditingController rstPasswordController = TextEditingController();
  final TextEditingController rstCfPasswordController = TextEditingController();
  final TextEditingController oldPasswordController = TextEditingController();
  final GlobalKey<FormState> rstKey = GlobalKey<FormState>();

  var obscureText = false;

  rstButton(BuildContext context) {
    if (rstKey.currentState!.validate()) {
      DB().dao.updatePassword(
          rstPasswordController.text,
          rstPasswordController.text,
          homeCtrl.userData!.email);
      Navigator.pop(context);
      debugPrint('Reset');
    }
  }
}