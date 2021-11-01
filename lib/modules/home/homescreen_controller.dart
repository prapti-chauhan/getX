// ignore_for_file: avoid_print

import 'dart:async';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_pref.dart';
import 'package:getx_demo/local/db.dart';
import 'package:getx_demo/models/compact_api.dart';
import 'package:getx_demo/models/todo.dart';
import 'package:getx_demo/models/user.dart';
import 'package:getx_demo/network/client.dart';

class HomeScreenController extends GetxController {
  Users? userData;
  Dio dio = Dio();
  List<Home> apiList = [];
  final List<StreamSubscription> _stream = [];
  List<DetailPage> detailApiDetails = [];
  List<Users> user = [];

  final clientData = Client();

  @override
  void onInit() {
    clientData.client.getList().then((value) {
      apiList = value;
      print(apiList);
    });



    print(AppPref().email);
    _stream.add(DB().dao.retrieveEmail(AppPref().email).listen((value) {
      userData = value;
      update();
    }));
    super.onInit();
  }

  @override
  void onClose() {
    // ignore: avoid_function_literals_in_foreach_calls
    _stream.forEach((element) => element.cancel());
    super.onClose();
  }

  getUserData() async {
    print(AppPref().email);
  }
}
