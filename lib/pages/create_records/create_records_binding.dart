import 'package:get/get.dart';

import 'create_records_logic.dart';

class CreateRecordsBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => CreateRecordsLogic());
  }
}
