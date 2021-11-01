import 'package:get/get.dart';
import 'package:getx_demo/network/client.dart';

class DetailApiScreenController extends GetxController{
  List detailList = [];
  final clientData = Client();

  @override
  void onInit() {
    var id = Get.arguments as int ;
    clientData.client.getDetailList(id).then((value) {
      detailList = value;
      // ignore: avoid_print
      print(detailList);
    }
    );
    super.onInit();
  }
}