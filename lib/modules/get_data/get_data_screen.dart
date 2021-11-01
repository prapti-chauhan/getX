import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/modules/get_data/get_data_controller.dart';

class GetData extends StatelessWidget {
  GetData({Key? key}) : super(key: key);

  final ctrl = Get.put(GetDataController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Database"),
      ),
      body: GetBuilder<GetDataController>(
        builder: (_){
          return SafeArea(
              child: ListView.builder(
                  itemCount: ctrl.userData.length,
                  itemBuilder: (_, index) {
                    print(ctrl.userData);
                    return Padding(
                        padding:
                        const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                        child: Column(
                          children: [
                            Text(ctrl.userData[index].email),
                            Text('${ctrl.userData[index].id}'),
                            Text(ctrl.userData[index].password),
                          ],
                        ));
                  }));
        },
      )
    );
  }
}
