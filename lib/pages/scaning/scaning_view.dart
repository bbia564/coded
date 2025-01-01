import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_code_scanner/qr_code_scanner.dart';
import 'package:styled_widget/styled_widget.dart';

import 'scaning_logic.dart';

class ScaningPage extends StatefulWidget {
  const ScaningPage({Key? key}) : super(key: key);

  @override
  State<ScaningPage> createState() => _ScaningPageState();
}

class _ScaningPageState extends State<ScaningPage> {
  ScaningLogic controller = Get.find<ScaningLogic>();

  @override
  void reassemble() {
    super.reassemble();
    if (Platform.isAndroid) {
      controller.qrViewController!.pauseCamera();
    } else if (Platform.isIOS) {
      controller.qrViewController!.resumeCamera();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        title: Text(
          controller.type == 0 ? 'QR code scanning' : 'Bar code scanning',
          style: const TextStyle(color: Colors.white),
        ),
        leading: const Icon(
          Icons.close,
          size: 28,
          color: Colors.white,
        ).gestures(onTap: () {
          Get.back();
        }),
        actions: [
          const Icon(
            Icons.image,
            size: 28,
            color: Colors.white,
          ).marginOnly(left: 20).gestures(onTap: () {
            controller.imageSelected();
          })
        ],
      ),
      body: GetBuilder<ScaningLogic>(builder: (_) {
        return Container(
          width: double.infinity,
          height: double.infinity,
          alignment: Alignment.bottomCenter,
          color: Colors.black,
          child: Stack(
            alignment: Alignment.bottomCenter,
            children: [
              SizedBox(
                  width: double.infinity,
                  height: double.infinity,
                  child: QRView(
                      key: controller.qrKey,
                      onQRViewCreated: controller.onQRViewCreated)),
              const Text(
                'Automatic code scanning',
                style: TextStyle(fontSize: 14, color: Colors.white),
              ).marginOnly(bottom: 15),
            ],
          ),
        );
      }),
    );
  }
}
