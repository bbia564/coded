import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'create_result_logic.dart';

class CreateResultPage extends GetView<CreateResultLogic> {
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
            child: GetBuilder<CreateResultLogic>(builder: (_) {
              return SingleChildScrollView(
                physics: const AlwaysScrollableScrollPhysics(),
                child: <Widget>[
                  const SizedBox(
                    height: 30,
                  ),
                  Container(
                    padding: const EdgeInsets.all(22),
                    child: controller.codeImage == null
                        ? const Center(
                      child: Text('Code generation failure'),
                    )
                        : Container(
                      width: 168,
                      height: 168,
                      child: Image.memory(
                        controller.codeImage!,
                        width: double.infinity,
                        height: double.infinity,
                      ),
                    ),
                  ).decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(15),
                      border: Border.all(color: const Color(0xffe5e5e5))),
                  const SizedBox(
                    height: 20,
                  ),
                  Container(
                    width: 200,
                    height: 50,
                    alignment: Alignment.center,
                    child: Text(controller.type == 0 ? 'Save QR code' : 'Save Bar code',
                        style: const TextStyle(
                            fontSize: 15,
                            color: Colors.white,
                            fontWeight: FontWeight.bold)),
                  )
                      .decorated(
                      color: Colors.black,
                      borderRadius: BorderRadius.circular(12))
                      .gestures(onTap: () {
                    controller.saveImage();
                  })
                ].toColumn(),
              );
            }).marginAll(15)),
      ),
    );
  }
}
