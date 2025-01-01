import 'package:get/get.dart';

import 'scaning_logic.dart';

class ScaningBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ScaningLogic());
  }
}
