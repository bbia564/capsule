import 'package:get/get.dart';

import 'capsule_second_logic.dart';

class CapsuleSecondBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CapsuleSecondLogic());
  }
}
