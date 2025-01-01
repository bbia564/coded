import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:barcode_image/barcode_image.dart';
import 'package:image/image.dart';

class CreatingLogic extends GetxController {
  int type = Get.arguments;

  String content = '';

  void create() {
    if (content.isEmpty) {
      Fluttertoast.showToast(msg: 'Please input content');
      return;
    }
    try {
      final image = Image(width: 168, height: 168);
      fill(image, color: ColorRgb8(255, 255, 255));
      late Barcode barcode;
      switch (type) {
        case 0:
          barcode = Barcode.qrCode();
          break;
        case 1:
          barcode = Barcode.code128();
          break;
      }
      drawBarcode(image, barcode, content, font: arial24);
      Get.toNamed('/create_result', arguments: type, parameters: {'content': content});
    } catch (e) {
      Fluttertoast.showToast(msg: 'Code generation failure');
      return;
    }
  }
}
