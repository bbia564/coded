import 'package:flutter/services.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:share_plus/share_plus.dart';

class ScanResultLogic extends GetxController {

  String content = Get.arguments;


  void share() {
    Share.share(content);
  }

  void copy() {
    Clipboard.setData(ClipboardData(text: content));
    Fluttertoast.showToast(msg: 'Copy successfully');
  }

}
