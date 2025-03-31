import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:time_capsule/db_capsule/db_capsule.dart';
import 'package:time_capsule/pages/capsule_list/capsule_text_field.dart';

import '../../db_capsule/capsule_entity.dart';

class CapsuleListLogic extends GetxController {
  DBCapsule dbCapsule = Get.find();

  var list = <CapsuleEntity>[].obs;

  CapsuleEntity? selectedCapsule;

  void getData() async {
    list.value = await dbCapsule.getCapsuleAllData();
  }

  void addCapsuleData() async {
    print(11);
    String title = '';
    Get.dialog(AlertDialog(
      title: const Text(
        'Add capsule',
        textAlign: TextAlign.center,
      ),
      content: Container(
        width: double.infinity,
        height: 50,
        child: CapsuleTextField(
            maxLength: 3,
            value: title,
            textAlign: TextAlign.center,
            onChange: (v) {
              title = v;
            }),
      ).decorated(
          color: Colors.white,
          border: Border.all(color: const Color(0xffe6e6e6)),
          borderRadius: BorderRadius.circular(12)),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text(
            'Cancel',
            style: TextStyle(color: Colors.black45),
          ),
        ),
        TextButton(
          onPressed: () async {
            if (title.isEmpty) {
              Fluttertoast.showToast(msg: 'Please enter the title');
              return;
            }
            await dbCapsule.insertCapsule(CapsuleEntity(
              id: 0,
              createdTime: DateTime.now(),
              title: title,
            ));
            getData();
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
          ),
        ),
      ],
    ));
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }
}
