import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/coordinators/model/ware_home_model.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/controller/tallyman_controller.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/view/ware_home/controller/warehome_controller.dart';

import 'package:tbs_logistics_dangtai/config/routes/pages.dart';

class TallymanWareHomeScreen extends GetView<TallymanController> {
  const TallymanWareHomeScreen({super.key});

  // final String routes = "/TALLYMAN_WAREHOME_SCREEN";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<WareHomeController>(
      init: WareHomeController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: Text(
            "Danh sách kho",
            style: TextStyle(
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 25,
              color: Theme.of(context).primaryColorLight,
            ),
          ),
        ),
        body: Container(
          width: size.width,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Expanded(
                flex: 1,
                child: FutureBuilder(
                  future: controller.getWareHome(),
                  builder: (context, snapshot) {
                    if (snapshot.hasData) {
                      var items = snapshot.data as List<WareHomeModel>;
                      return ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return Card(
                              shape: const RoundedRectangleBorder(
                                side: BorderSide(
                                  color: Colors.orangeAccent,
                                ),
                              ),
                              child: ListTile(
                                onTap: () {
                                  Get.toNamed(
                                    Routes.TALLYMAN_DETAILS_WAREHOME_SCREEN,
                                    arguments: items[index],
                                  );
                                },
                                title: Text(
                                  "${items[index].tenKho}",
                                  style: TextStyle(
                                    color: Theme.of(context).primaryColorLight,
                                  ),
                                ),
                              ),
                            );
                          });
                    }
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.orangeAccent,
                      ),
                    );
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
