import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/list_employ_await.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/view/list_finished_working/controller/list_finished_working_controller.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/view/list_team_of_tallyman/controller/list_team_of_tallyman_controller.dart';

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

    return GetBuilder<ListTeamOfTallymanController>(
      init: ListTeamOfTallymanController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              Get.toNamed(Routes.TALLYMAN_PAGE);
            },
            icon: Icon(
              Icons.arrow_back_ios_new,
              size: 25,
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          title: Text(
            "Danh sách đội làm hàng",
            style: TextStyle(
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Container(
          width: size.width,
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: FutureBuilder<ListEmployAwaitModel>(
              future: controller.getEmployAwait(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var items = snapshot.data as ListEmployAwaitModel;
                  return items.chuaLam!.isEmpty
                      ? const Center(
                          child: Text(
                            "Chưa có đội làm hàng !",
                            style: TextStyle(
                              fontSize: 20,
                              color: Colors.green,
                            ),
                          ),
                        )
                      : ListView.builder(
                          itemCount: items.chuaLam!.length,
                          itemBuilder: (context, index) {
                            return buildTitle(
                                size, index, day, hour, controller, items);
                          },
                        );
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: Colors.orangeAccent,
                  ),
                );
              }),
        ),
      ),
    );
  }

  Widget buildTitle(Size size, int index, DateFormat day, DateFormat hour,
      ListTeamOfTallymanController controller, ListEmployAwaitModel items) {
    return InkWell(
      onTap: () {
        controller.postListEmployee(
          maDoiLamHang: '${items.chuaLam![index].maDoiLamHang}',
          maPhieuLamHang: int.parse(
            items.chuaLam![index].id.toString(),
          ),
          routes: Routes.LIST_TEAM_DETAILS_OF_TALLYMAN,
          time: items.chuaLam![index].thoiGianBatDau.toString(),
        );
      },
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.orangeAccent),
        ),
        margin: const EdgeInsets.only(bottom: 10),
        height: 60,
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  color: Colors.orangeAccent,
                  width: 1,
                ),
              ),
              margin: const EdgeInsets.symmetric(horizontal: 5),
              height: 30,
              width: 30,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Center(
                    child: Text(
                      "${index + 1}",
                      style: TextStyle(
                        color: Theme.of(context).primaryColor,
                        fontSize: 15,
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
                            "${items.chuaLam![index].soxe}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColorLight,
                              fontWeight: FontWeight.bold,
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
                            day.format(
                              DateTime.parse(
                                items.chuaLam![index].thoiGianDuKienBatDau
                                    .toString(),
                              ),
                            ),
                            style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            hour.format(
                              DateTime.parse(
                                items.chuaLam![index].thoiGianDuKienBatDau
                                    .toString(),
                              ),
                            ),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 4,
              child: Container(
                child: items.chuaLam![index].thoiGianBatDau != null
                    ? Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          const Text(
                            "Thời gian bắt đầu",
                            style: TextStyle(
                              color: Colors.green,
                              fontSize: 15,
                            ),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Text(
                            hour.format(
                              DateTime.parse(
                                items.chuaLam![index].thoiGianBatDau.toString(),
                              ),
                            ),
                            style: const TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          )
                        ],
                      )
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

  @override
  void dispose() {
    Get.delete<ListFinishedWorkingController>();
    super.dispose();
  }
}
