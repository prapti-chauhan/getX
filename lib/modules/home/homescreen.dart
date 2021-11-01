// ignore_for_file: must_be_immutable

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:getx_demo/common/app_pref.dart';

import 'package:getx_demo/modules/detail_api_screen/detail_api_screen.dart';
import 'package:getx_demo/modules/get_data/get_data_screen.dart';
import 'package:getx_demo/modules/home/homescreen_controller.dart';
import 'package:getx_demo/modules/login/login_screen.dart';
import 'package:getx_demo/modules/update_password/update_password_screen.dart';
import 'package:getx_demo/modules/update_profile/update_profile_screen.dart';

class HomeScreen extends StatelessWidget {
  final homeCtrl = Get.put(HomeScreenController());

  HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: DrawerMenu(),
      appBar: AppBar(
        title: const Text("HomeScreen"),
      ),
      body: GetBuilder<HomeScreenController>(
        builder: (_) {
          if (homeCtrl.apiList.isEmpty) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return ListView.builder(
              itemCount: homeCtrl.apiList.length,
              itemBuilder: (BuildContext context, int index) {
                return InkWell(
                  onTap: () {
                    // homeCtrl.detailApiData(homeCtrl.apiList[index].id);
                    Get.to(() => const DetailApiScreen(),
                        arguments: homeCtrl.apiList[index].id);
                  },
                  child: Card(
                    elevation: 5,
                    child: Column(
                      children: [
                        ListTile(
                          leading: Text(
                            'userId: ${homeCtrl.apiList[index].userId}',
                          ),
                          title: Text('id: ${homeCtrl.apiList[index].id}'),
                          subtitle:
                              Text('title: ${homeCtrl.apiList[index].title}'),
                          trailing: Text(
                            '${homeCtrl.apiList[index].completed}',
                            style: TextStyle(
                                color: homeCtrl.apiList[index].completed
                                    ? Colors.green
                                    : Colors.red),
                          ),
                        ),
                      ],
                    ),
                  ),
                );
              });
        },
      ),
    );
  }
}

class DrawerMenu extends StatelessWidget {
  DrawerMenu({Key? key}) : super(key: key);
  HomeScreenController homeCtrl = Get.find();

  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        padding: EdgeInsets.zero,
        children: [
          DrawerHeader(
              decoration: const BoxDecoration(
                color: Colors.blue,
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Icon(
                    Icons.account_circle,
                    size: 100,
                    color: Colors.white,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        homeCtrl.userData!.fname,
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        homeCtrl.userData!.lname,
                        style: const TextStyle(color: Colors.white),
                      ),
                      Text(
                        homeCtrl.userData!.email,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  )
                ],
              )),
          ListTile(
            leading: const Icon(
              Icons.password,
              color: Colors.blue,
            ),
            title: const Text('Update Password'),
            onTap: () {
              Get.to(() => UpdatePassword());
            },
          ),
          ListTile(
              leading: const Icon(
                Icons.switch_account_rounded,
                color: Colors.blue,
              ),
              title: const Text('Update Profile'),
              onTap: () {
                Get.to(() => UpdateProfile());
              }),
          ListTile(
            leading: const Icon(
              Icons.logout_rounded,
              color: Colors.blue,
            ),
            title: const Text('Logout'),
            onTap: () async {
              Get.offAll(LoginScreen());
              // loginCtrl.loginPasswordController.clear();
              // loginCtrl.loginEmailController.clear();
              AppPref().logout();
            },
          ),
          ListTile(
            leading: const Icon(
              Icons.check,
              color: Colors.blue,
            ),
            title: const Text('Get Data'),
            onTap: () async {
              Get.to(() => GetData());
            },
          )
        ],
      ),
    );
  }
}


/*

class UsersListView extends StatelessWidget {
  UsersListView({Key? key, required this.users}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return Expanded(
        child: StreamBuilder<List<Users>>(
        stream: DB().dao.retrieveUserAsStream(),
    builder: (_, snapshot) {
    if (!snapshot.hasData) return Container();

    final user = snapshot.requireData;


    //   },
    // ));
    }
  }


  class UsersListCell extends StatelessWidget {

  const UsersListCell({Key? key, required this.users}) : super(key: key);

  @override
  Widget build(BuildContext context) {
  return
  }
  }

*/
