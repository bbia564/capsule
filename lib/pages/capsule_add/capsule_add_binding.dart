import 'package:get/get.dart';

import 'capsule_add_logic.dart';

class CapsuleAddBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CapsuleAddLogic());
  }
}
