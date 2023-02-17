import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/driver/controller/driver_controller.dart';
import 'package:tbs_logistics_dangtai/app/driver/view/driver_screen.dart';
import 'package:tbs_logistics_dangtai/app/driver/view/settings/settings_page.dart';

import 'package:tbs_logistics_dangtai/config/routes/pages.dart';

class DriverPage extends GetView<DriverController> {
  const DriverPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "TBS Logistic",
          style: TextStyle(
            color: Theme.of(context).primaryColorLight,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(
                Routes.QR_CODE_SCREEN,
              );
            },
            icon: Icon(
              Icons.qr_code_rounded,
              color: Theme.of(context).primaryColorLight,
              size: 25,
            ),
          ),
          const SizedBox(width: 5),
          IconButton(
            onPressed: () {
              Get.to(() => const DriverSettings());
            },
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).primaryColorLight,
              size: 25,
            ),
          ),
          const SizedBox(width: 15),
        ],
      ),
      body: const DriverScreen(),
    );
  }
}
