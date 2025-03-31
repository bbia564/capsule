import 'package:get/get.dart';
import 'package:time_capsule/db_capsule/capsule_entity.dart';
import 'package:time_capsule/db_capsule/db_capsule.dart';

class CapsuleFirstLogic extends GetxController {

  DBCapsule dbCapsule = Get.find();

  var list = <CapsuleItem>[].obs;

  void getData() async {
    list.value = await dbCapsule.getCapsuleItemAllData();
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
