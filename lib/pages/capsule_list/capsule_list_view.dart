import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';
import 'package:time_capsule/main.dart';

import 'capsule_list_logic.dart';

class CapsuleListPage extends GetView<CapsuleListLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        title: const Text(
          'Add capsule',
          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18),
        ),
        actions: [
          Icon(
            Icons.add,
            size: 30,
            color: primaryColor,
          ).marginOnly(right: 20).gestures(onTap: () {
            controller.addCapsuleData();
          })
        ],
      ),
      body: GetBuilder<CapsuleListLogic>(builder: (_) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          padding: const EdgeInsets.all(15),
          child: SafeArea(
              child: <Widget>[
            Expanded(child: Obx(() {
              return controller.list.value.isEmpty
                  ? const Center(
                      child: Text('No data'),
                    )
                  : GridView.builder(
                      itemCount: controller.list.value.length,
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              mainAxisSpacing: 30,
                              crossAxisSpacing: 30),
                      itemBuilder: (_, index) {
                        final entity = controller.list.value[index];
                        return LayoutBuilder(builder: (_, max) {
                          return Container(
                            alignment: Alignment.center,
                            child: Text(
                              entity.title,
                              style: TextStyle(
                                  color: controller.selectedCapsule == entity
                                      ? primaryColor
                                      : const Color(0xffe0e0e0),
                                  fontSize: 22,
                                  fontWeight: FontWeight.bold),
                            ),
                          )
                              .decorated(
                                  color: Colors.white,
                                  borderRadius:
                                      BorderRadius.circular(max.maxWidth / 2),
                                  border: Border.all(
                                      width: 12,
                                      color:
                                          controller.selectedCapsule == entity
                                              ? primaryColor
                                              : const Color(0xffe0e0e0)))
                              .gestures(onTap: () {
                            controller.selectedCapsule = entity;
                            controller.update();
                          });
                        });
                      });
            })),
            const SizedBox(
              height: 15,
            ),
            Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.center,
              child: const Text(
                'Confirm',
                style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold,
                    color: Colors.white),
              ),
            )
                .decorated(
                    color: controller.selectedCapsule != null
                        ? primaryColor
                        : primaryColor.withOpacity(0.5),
                    borderRadius: BorderRadius.circular(12))
                .gestures(onTap: () {
              if (controller.selectedCapsule == null) {
                Fluttertoast.showToast(msg: 'Please select a capsule');
                return;
              }
              Get.toNamed('/capsuleAdd',
                  arguments: controller.selectedCapsule);
            })
          ].toColumn()),
        ).decorated(
            gradient: const LinearGradient(
                colors: [Color(0xfffffde6), Colors.white],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter));
      }),
    );
  }
}
