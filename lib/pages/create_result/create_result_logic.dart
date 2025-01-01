
import 'package:get/get.dart';
import 'dart:typed_data';

import 'package:barcode_image/barcode_image.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image/image.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:permission_handler/permission_handler.dart';
import 'package:scanner/db_scanner/db_scanner.dart';

import '../../db_scanner/scanner_entity.dart';

class CreateResultLogic extends GetxController {

  DBScanner dbScanner = Get.find<DBScanner>();

  final int type = Get.arguments;
  final String content = Get.parameters['content'] ?? '';

  Uint8List? codeImage;

  void saveImage() async {
    if (codeImage == null) {
      Fluttertoast.showToast(msg: 'Code generation failure');
      return;
    }
    PermissionStatus status = await Permission.storage.status;
    if (status == PermissionStatus.granted) {
      Map result = await ImageGallerySaver.saveImage(codeImage!);
      if (result['isSuccess'] == true) {
        Fluttertoast.showToast(msg: 'Save to album successfully');
        return;
      }
    } else {
      status = await Permission.storage.request();
      if (status == PermissionStatus.granted) {
        Map result = await ImageGallerySaver.saveImage(codeImage!);
        if (result['isSuccess'] == true) {
          Fluttertoast.showToast(msg: 'Save to album successfully');
          return;
        }
      } else {
        Fluttertoast.showToast(msg: 'Please authorize and try again');
        return;
      }
    }

  }

  @override
  void onInit() async {
    // TODO: implement onInit
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
    codeImage = encodePng(image);
    await dbScanner.insertScanner(ScannerEntity(
      id: 0,
      createdTime: DateTime.now(),
      content: content,
      type: type,
      image: codeImage!,
    ));
    update();
    super.onInit();
  }


}
