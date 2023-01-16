import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'package:tbs_logistics_dangtai/app/tallyman/controller/tallyman_controller.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/view/settings/tallyman_settings_page.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/view/tallyman_screen.dart';

import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';

class TallymanPage extends GetView<TallymanController> {
  const TallymanPage({super.key});
  final String routes = "TALLYMAN_PAGE";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<TallymanController>(
      init: TallymanController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: Text(
              "Tallyman".tr,
              style: CustomTextStyle.tilteAppbar,
            ),
            centerTitle: true,
            backgroundColor: CustomColor.backgroundAppbar,
            actions: [
              IconButton(
                onPressed: () {
                  Get.toNamed(Routes.TALLYMAN_SETTINGS);
                },
                icon: const Icon(
                  Icons.settings,
                  color: Colors.white,
                  size: 25,
                ),
              ),
            ],
          ),
          body: const TallymanScreen(),
        );
      },
    );
  }
}
