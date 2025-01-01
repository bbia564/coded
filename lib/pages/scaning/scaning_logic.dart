import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';
import 'package:mobile_scanner/mobile_scanner.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';

class ScaningLogic extends GetxController {

  int type = Get.arguments;

  final GlobalKey qrKey = GlobalKey(debugLabel: 'Scanner');
  QRViewController? qrViewController;
  final MobileScannerController mobileScannerController = MobileScannerController(
    torchEnabled: true,
  );

  void onQRViewCreated(QRViewController contro) {
    qrViewController = contro;
    contro.scannedDataStream.listen((scanData) async {
      if (scanData.code == null) {
        return;
      }
      final scanDataNum = int.tryParse(scanData.code!) ?? 0;
      if (scanDataNum > 0 && type == 0) {
        Fluttertoast.showToast(msg: 'Please select barcode scan code');
        return;
      }
      if (scanDataNum == 0 && type == 1) {
        Fluttertoast.showToast(msg: 'Please select QR code scanning');
        return;
      }
      Get.toNamed('/scan_result',arguments: scanData.code);
    });
  }

  void imageSelected() async {
    final picker = ImagePicker();
    try {
      final pickedFile = await picker.pickImage(source: ImageSource.gallery);
      if (pickedFile != null) {
        final imagePath = pickedFile.path;
        final BarcodeCapture? barcodes = await mobileScannerController.analyzeImage(
          imagePath,
        );
        final codeResult = barcodes?.barcodes.first.rawValue;
        if (codeResult != null) {
          final scanDataNum = int.tryParse(codeResult) ?? 0;
          if (scanDataNum > 0 && type == 0) {
            Fluttertoast.showToast(msg: 'Please select barcode scan code');
            return;
          }
          if (scanDataNum == 0 && type == 1) {
            Fluttertoast.showToast(msg: 'Please select QR code scanning');
            return;
          }
          Get.toNamed('/scan_result',arguments: codeResult);
        } else {
          Fluttertoast.showToast(msg: 'No useful information was scanned');
          return;
        }
      }
    } catch (e) {
      Fluttertoast.showToast(msg: 'Please check album permissions or select a new image');
      return;
    }
  }

}
