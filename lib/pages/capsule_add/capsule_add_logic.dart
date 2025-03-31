import 'package:flutter/cupertino.dart';
import 'package:flutter_cupertino_datetime_picker/flutter_cupertino_datetime_picker.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:time_capsule/db_capsule/capsule_entity.dart';

import '../../db_capsule/db_capsule.dart';

class CapsuleAddLogic extends GetxController {
  DBCapsule dbCapsule = Get.find();

  final entity = Get.arguments;

  String title = '';
  DateTime? startTime;
  DateTime? endTime;
  String startTimeStr = '';
  String endTimeStr = '';
  String content = '';

  void selectTime(BuildContext context, {bool isStart = true}) {
    DatePicker.showDatePicker(context, dateFormat: 'yyyy/MM/dd',
        onConfirm: (date, list) {
      if (isStart) {
        if (endTime == null) {
          startTime = DateTime(date.year, date.month, date.day);
          startTimeStr = DateFormat('yyyy/MM/dd').format(date);
        } else {
          if (date.isAfter(endTime!)) {
            startTime = DateTime(date.year, date.month, date.day);
            startTimeStr = DateFormat('yyyy/MM/dd').format(date);
          } else {
            Fluttertoast.showToast(
                msg: 'The start time cannot be greater than the end time');
            return;
          }
        }
      } else {
        if (startTime == null) {
          endTime = DateTime(date.year, date.month, date.day, 23, 59, 59);
          endTimeStr = DateFormat('yyyy/MM/dd').format(date);
        } else {
          if (date.isAfter(startTime!)) {
            endTime = DateTime(date.year, date.month, date.day, 23, 59, 59);
            endTimeStr = DateFormat('yyyy/MM/dd').format(date);
          } else {
            Fluttertoast.showToast(
                msg: 'The end time cannot be less than the start time');
            return;
          }
        }
      }
      update();
    });
  }

  void addCapsuleData() async {
    if (startTime == null || endTime == null) {
      Fluttertoast.showToast(msg: 'Please select the start and end time');
      return;
    }
    if (content.isEmpty) {
      Fluttertoast.showToast(msg: 'Please enter the content');
      return;
    }
    await dbCapsule.insertCapsuleItem(CapsuleItem(
        id: 0,
        createdTime: DateTime.now(),
        entity: entity,
        startTime: startTime!,
        endTime: endTime!,
        content: content));
    Get.until((route) => route.settings.name == '/capsuleTab');
  }

  @override
  void onInit() {
    // TODO: implement onInit
    if (entity.runtimeType == CapsuleEntity) {
      final currentEntity = entity as CapsuleEntity;
      title = currentEntity.title;
    } else {
      final currentEntity = entity as CapsuleItem;
      title = currentEntity.entity.title;
      startTime = currentEntity.startTime;
      endTime = currentEntity.endTime;
      startTimeStr = DateFormat('yyyy/MM/dd').format(startTime!);
      endTimeStr = DateFormat('yyyy/MM/dd').format(endTime!);
      content = currentEntity.content;
    }
    update();
    super.onInit();
  }
}
