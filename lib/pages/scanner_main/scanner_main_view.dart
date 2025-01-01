import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'scanner_main_logic.dart';

class ScannerMainPage extends GetView<ScannerMainLogic> {
  Widget _item(int type, int index, BuildContext context) {
    final imageNames = [
      ['scanIcon0', 'scanIcon1'],
      ['createIcon0', 'createIcon1'],
      ['aboutIcon0', 'aboutIcon1'],
    ];
    final titles = [
      ['QR code scanning', 'Bar code scanning'],
      ['QR code create', 'Bar code create'],
      ['Create records', 'Version(1.0.0)']
    ];
    return Container(
      width: double.infinity,
      height: 50,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      child: <Widget>[
        Image.asset(
          'assets/${imageNames[type][index]}.webp',
          width: 26,
          height: 26,
          fit: BoxFit.cover,
        ),
        const SizedBox(
          width: 10,
        ),
        Text(titles[type][index],
            style: const TextStyle(fontSize: 15, fontWeight: FontWeight.bold))
      ].toRow(),
    )
        .decorated(
            borderRadius: BorderRadius.circular(12),
            color: Colors.white,
            border: Border.all(color: const Color(0xffe5e5e5)))
        .marginOnly(bottom: 10)
        .gestures(onTap: () {
      switch (type) {
        case 0:
          Get.toNamed('/scanning',arguments: index);
          break;
        case 1:
          Get.toNamed('/creating',arguments: index);
          break;
        case 2:
          if (index == 0) {
              Get.toNamed('/create_records');
          } else {
              // controller.aboutScannerUS(context);
          }
          break;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            <Widget>[
              <Widget>[
                const Text(
                  'SCANNER',
                  style: TextStyle(fontSize: 32, fontWeight: FontWeight.bold),
                ),
                const Text('QR code & barcode')
              ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
              Image.asset(
                'assets/bg.webp',
                width: 114,
                height: 114,
                fit: BoxFit.cover,
              )
            ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
            const Text(
              'Scanning',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            _item(0, 0, context),
            _item(0, 1, context),
            const Text(
              'Create',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            _item(1, 0, context),
            _item(1, 1, context),
            const Text(
              'Other',
              style: TextStyle(fontSize: 15, fontWeight: FontWeight.bold),
            ),
            const SizedBox(
              height: 8,
            ),
            _item(2, 0, context),
            _item(2, 1, context),
          ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
        ).marginAll(15)),
      ),
    );
  }
}
