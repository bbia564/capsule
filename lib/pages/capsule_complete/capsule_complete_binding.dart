import 'package:get/get.dart';

import 'capsule_complete_logic.dart';

class CapsuleCompleteBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
