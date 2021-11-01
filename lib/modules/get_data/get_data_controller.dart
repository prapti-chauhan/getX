import 'package:get/get.dart';
import 'package:getx_demo/local/db.dart';
import 'package:getx_demo/models/user.dart';

class GetDataController extends GetxController {
  List<Users> userData = [];

  @override
  void onInit() {
    DB().dao.retrieveUser().then((value) {
      userData = value;
      update();
      print(userData);
    });

    super.onInit();
  }

/*usersData() async{
    var data = await DB().dao.retrieveUser();
    userData = data;
    update();
    print(userData);
  }*/
}
