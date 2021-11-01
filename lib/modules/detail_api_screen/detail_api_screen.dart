import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/modules/home/homescreen_controller.dart';

class DetailApiScreen extends StatelessWidget {
  const DetailApiScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Details"),
      ),
      body: GetBuilder(
        builder: (HomeScreenController ctrl){
          if (ctrl.detailApiDetails.isEmpty) {
            return const Center(child: CircularProgressIndicator());
          }
          return ListView.builder(
            shrinkWrap: true,
            primary: false,
            itemCount: ctrl.detailApiDetails.length,
            padding: const EdgeInsets.all(0),
            itemBuilder: (context, index) => Padding(
              padding: const EdgeInsets.all(8.0),
              child: ListTile(
                title: Text(
                    "Name:- ${ctrl.detailApiDetails[index].name}"),
                subtitle: Text(
                    "Email:- ${ctrl.detailApiDetails[index].email}"),
              ),
            ),
          );
        },
      ),
    );

  }
}
