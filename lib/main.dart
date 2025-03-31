import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:time_capsule/db_capsule/db_capsule.dart';
import 'package:time_capsule/pages/capsule_add/capsule_add_binding.dart';
import 'package:time_capsule/pages/capsule_add/capsule_add_view.dart';
import 'package:time_capsule/pages/capsule_first/capsule_first_binding.dart';
import 'package:time_capsule/pages/capsule_first/capsule_first_view.dart';
import 'package:time_capsule/pages/capsule_list/capsule_list_binding.dart';
import 'package:time_capsule/pages/capsule_list/capsule_list_view.dart';
import 'package:time_capsule/pages/capsule_second/capsule_second_binding.dart';
import 'package:time_capsule/pages/capsule_second/capsule_second_view.dart';
import 'package:time_capsule/pages/capsule_tab/capsule_tab_binding.dart';
import 'package:time_capsule/pages/capsule_tab/capsule_tab_view.dart';
import 'package:time_capsule/pages/no_network/no_network_binding.dart';
import 'package:time_capsule/pages/no_network/no_network_view.dart';

Color primaryColor = const Color(0xfff5902c);
Color bgColor = const Color(0xfff7f7f7);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBCapsule().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Times,
      initialRoute: '/capsuleTab',
      theme: ThemeData(
        useMaterial3: true,
        primaryColor: primaryColor,
        scaffoldBackgroundColor: bgColor,
        colorScheme: ColorScheme.light(
          primary: primaryColor,
        ),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.transparent,
          elevation: 0,
          scrolledUnderElevation: 0,
          centerTitle: true,
          titleTextStyle: TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.black,
            fontSize: 20,
          ),
        ),
        bottomNavigationBarTheme: BottomNavigationBarThemeData(
          selectedItemColor: primaryColor,
          selectedLabelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
          elevation: 0,
          backgroundColor: Colors.white,
        ),
        inputDecorationTheme: const InputDecorationTheme(
          border: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        cardTheme: const CardTheme(
          color: Colors.white,
          elevation: 0,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.all(Radius.circular(10)),
          ),
        ),
        dialogTheme: const DialogTheme(
          actionsPadding: EdgeInsets.only(right: 10, bottom: 5),
        ),
        dividerTheme: DividerThemeData(
          thickness: 1,
          color: Colors.grey[200],
        ),
      ),
    );
  }
}
List<GetPage<dynamic>> Times = [
  GetPage(name: '/noNetwork', page: () => NoNetworkPage(), binding: NoNetworkBinding()),
  GetPage(name: '/capsuleTab', page: () => CapsuleTabPage(), binding: CapsuleTabBinding()),
  GetPage(name: '/capsuleSecond', page: () => CapsuleSecondPage(), binding: CapsuleSecondBinding()),
  GetPage(name: '/capsuleList', page: () => CapsuleListPage(), binding: CapsuleListBinding()),
  GetPage(name: '/capsuleFirst', page: () => CapsuleFirstPage(), binding: CapsuleFirstBinding()),
  GetPage(name: '/capsuleAdd', page: () => CapsuleAddPage(), binding: CapsuleAddBinding()),
];