import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:introduction_screen/introduction_screen.dart';

class IntroScreenController extends GetxController {
  final introKey = GlobalKey<IntroductionScreenState>();
  TextStyle bodyStyle = const TextStyle(fontSize: 19.0);
}
