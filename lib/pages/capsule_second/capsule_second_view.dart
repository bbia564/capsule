import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'capsule_second_logic.dart';

class CapsuleSecondPage extends GetView<CapsuleSecondLogic> {
  Widget _item(int index, BuildContext context) {
    final titles = ['Clean capsules', 'About US'];
    return Container(
      color: Colors.transparent,
      height: 40,
      child: <Widget>[
        Text(titles[index]),
        <Widget>[
          Visibility(
            visible: index == 0,
            child: Obx(() {
              return Text(
                'Total ${controller.count.value}',
                style: const TextStyle(color: Colors.grey, fontSize: 14),
              );
            }),
          ),
          index == 0 ? const Icon(
            Icons.keyboard_arrow_right,
            size: 20,
            color: Colors.grey,
          ) : const Text("1.0.0",style: TextStyle(color: Colors.grey),).paddingOnly(right: 20)
        ].toRow(mainAxisAlignment: MainAxisAlignment.end)
      ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
    ).gestures(onTap: () {
      switch (index) {
        case 0:
          controller.cleanCapsuleData();
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Setting"),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            Container(
              padding: const EdgeInsets.all(12),
              child: <Widget>[_item(0, context), _item(1, context)].toColumn(
                  separator: Divider(
                height: 15,
                color: Colors.grey.withOpacity(0.3),
              )),
            ).decorated(
                color: Colors.white, borderRadius: BorderRadius.circular(12))
          ].toColumn(),
        ).marginAll(15)),
      ),
    );
  }
}
