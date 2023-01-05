import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/coordinators/controller/coordinator_controller.dart';
import 'package:tbs_logistics_dangtai/app/coordinators/model/ware_home_model.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';

class WareHomeSreen extends StatefulWidget {
  const WareHomeSreen({super.key});

  @override
  State<WareHomeSreen> createState() => _WareHomeSreenState();
}

class _WareHomeSreenState extends State<WareHomeSreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<CoordinatorController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text(
            "Danh sách kho",
            style: CustomTextStyle.tilteAppbar,
          ),
          backgroundColor: CustomColor.backgroundAppbar,
          centerTitle: true,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 25,
              color: Colors.white,
            ),
          ),
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: CustomColor.gradient,
          ),
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
                              child: ListTile(
                                onTap: () {
                                  Get.toNamed(Routes.DETAILS_WAREHOME_SCREEN,
                                      arguments: items[index]);
                                },
                                title: Text("${items[index].tenKho}"),
                                trailing: IconButton(
                                  onPressed: () {},
                                  icon: const Icon(
                                    // Icons.arrow_forward_ios_rounded,
                                    Icons.home,
                                    size: 25,
                                    color: Colors.black,
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
