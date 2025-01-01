import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'create_records_logic.dart';

class CreateRecordsPage extends GetView<CreateRecordsLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Create records'),
        backgroundColor: Colors.white,
        actions: [
          const Text(
            'Clean',
            style: TextStyle(fontWeight: FontWeight.bold),
          ).marginOnly(right: 20).gestures(onTap: () {
            controller.cleanScannerData();
          })
        ],
      ),
      body: SafeArea(child: Obx(() {
        return controller.list.value.isEmpty
            ? const Center(
                child: Text('No data'),
              )
            : ListView.builder(
                padding: const EdgeInsets.all(15),
                itemCount: controller.list.value.length,
                itemBuilder: (_, index) {
                  final entity = controller.list.value[index];
                  return Container(
                    width: double.infinity,
                    padding: const EdgeInsets.all(15),
                    child: <Widget>[
                      Expanded(child: Text(entity.content)),
                      const SizedBox(
                        width: 10,
                      ),
                      Image.memory(
                        entity.image,
                        width: 92,
                        height: 92,
                        fit: BoxFit.cover,
                      )
                    ].toRow(),
                  ).decorated(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: const Color(0xffe5e5e5))).marginOnly(bottom: 10);
                });
      })),
    );
  }
}
