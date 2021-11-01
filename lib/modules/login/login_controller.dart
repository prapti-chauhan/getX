import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_pref.dart';
import 'package:getx_demo/local/db.dart';
import 'package:getx_demo/modules/home/homescreen.dart';

class LoginController extends GetxController {
  final TextEditingController loginPasswordController = TextEditingController();
  final TextEditingController loginEmailController = TextEditingController();

  final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
  var obscureText = false;

  persist(BuildContext context) async {
    if (loginKey.currentState!.validate()) {
      var check = await DB()
          .dao
          .checkLogin(loginEmailController.text, loginPasswordController.text);

      if (check != null) {
        AppPref().email = loginEmailController.text;
        Navigator.push(
            context, MaterialPageRoute(builder: (_) => HomeScreen()));
      } else {
        showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                  title: const Text("Error!"),
                  content: const Text("User doesn't exist!"),
                  actions: <Widget>[
                    ElevatedButton(
                        child: const Text("OK"),
                        onPressed: () {
                          Navigator.of(context).pop();
                        })
                  ]);
            });
      }
    }
  }
}
