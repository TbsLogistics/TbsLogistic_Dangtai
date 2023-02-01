import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/controller/tallyman_controller.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/view/tallyman_screen.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';

class TallymanPage extends GetView<TallymanController> {
  const TallymanPage({super.key});
  final String routes = "/TALLYMAN_PAGE";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        title: Text(
          "Tallyman".tr,
          style: TextStyle(
            color: Theme.of(context).primaryColorLight,
          ),
        ),
        centerTitle: true,
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.TALLYMAN_SETTINGS);
            },
            icon: Icon(
              Icons.settings,
              color: Theme.of(context).primaryColorLight,
              size: 25,
            ),
          ),
        ],
      ),
      body: const TallymanScreen(),
    );
  }
}
