import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:scanner/main.dart';
import 'package:scanner/pages/creating/scanner_text_field.dart';
import 'package:styled_widget/styled_widget.dart';

import 'creating_logic.dart';

class CreatingPage extends GetView<CreatingLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(controller.type == 0 ? 'QR code create' : 'Bar code create'),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: SingleChildScrollView(
          physics: const AlwaysScrollableScrollPhysics(),
          child: <Widget>[
            const Text(
              'Input content',
              style: TextStyle(color: Colors.black38),
            ),
            const SizedBox(
              height: 10,
            ),
            Container(
              width: double.infinity,
              padding: const EdgeInsets.all(15),
              child: ScannerTextField(
                  maxLength: 200,
                  maxLines: 8,
                  value: controller.content,
                  onChange: (value) {
                    controller.content = value;
                  }),
            ).decorated(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                border: Border.all(color: const Color(0xffe5e5e5))),
            const SizedBox(
              height: 30,
            ),
            Container(
              width: double.infinity,
              height: 50,
              alignment: Alignment.center,
              child: Text(controller.type == 0 ? 'QR code create' : 'Bar code create',
                  style: const TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                      fontWeight: FontWeight.bold)),
            )
                .decorated(
                    color: primaryColor,
                    borderRadius: BorderRadius.circular(12))
                .gestures(onTap: () {
                  controller.create();
            })
          ].toColumn(crossAxisAlignment: CrossAxisAlignment.start),
        ).marginAll(15)),
      ),
    );
  }
}
