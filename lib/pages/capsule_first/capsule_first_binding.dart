import 'package:get/get.dart';

import 'capsule_first_logic.dart';

class CapsuleFirstBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CapsuleFirstLogic());
  }
}
