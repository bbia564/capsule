import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:time_capsule/main.dart';
import 'package:time_capsule/pages/capsule_list/capsule_text_field.dart';

import '../../db_capsule/capsule_entity.dart';
import 'capsule_add_logic.dart';

class CapsuleAddPage extends GetView<CapsuleAddLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.entity.runtimeType == CapsuleEntity
            ? 'Capsule setting'
            : 'Capsule'),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: GetBuilder<CapsuleAddLogic>(builder: (_) {
          return SingleChildScrollView(
            physics: const AlwaysScrollableScrollPhysics(),
            child: <Widget>[
              <Widget>[
                Container(
                  width: double.infinity,
                  padding: const EdgeInsets.all(12),
                  child: <Widget>[
                    const Text(
                      'Start time',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      color: Colors.transparent,
                      height: 40,
                      child: <Widget>[
                        Expanded(
                          child: IgnorePointer(
                            child: CapsuleTextField(
                                hintText: 'Select start time',
                                padding: EdgeInsets.zero,
                                value: controller.startTimeStr,
                                onChange: (_) {

                                }),
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_right,
                          size: 25,
                          color: Colors.grey,
                        )
                      ].toRow(),
                    ).gestures(onTap: () {
                      if (controller.entity.runtimeType == CapsuleEntity) {
                        controller.selectTime(context);
                      }

                    }),
                    Divider(
                      height: 20,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'End time',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    Container(
                      color: Colors.transparent,
                      height: 40,
                      child: <Widget>[
                        Expanded(
                          child: IgnorePointer(
                            child: CapsuleTextField(
                                hintText: 'Select end time',
                                padding: EdgeInsets.zero,
                                value: controller.endTimeStr,
                                onChange: (_) {

                                }),
                          ),
                        ),
                        const Icon(
                          Icons.keyboard_arrow_right,
                          size: 25,
                          color: Colors.grey,
                        )
                      ].toRow(),
                    ).gestures(onTap: () {
                      if (controller.entity.runtimeType == CapsuleEntity) {
                        controller.selectTime(context, isStart: false);
                      }
                    }),
                    Divider(
                      height: 20,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    const Text(
                      'Content',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    IgnorePointer(
                      ignoring: controller.entity.runtimeType != CapsuleEntity,
                      child: CapsuleTextField(
                        maxLines: 6,
                        maxLength: 200,
                        padding: EdgeInsets.zero,
                        value: controller.content,
                        onChange: (v) {
                          controller.content = v;
                        },
                      ).marginOnly(top: 10),
                    ),
                    Divider(
                      height: 20,
                      color: Colors.grey.shade300,
                    ),
                    const SizedBox(
                      height: 15,
                    ),
                    Visibility(
                        visible: controller.entity.runtimeType == CapsuleEntity,
                        child: Container(
                          width: double.infinity,
                          height: 50,
                          alignment: Alignment.center,
                          child: const Text(
                            'Add capsule',
                            style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.bold,
                                color: Colors.white),
                          ),
                        )
                            .decorated(
                                color: primaryColor,
                                borderRadius: BorderRadius.circular(12))
                            .gestures(onTap: () {
                          controller.addCapsuleData();
                        }))
                  ]
                      .toColumn(crossAxisAlignment: CrossAxisAlignment.start)
                      .marginOnly(top: 60),
                )
                    .decorated(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20))
                    .marginOnly(top: 45),
                Align(
                  alignment: Alignment.center,
                  child: Container(
                    width: 90,
                    height: 90,
                    alignment: Alignment.center,
                    child: Text(
                      controller.title,
                      style: TextStyle(
                          color: primaryColor,
                          fontSize: 20,
                          fontWeight: FontWeight.bold),
                    ),
                  ).decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(45),
                      border: Border.all(color: primaryColor, width: 4)),
                )
              ].toStack()
            ].toColumn(),
          );
        }).marginAll(15)),
      ),
    );
  }
}
