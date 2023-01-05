import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/coordinators/controller/coordinator_controller.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';
import 'package:tbs_logistics_dangtai/config/model/list_traking_model.dart';
import 'package:tbs_logistics_dangtai/config/widget/sercurity/custom_list_title_registed.dart';

class CoordinatorListCarIn extends StatefulWidget {
  const CoordinatorListCarIn({super.key});

  @override
  State<CoordinatorListCarIn> createState() => _CoordinatorListCarInState();
}

class _CoordinatorListCarInState extends State<CoordinatorListCarIn> {
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CoordinatorController>(
      init: CoordinatorController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColor.backgroundAppbar,
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
          title: const Text(
            "Danh sách xe đã vào",
            style: CustomTextStyle.tilteAppbar,
          ),
          centerTitle: true,
          actions: [
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.qr_code_scanner),
            ),
            IconButton(
              onPressed: () {},
              icon: const Icon(Icons.search),
            ),
          ],
        ),
        body: FutureBuilder(
            future: controller.getListCarIn(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var items = snapshot.data as List<ListTrackingModel>;
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) => CustomListTitleRegisted(
                    stt: "${index + 1}",
                    name: "${items[index].taixeRe!.tenTaixe}",
                    phone: "${items[index].taixeRe!.phone}",
                    warehome: "${items[index].phieuvao!.kho}",
                    itemstype: "${items[index].loaihang!.tenLoaiHang}",
                    onTap: () {},
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.orangeAccent,
                ),
              );
            }),
      ),
    );
  }
}
