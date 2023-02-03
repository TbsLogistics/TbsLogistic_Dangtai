import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tbs_logistics_dangtai/app/driver/controller/driver_controller.dart';

class QrCodeScreen extends StatelessWidget {
  const QrCodeScreen({super.key});
  final String routes = "/QR_CODE_SCREEN";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<DriverController>(
      init: DriverController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            "QR Code",
            style: TextStyle(
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          centerTitle: true,
        ),
        body: Container(
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Center(
                child: QrImage(
                  backgroundColor: Colors.white,
                  data: "${controller.user.value.maTaixe}",
                  version: QrVersions.auto,
                  size: size.width * 0.6,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
