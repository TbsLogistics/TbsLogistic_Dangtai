import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/sercurity/view/qr_code_scanner.dart';
import 'package:tbs_logistics_dangtai/app/sercurity/view/sercurity_screen.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';
import 'package:tbs_logistics_dangtai/config/share_preferences/share_prefer.dart';

class SercurityPage extends StatefulWidget {
  const SercurityPage({super.key});

  @override
  State<SercurityPage> createState() => _SercurityPageState();
}

class _SercurityPageState extends State<SercurityPage> {
  final String routes = "/SERCURITY_PAGE";
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.backgroundAppbar,
        title: const Text(
          "Tbs Logistics",
          style: CustomTextStyle.tilteAppbar,
        ),
        centerTitle: true,
      ),
      drawer: Drawer(
        child: _drawer(),
      ),
      body: const SercurityScreen(),
    );
  }

  Widget _drawer() {
    return Container(
      decoration: const BoxDecoration(gradient: CustomColor.gradient),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            onTap: () {
              Get.to(() => const QrCodeScannerScreen());
            },
            leading: const Icon(Icons.qr_code_scanner_outlined),
            title: const Text(
              "QR Code Scanner",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
          ListTile(
            onTap: () {
              SharePerApi().postLogout();
            },
            leading: const Icon(Icons.logout_rounded),
            title: const Text(
              "Đăng xuất",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
