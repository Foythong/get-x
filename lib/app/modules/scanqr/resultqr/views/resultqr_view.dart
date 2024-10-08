import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';

import '../controllers/resultqr_controller.dart';

class ResultqrView extends GetView<ResultqrController> {
  const ResultqrView({super.key, this.code, this.closeScreen});

  final String? code;
  final Function()? closeScreen;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Color(0xfffafafa),
        appBar: AppBar(
          title: const Text('QR Scanner'),
          centerTitle: true,
          leading: IconButton(
              onPressed: () {
                if (closeScreen != null) {
                  closeScreen!();
                }
                Get.back();
              },
              icon: Icon(Icons.arrow_back_ios_new_rounded)),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Padding(
            padding: const EdgeInsets.all(12.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                //show qr code

                QrImageView(
                  data: code ?? "",
                  size: 150,
                  version: QrVersions.auto,
                ),

                Text(
                  "Scanner result",
                  style: TextStyle(
                    color: Colors.black54,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                Text(
                  code ?? "",
                  style: TextStyle(
                    color: Colors.black87,
                    fontSize: 16,
                    letterSpacing: 1,
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
                SizedBox(
                  width: MediaQuery.of(context).size.width - 100,
                  height: 48,
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.blue,
                    ),
                    onPressed: () {},
                    child: Text(
                      "Copy",
                      style: TextStyle(
                        fontSize: 16,
                        letterSpacing: 1,
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
