import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:qr_flutter/qr_flutter.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';

class QrCodeScreen extends StatelessWidget {
  const QrCodeScreen({super.key});
  final String routes = "/QR_CODE_SCREEN";

  @override
  Widget build(BuildContext context) {
    var items = Get.arguments;
    // print("Mataixe : ${items["maTaixe"]}");
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: const Icon(Icons.arrow_back_ios_new),
        ),
        backgroundColor: CustomColor.backgroundAppbar,
        title: const Text(
          "QR Code",
          style: CustomTextStyle.tilteAppbar,
        ),
        centerTitle: true,
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Center(
            child: QrImage(
              data: '${items["maTaixe"]}',
              version: QrVersions.auto,
              size: size.width * 0.6,
            ),
          ),
        ],
      ),
    );
  }
}