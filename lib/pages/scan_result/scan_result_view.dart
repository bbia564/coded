import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:styled_widget/styled_widget.dart';

import 'scan_result_logic.dart';

class ScanResultPage extends GetView<ScanResultLogic> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Scan Result'),
        backgroundColor: Colors.white,
      ),
      body: SizedBox(
        width: double.infinity,
        height: double.infinity,
        child: SafeArea(
            child: <Widget>[
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(12),
              alignment: Alignment.topLeft,
              child: Text(controller.content),
            ).decorated(
                color: Colors.white,
                border: Border.all(color: const Color(0xffe5e5e5)),
                borderRadius: BorderRadius.circular(12)),
          ),
          const SizedBox(
            height: 15,
          ),
          SizedBox(
            width: 200,
            child: <Widget>[
              InkWell(
                child: <Widget>[
                  const Icon(
                    Icons.share,
                    size: 25,
                    color: Colors.black,
                  ),
                  const Text(
                    'Share',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ].toColumn(),
                onTap: (){
                  controller.share();
                },
              ),
              InkWell(
                child: <Widget>[
                  const Icon(
                    Icons.copy,
                    size: 25,
                    color: Colors.black,
                  ),
                  const Text(
                    'Copy',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  )
                ].toColumn(),
                onTap: (){
                  controller.copy();
                },
              )
            ].toRow(mainAxisAlignment: MainAxisAlignment.spaceBetween),
          )
        ].toColumn().marginAll(15)),
      ),
    );
  }
}
