import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/controller/tallyman_controller.dart';

import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';

class ListTeamOfTallyman extends StatefulWidget {
  const ListTeamOfTallyman({super.key});

  @override
  State<ListTeamOfTallyman> createState() => _ListTeamOfTallymanState();
}

class _ListTeamOfTallymanState extends State<ListTeamOfTallyman> {
  final String routes = "/LIST_TEAM_OF_TALLYMAN";
  @override
  Widget build(BuildContext context) {
    var day = DateFormat("dd-MM-yyyy");
    var hour = DateFormat("hh:mm a");
    Size size = MediaQuery.of(context).size;

    return GetBuilder<TallymanController>(
      init: TallymanController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.toNamed(Routes.TALLYMAN_PAGE);
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
              size: 25,
              color: Colors.white,
            ),
          ),
          title: const Text(
            "Danh sách đội làm hàng",
            style: CustomTextStyle.tilteAppbar,
          ),
          centerTitle: true,
          backgroundColor: CustomColor.backgroundAppbar,
        ),
        body: Container(
          decoration: const BoxDecoration(
            gradient: CustomColor.gradient,
          ),
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Obx(() {
            print(controller.listEmployAwait.value.chuaLam);
            return controller.listEmployAwait.value.chuaLam!.length == 0
                ? const Center(
                    child: Text("Không có đội làm hàng"),
                  )
                : ListView.builder(
                    itemCount: controller.listEmployAwait.value.chuaLam!.length,
                    itemBuilder: (context, index) {
                      return buildTitle(size, index, day, hour, controller);
                      // return Container();
                    },
                  );
          }),
        ),
      ),
    );
  }

  Widget buildTitle(Size size, int index, DateFormat day, DateFormat hour,
      TallymanController controller) {
    return InkWell(
      onTap: () {
        print(controller.listEmployAwait.value.chuaLam![index].thoiGianBatDau);
        controller.postListEmployee(
          maDoiLamHang:
              '${controller.listEmployAwait.value.chuaLam![index].maDoiLamHang}',
          maPhieuLamHang: int.parse(
            controller.listEmployAwait.value.chuaLam![index].id.toString(),
          ),
          routes: Routes.LIST_TEAM_DETAILS_OF_TALLYMAN,
          time: controller.listEmployAwait.value.chuaLam![index].thoiGianBatDau
              .toString(),
        );
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        height: 70,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          color: Colors.white,
          border: Border.all(width: 1, color: Colors.orangeAccent),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                color: Colors.amber,
                borderRadius: BorderRadius.circular(100),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              height: 40,
              width: 40,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "${index + 1}",
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 20,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Expanded(
              flex: 6,
              child: Container(
                padding: const EdgeInsets.only(left: 15),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            "${controller.listEmployAwait.value.chuaLam![index].soxe}",
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ],
                      ),
                    ),
                    Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            day.format(DateTime.parse(
                              controller.listEmployAwait.value.chuaLam![index]
                                  .thoiGianDuKienBatDau
                                  .toString(),
                            )),
                          ),
                          const SizedBox(width: 10),
                          Text(hour.format(DateTime.parse(
                            controller.listEmployAwait.value.chuaLam![index]
                                .thoiGianDuKienBatDau
                                .toString(),
                          ))),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                child: controller.listEmployAwait.value.chuaLam![index]
                            .thoiGianBatDau !=
                        null
                    ? Text(hour.format(DateTime.parse(
                        controller.listEmployAwait.value.chuaLam![index]
                            .thoiGianBatDau
                            .toString(),
                      )))
                    : const Text(
                        "Chưa làm hàng",
                        style: TextStyle(
                          fontSize: 16,
                        ),
                      ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
