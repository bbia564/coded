import 'package:get/get.dart';

import 'creating_logic.dart';

class CreatingBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreatingLogic());
  }
}
