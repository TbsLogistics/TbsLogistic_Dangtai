import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/driver/controller/driver_controller.dart';
import 'package:tbs_logistics_dangtai/app/driver/view/driver_screen.dart';
import 'package:tbs_logistics_dangtai/app/driver/view/qr_code_screen.dart';
import 'package:tbs_logistics_dangtai/app/driver/view/settings_page.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';

class DriverPage extends StatefulWidget {
  const DriverPage({super.key});

  @override
  State<DriverPage> createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> {
  final String routes = "/DRIVER_PAGE";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<DriverController>(
      init: DriverController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: const Text(
            "TBS Logistic",
            style: CustomTextStyle.tilteAppbar,
          ),
          centerTitle: true,
          backgroundColor: CustomColor.backgroundAppbar,
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(
                  Routes.QR_CODE_SCREEN,
                );
              },
              icon: const Icon(
                Icons.qr_code_rounded,
                color: Colors.white,
                size: 25,
              ),
            ),
            const SizedBox(width: 5),
            IconButton(
              onPressed: () {
                Get.to(() => DriverSettings());
              },
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 25,
              ),
            ),
            const SizedBox(width: 15),
          ],
        ),
        body: const DriverScreen(),
      ),
    );
  }
}
