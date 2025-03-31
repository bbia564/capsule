import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:time_capsule/main.dart';

import 'capsule_first_logic.dart';

class CapsuleFirstPage extends GetView<CapsuleFirstLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Capsule list'),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: <Widget>[
          Container(
            width: double.infinity,
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 6),
            child: <Widget>[
              const Icon(
                Icons.info,
                color: Color(0xfffaad14),
                size: 14,
              ),
              const SizedBox(
                width: 10,
              ),
              const Expanded(
                  child: Text(
                'Capsules can only be opened when they are finished',
                style: TextStyle(color: Color(0xfffaad14)),
              ))
            ].toRow(mainAxisAlignment: MainAxisAlignment.center),
          ).decorated(
              color: const Color(0xfffff3e6),
              borderRadius: BorderRadius.circular(10)),
          const SizedBox(
            height: 15,
          ),
          Expanded(
              child: Container(
            width: double.infinity,
            padding: const EdgeInsets.all(12),
            child: Obx(() {
              return controller.list.value.isEmpty
                  ? const Center(
                      child: Text('No data'),
                    )
                  : ListView.builder(
                      itemCount: controller.list.value.length,
                      itemBuilder: (_, index) {
                        final entity = controller.list.value[index];
                        return Container(
                          width: double.infinity,
                          height: 100,
                          child: <Widget>[
                            Expanded(
                                child: <Widget>[
                              <Widget>[
                                const Text(
                                  'End time',
                                  style: TextStyle(
                                      color: Colors.grey, fontSize: 12),
                                ),
                                Text(
                                  entity.endTimeStr,
                                  style: TextStyle(
                                      color: primaryColor,
                                      fontWeight: FontWeight.bold),
                                )
                              ].toColumn(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start)
                            ].toRow(
                                    mainAxisAlignment:
                                        MainAxisAlignment.center)),
                            Expanded(
                                child: Container(
                              alignment: Alignment.center,
                              child: Text(
                                entity.entity.title,
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontWeight: FontWeight.bold,
                                    fontSize: 29),
                              ),
                            ).decorated(
                              color: primaryColor,
                              borderRadius: const BorderRadius.only(
                                  topRight: Radius.circular(46),
                                  bottomRight: Radius.circular(46)),
                            ))
                          ].toRow(),
                        )
                            .decorated(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(50),
                                border:
                                    Border.all(color: primaryColor, width: 4))
                            .marginOnly(bottom: 10)
                            .gestures(onTap: () {
                          if (entity.endTimeOut) {
                            Get.toNamed('/capsuleAdd',
                                arguments: controller.list.value[index]);
                          }
                        });
                      });
            }),
          ).decorated(
                  color: Colors.white, borderRadius: BorderRadius.circular(20)))
        ].toColumn().marginAll(15)),
      ),
    );
  }
}
