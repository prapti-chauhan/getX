import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/modules/login/login_controller.dart';
import 'package:getx_demo/modules/signup/signup_screen.dart';

class LoginScreen extends StatelessWidget {
  final ctrl = Get.put(LoginController());

  LoginScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text("Login Page"),
      ),
      body: Row(
        children: [
          Expanded(
              child: SingleChildScrollView(
            child: Column(
              children: <Widget>[
                Form(
                    key: ctrl.loginKey,
                    child: Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 60.0),
                          child: Center(
                            child: SizedBox(
                                width: 200,
                                height: 150,
                                child: Image.asset('images/img2.png')),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: TextFormField(
                            validator: (value) => emailLoginValidator(value!),
                            controller: ctrl.loginEmailController,
                            decoration: const InputDecoration(
                                border: OutlineInputBorder(),
                                labelText: 'Email',
                                hintText:
                                    'Enter valid email id as abc@gmail.com'),
                          ),
                        ),
                        Padding(
                            padding: const EdgeInsets.only(
                                left: 15.0, right: 15.0, top: 15, bottom: 0),
                            //padding: EdgeInsets.symmetric(horizontal: 15),
                            child: TextFormField(
                              controller: ctrl.loginPasswordController,
                              validator: (value) => psdLoginValidator(value!),
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
                                    borderSide: BorderSide(color: Colors.grey)),
                              ),
                            )),
                        Padding(
                          padding: const EdgeInsets.only(top: 10),
                          child: Container(
                            height: 50,
                            width: 250,
                            decoration: BoxDecoration(
                                color: Colors.blue,
                                borderRadius: BorderRadius.circular(20)),
                            child: TextButton(
                              onPressed: () {
                                ctrl.persist(context);
                              },
                              child: const Text(
                                'Login',
                                style: TextStyle(
                                    color: Colors.white, fontSize: 25),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 130,
                        ),
                        TextButton(
                          onPressed: () {
                           Get.to(() => Signup());
                          },
                          child: const Text("Don't have an account?" "Sign Up"),
                        )
                      ],
                    ))
              ],
            ),
          ))
        ],
      ),
    );
  }

  /*bool validateEmail(String values) {
    String patterns =
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+";
    RegExp regExps = RegExp(patterns);
    return regExps.hasMatch(values);
  }*/

  emailLoginValidator(String value) {
    if (value.isEmpty) {
      return "Please enter valid input";
    }
    if (value.isEmail) {
      return null;
    } else {
      return "Enter a valid email address";
    }
  }

  bool validateLoginPassword(String value) {
    String pattern =
        r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$';
    RegExp regExp = RegExp(pattern);
    return regExp.hasMatch(value);
  }

  psdLoginValidator(String value) {
    if (value.isEmpty) {
      return "Please enter valid input";
    }
    if (validateLoginPassword(value)) {
      return null;
    } else {
      return "Password must contain capital letters, \nsmall letters,\nspecial characters, \nnumbers and \n8 characters long";
    }
  }
}
