import 'package:get/get.dart';
import 'package:time_capsule/pages/capsule_first/capsule_first_logic.dart';

import '../capsule_second/capsule_second_logic.dart';
import 'capsule_tab_logic.dart';

class CapsuleTabBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CapsuleTabLogic());
    Get.lazyPut(() => CapsuleFirstLogic());
    Get.lazyPut(() => CapsuleSecondLogic());
  }
}
