import 'package:get/get.dart';

import 'capsule_list_logic.dart';

class CapsuleListBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CapsuleListLogic());
  }
}
