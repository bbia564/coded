import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:package_info_plus/package_info_plus.dart';

class ScannerMainLogic extends GetxController {

  aboutScannerUS(BuildContext context) async {
    var info = await PackageInfo.fromPlatform();
    showAboutDialog(
      applicationName: info.appName,
      applicationVersion: info.version,
      applicationIcon: Image.asset(
        'assets/launcher.webp',
        width: 74,
        height: 74,
      ),
      children: [
        const Text(
            """We can provide you with QR code and barcode scanning and creation"""),
      ],
      context: context,
    );
  }

}
