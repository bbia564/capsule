import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_capsule/pages/capsule_add/capsule_add_view.dart';
import 'package:time_capsule/pages/capsule_first/capsule_first_logic.dart';
import 'package:time_capsule/pages/capsule_first/capsule_first_view.dart';
import 'package:time_capsule/pages/capsule_second/capsule_second_logic.dart';
import 'package:time_capsule/pages/capsule_second/capsule_second_view.dart';

import '../../main.dart';
import 'capsule_tab_logic.dart';

class CapsuleTabPage extends GetView<CapsuleTabLogic> {
  const CapsuleTabPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: PageView(
        physics: const NeverScrollableScrollPhysics(),
        controller: controller.pageController,
        children: [
          CapsuleFirstPage(),
          CapsuleAddPage(),
          CapsuleSecondPage()
        ],
      ),
      bottomNavigationBar: Obx(()=>_navCaBars()),
    );
  }

  Widget _navCaBars() {
    return BottomNavigationBar(
      items: [
        BottomNavigationBarItem(
          icon: Image.asset('assets/item0Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item0Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'List',
        ),
        BottomNavigationBarItem(
          icon: Icon(Icons.add_circle,color: primaryColor,size: 40,),
          label: 'Add',
        ),
        BottomNavigationBarItem(
          icon: Image.asset('assets/item1Grey.webp',width: 22,height: 22,fit: BoxFit.cover,),
          activeIcon: Image.asset('assets/item1Light.webp',width: 22,height: 22,fit: BoxFit.cover,),
          label: 'Setting',
        ),
      ],
      currentIndex: controller.currentIndex.value,
      onTap: (index) {
        if (index == 1) {
          Get.toNamed('/capsuleList')?.then((_) {
            CapsuleFirstLogic firstLogic = Get.find();
            firstLogic.getData();
            CapsuleSecondLogic secondLogic = Get.find();
            secondLogic.getData();
          });
        } else {
          controller.currentIndex.value = index;
          controller.pageController.jumpToPage(index);
        }
      },
    );
  }
}
