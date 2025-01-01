import 'package:get/get.dart';

import 'edit_code_logic.dart';

class EditCodeBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(
      PageLogic(),
      permanent: true,
    );
  }
}
