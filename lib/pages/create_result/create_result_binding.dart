import 'package:get/get.dart';

import 'create_result_logic.dart';

class CreateResultBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateResultLogic());
  }
}
