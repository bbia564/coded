import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scanner/db_scanner/db_scanner.dart';
import 'package:scanner/pages/create_records/create_records_binding.dart';
import 'package:scanner/pages/create_records/create_records_view.dart';
import 'package:scanner/pages/create_result/create_result_binding.dart';
import 'package:scanner/pages/create_result/create_result_view.dart';
import 'package:scanner/pages/creating/creating_binding.dart';
import 'package:scanner/pages/creating/creating_view.dart';
import 'package:scanner/pages/scan_result/scan_result_binding.dart';
import 'package:scanner/pages/scan_result/scan_result_view.dart';
import 'package:scanner/pages/scaning/scaning_binding.dart';
import 'package:scanner/pages/scaning/scaning_view.dart';
import 'package:scanner/pages/scanner_main/scanner_main_binding.dart';
import 'package:scanner/pages/scanner_main/scanner_main_view.dart';

Color primaryColor = Colors.black;
Color bgColor = const Color(0xfffafafa);

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(() => DBScanner().init());
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      debugShowCheckedModeBanner: false,
      getPages: Codes,
      initialRoute: '/scanner_main',
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

List<GetPage<dynamic>> Codes = [
  GetPage(name: '/scanner_main', page: ()  => ScannerMainPage(), binding: ScannerMainBinding()),
  GetPage(name: '/scanning', page: ()  => const ScaningPage(), binding: ScaningBinding()),
  GetPage(name: '/scan_result', page: ()  => ScanResultPage(), binding: ScanResultBinding()),
  GetPage(name: '/creating', page: ()  => CreatingPage(), binding: CreatingBinding()),
  GetPage(name: '/create_result', page: ()  => CreateResultPage(), binding: CreateResultBinding()),
  GetPage(name: '/create_records', page: ()  => CreateRecordsPage(), binding: CreateRecordsBinding()),
];