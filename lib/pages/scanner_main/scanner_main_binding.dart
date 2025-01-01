import 'package:get/get.dart';

import 'scanner_main_logic.dart';

class ScannerMainBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScannerMainLogic());
  }
}
