import 'package:get/get.dart';

import 'scan_result_logic.dart';

class ScanResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScanResultLogic());
  }
}
