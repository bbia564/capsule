import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:time_capsule/db_capsule/db_capsule.dart';

import '../capsule_first/capsule_first_logic.dart';

class CapsuleSecondLogic extends GetxController {

  DBCapsule dbCapsule = Get.find();

  var count = 0.obs;

  cleanCapsuleData() async {
    Get.dialog(AlertDialog(
      title: const Text('Warm reminder'),
      content: const Text('Do you want to clean all records?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel',style: TextStyle(color: Colors.black),),
        ),
        TextButton(
          onPressed: () async {
            await dbCapsule.cleanCapsuleData();
            getData();
            CapsuleFirstLogic firstLogic = Get.find();
            firstLogic.getData();
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }

  aboutCapusleUS(BuildContext context) async {
    var info = await PackageInfo.fromPlatform();
    showAboutDialog(
      applicationName: info.appName,
      applicationVersion: info.version,
      applicationIcon: Image.asset(
        'assets/launcher.webp',
        width: 76,
        height: 76,
      ),
      children: [
        const Text(
            """We can provide you with a time capsule"""),
      ],
      context: context,
    );
  }

  void getData() async {
    final result = await dbCapsule.getCapsuleItemAllData();
    count.value = result.length;
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
