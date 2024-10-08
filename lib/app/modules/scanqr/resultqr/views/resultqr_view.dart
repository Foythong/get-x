import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:screen_brightness/screen_brightness.dart';

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
                    onPressed: () => Get.to(BrightnessControlScreen()),
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

class BrightnessControlScreen extends StatefulWidget {
  @override
  _BrightnessControlScreenState createState() =>
      _BrightnessControlScreenState();
}

class _BrightnessControlScreenState extends State<BrightnessControlScreen> {
  double?
      _currentDeviceBrightness; // ค่าความสว่างปัจจุบันในเครื่อง (จะดึงจากเครื่องจริง)

  @override
  void initState() {
    super.initState();
    _adjustBrightnessOnAppStart(); // เรียกใช้งานเมื่อเปิดแอป
  }

  // ฟังก์ชันสำหรับดึงค่าความสว่างปัจจุบันจากเครื่อง
  Future<void> _getCurrentDeviceBrightness() async {
    double currentBrightness = await ScreenBrightness().current;
    setState(() {
      _currentDeviceBrightness = currentBrightness; // ดึงค่าจากเครื่องจริง
    });
  }

  // ฟังก์ชันสำหรับปรับแสงให้สว่างสูงสุดเมื่อเปิดแอป
  Future<void> _adjustBrightnessOnAppStart() async {
    await _getCurrentDeviceBrightness(); // ดึงค่าความสว่างปัจจุบันของเครื่องก่อน
    await ScreenBrightness()
        .setScreenBrightness(1.0); // ตั้งค่าแสงเป็นสูงสุดในแอป
  }

  // ฟังก์ชันสำหรับรีเซ็ตค่าความสว่างกลับไปเป็นค่าของเครื่องเมื่อออกจากแอป
  Future<void> _resetBrightnessToDeviceSetting() async {
    if (_currentDeviceBrightness != null) {
      await ScreenBrightness().setScreenBrightness(
          _currentDeviceBrightness!); // ตั้งค่ากลับไปเป็นค่าความสว่างที่เครื่องตั้งไว้
    }
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () async {
        await _resetBrightnessToDeviceSetting(); // รีเซ็ตค่าความสว่างเมื่อกดกลับหรือปิดแอป
        return true;
      },
      child: Scaffold(
        appBar: AppBar(
          title: Text('Adjust Screen Brightness'),
        ),
        body: Center(
          child: _currentDeviceBrightness == null
              ? CircularProgressIndicator() // แสดงวงล้อโหลดขณะดึงค่าแสงจากเครื่อง
              : Text(
                  'Brightness is set to max. Current brightness: ${(_currentDeviceBrightness! * 100).round()}%',
                ),
        ),
      ),
    );
  }
}
