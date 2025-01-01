import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scanner/db_scanner/db_scanner.dart';
import 'package:scanner/db_scanner/scanner_entity.dart';

class CreateRecordsLogic extends GetxController {

  DBScanner  dbScanner = Get.find<DBScanner>();

  var list = <ScannerEntity>[].obs;

  void getData() async {
    list.value = await dbScanner.getScannerAllData();
  }

  cleanScannerData() async {
    Get.dialog(AlertDialog(
      title: const Text('Warm reminder'),
      content: const Text('Do you want to clean all records?'),
      actions: [
        TextButton(
          onPressed: () {
            Get.back();
          },
          child: const Text('Cancel',style: TextStyle(color: Colors.black),),
        ),
        TextButton(
          onPressed: () async {
            await dbScanner.cleanScannerData();
            getData();
            Get.back();
          },
          child: const Text(
            'OK',
            style: TextStyle(color: Colors.red),
          ),
        ),
      ],
    ));
  }

  @override
  void onInit() {
    // TODO: implement onInit
    getData();
    super.onInit();
  }

}
