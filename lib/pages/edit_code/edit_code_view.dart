import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'edit_code_logic.dart';

class TabBescView extends GetView<PageLogic> {
  const TabBescView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Obx(
          () => controller.prohaska.value
              ? const CircularProgressIndicator(color: Colors.orange)
              : buildError(),
        ),
      ),
    );
  }

  Widget buildError() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          IconButton(
            onPressed: () {
              controller.pdtxwesa();
            },
            icon: const Icon(
              Icons.restart_alt,
              size: 50,
            ),
          ),
        ],
      ),
    );
  }
}
