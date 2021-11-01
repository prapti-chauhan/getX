// ignore_for_file: must_be_immutable

import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'package:getx_demo/modules/login/login_screen.dart';
import 'package:getx_demo/modules/signup/signup_controller.dart';

enum RadioValue { male, female, other }

class Signup extends StatelessWidget {
  var ctrl = Get.put(SignupController());

  Signup({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.white,
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
      body: SafeArea(
        child: SingleChildScrollView(
          child: SizedBox(
              height: MediaQuery.of(context).size.height,
              width: double.infinity,
              child: Column(
                children: [
                  Column(
                    children: [
                      const Text(
                        "Sign up",
                        style: TextStyle(
                          fontSize: 30,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        "Create an Account,Its free",
                        style: TextStyle(
                          fontSize: 15,
                          color: Colors.grey[700],
                        ),
                      ),
                      const SizedBox(
                        height: 30,
                      )
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 40),
                    child: Form(
                        key: ctrl.formStateKey,
                        child: Column(
                          children: [
                            Column(
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller: ctrl.fnameController,
                                  validator: (value) => validator(value!),
                                  decoration: const InputDecoration(
                                    labelText: "First name",
                                    hintText: "Enter your first name here",
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 10,
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller: ctrl.lnameController,
                                  validator: (value) => validator(value!),
                                  decoration: const InputDecoration(
                                    labelText: "Last name",
                                    hintText: "Enter your last name here",
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller: ctrl.emailController,
                                  validator: (value) => emailValidator(value!),
                                  decoration: const InputDecoration(
                                    labelText: "Email-id",
                                    hintText: "Enter your email-id here",
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller: ctrl.passwordController,
                                  validator: (value) => psdValidator(value!),
                                  obscureText: ctrl.obscureText,
                                  decoration: const InputDecoration(
                                    labelText: "Password",
                                    hintText: "Enter a secure password",
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                )
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                const SizedBox(
                                  height: 5,
                                ),
                                TextFormField(
                                  controller: ctrl.confirmPasswordController,
                                  validator: (value) =>
                                      confirmPsdValidator(value!),
                                  obscureText: ctrl.obscureText,
                                  decoration: const InputDecoration(
                                    labelText: "Confirm password",
                                    contentPadding: EdgeInsets.symmetric(
                                        vertical: 0, horizontal: 10),
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Colors.grey,
                                      ),
                                    ),
                                    border: OutlineInputBorder(
                                        borderSide:
                                            BorderSide(color: Colors.grey)),
                                  ),
                                ),
                                const SizedBox(
                                  height: 5,
                                )
                              ],
                            ),
                            Obx(() => Row(
                                      children: [
                                        Radio(
                                            value: RadioValue.male,
                                            groupValue: ctrl.val.value,
                                            onChanged: (RadioValue? value) {
                                              ctrl.val.value = value!;
                                            }),
                                        const Text('Male'),
                                        Radio<RadioValue>(
                                          value: RadioValue.female,
                                          groupValue: ctrl.val.value,
                                          onChanged: (RadioValue? value) {
                                            ctrl.val.value = value!;
                                          },
                                        ),
                                        const Text("Female"),
                                        Radio<RadioValue>(
                                          value: RadioValue.other,
                                          groupValue: ctrl.val.value,
                                          onChanged: (RadioValue? value) {
                                            ctrl.val.value = value!;
                                          },
                                        ),
                                        const Text("Other"),
                                      ],
                                    ))
                          ],
                        )),
                  ),
                  Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 40),
                      child: Container(
                          padding: const EdgeInsets.only(top: 3, left: 3),
                          child: ElevatedButton(
                            onPressed: () {
                              ctrl.submit();
                              // debugPrint(email);
                            },
                            child: const Text('Submit'),
                          ))),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      TextButton(
                        onPressed: () {
                          Get.to(() => LoginScreen());
                        },
                        child: const Text(
                          "Already have an account? " "Login",
                          style: TextStyle(
                              fontWeight: FontWeight.w600, fontSize: 18),
                        ),
                      ),
                    ],
                  ),
                ],
              )),
        ),
      ),
    );
  }

  validator(String value) {
    if (value.isEmpty) {
      return "Please enter valid input";
    }
    if (value.trim() == '') {
      return "Only space is not allowed!!";
    }
  }

  bool validateEmail(String values) {
    String patterns =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExps = RegExp(patterns);
    return regExps.hasMatch(values);
  }

  emailValidator(String value) {
    if (value.isEmpty) {
      return "Please enter valid input";
    }
    if (validateEmail(value)) {
      return null;
    } else {
      return "Enter a valid email address";
    }
  }

  bool validatePassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  psdValidator(String value) {
    if (value.isEmpty) {
      return "Please enter valid input";
    }
    if (validatePassword(value)) {
      return null;
    } else {
      return "Password must contain capital letters, \nsmall letters,\nspecial characters, \nnumbers and \n8 characters long";
    }
  }

  confirmPsdValidator(String value) {
    psdValidator(value);
    if (value != ctrl.passwordController.text) {
      return "Password doesn't matches!";
    }
  }
}
