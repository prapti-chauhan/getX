import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/modules/home/homescreen_controller.dart';
import 'package:getx_demo/modules/update_password/update_password_controller.dart';

class UpdatePassword extends StatelessWidget {
  UpdatePassword({Key? key}) : super(key: key);
  final ctrl = Get.put(UpdatePasswordController());
  final homeCtrl = Get.put(HomeScreenController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 20,
                color: Colors.black,
              )),
        ),
        body: Form(
          key: ctrl.rstKey,
          child: ListView(
            children: <Widget>[
              // header text
              const Padding(
                  padding: EdgeInsets.only(top: 15),
                  child: Center(
                    child: Text(
                      'Reset Password',
                      style: TextStyle(fontSize: 25),
                    ),
                  )),
              Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextFormField(
                    controller: ctrl.oldPasswordController,
                    validator: (value) => oldPsd(value!),
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Current Password',
                        hintText: 'Enter current password'),
                  )),
              // password input
              Padding(
                padding: const EdgeInsets.only(
                    left: 15.0, right: 15.0, top: 15, bottom: 0),
                child: rstPsdTxtField(
                    ctrl.rstPasswordController, context),
              ),
              // password input
              Padding(
                  padding: const EdgeInsets.only(
                      left: 15.0, right: 15.0, top: 15, bottom: 0),
                  child: TextFormField(
                    controller: ctrl.rstCfPasswordController,
                    validator: (value) => confirmPsdValidator(value!),
                    obscureText: true,
                    decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Confirm Password',
                        hintText: 'Enter secure password'),
                  )),

              // submit button
              Padding(
                  padding:
                      const EdgeInsets.only(top: 10, right: 100, left: 100),
                  child: ElevatedButton(
                    onPressed: () {
                      ctrl.rstButton(context);
                    },
                    child: const Text("Reset Password"),
                  )),
            ],
          ),
        ));
  }

  bool validateRstPassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  psdRstValidator(String value) {
    if (value.isEmpty) {
      return "Please enter valid input";
    }
    if (validateRstPassword(value)) {
      return null;
    } else {
      return "Password must contain capital letter, \nsmall letter,\nspecial character, \nnumber and \n8 characters long";
    }
  }

  oldPsd(String value) {
    psdRstValidator(value);
    if (ctrl.oldPasswordController.text !=
        homeCtrl.userData!.password) {
      return "Doesn't matches your current password!";
    } else {
      return null;
    }
  }

  psdMatch(String value) {
    psdRstValidator(value);
    if (ctrl.rstPasswordController.text ==
        ctrl.oldPasswordController.text) {
      return "Can't use previous password again!";
    } else {
      return null;
    }
  }

  rstPsdTxtField(TextEditingController controller, BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: (value) => psdMatch(value!),
      obscureText: ctrl.obscureText,
      decoration: const InputDecoration(
        labelText: "New password",
        hintText: "Enter a secure password",
        contentPadding: EdgeInsets.symmetric(vertical: 0, horizontal: 10),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(
            color: Colors.grey,
          ),
        ),
        border: OutlineInputBorder(borderSide: BorderSide(color: Colors.grey)),
      ),
    );
  }

  confirmPsdValidator(String value) {
    psdRstValidator(value);
    if (value != ctrl.rstPasswordController.text) {
      return "Password doesn't matches!";
    }
  }
}
