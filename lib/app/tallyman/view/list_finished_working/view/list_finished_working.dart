import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/list_employ_await.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/view/list_finished_working/controller/list_finished_working_controller.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';

class ListFinishedWorking extends GetView<ListFinishedWorkingController> {
  final String routes = "/LIST_FINISHED_WORKING";

  const ListFinishedWorking({super.key});
  @override
  Widget build(BuildContext context) {
    var day = DateFormat("dd-MM-yyyy");
    var hour = DateFormat("hh:mm a");
    Size size = MediaQuery.of(context).size;

    return GetBuilder<ListFinishedWorkingController>(
      init: ListFinishedWorkingController(),
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
            "Danh sách đội đã làm hàng",
            style: TextStyle(
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        ),
        body: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: FutureBuilder<ListEmployAwaitModel>(
              future: controller.getEmployAwait(),
              builder: (context, snapshot) {
                if (snapshot.hasData) {
                  var items = snapshot.data as ListEmployAwaitModel;
                  return ListView.builder(
                    itemCount: items.daLam!.length,
                    itemBuilder: (context, index) {
                      return buildTitle(
                          size, index, day, hour, controller, items, context);
                      // return Container();
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

  Widget buildTitle(
      Size size,
      int index,
      DateFormat day,
      DateFormat hour,
      ListFinishedWorkingController controller,
      ListEmployAwaitModel items,
      BuildContext context) {
    return InkWell(
      onTap: () {
        print(items.daLam![index].id.toString());
        controller.postDetailTicker(
            maPhieuLamHang: int.parse(
              items.daLam![index].id.toString(),
            ),
            routes: Routes.LIST_FINISHED_DETAILS_WORKING);
      },
      child: Container(
        margin: const EdgeInsets.only(bottom: 10),
        height: 70,
        width: size.width,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10),
          // color: Colors.white,
          border: Border.all(width: 1, color: Colors.orangeAccent),
        ),
        child: Row(
          children: [
            Container(
              decoration: BoxDecoration(
                // color: Colors.amber,
                border: Border.all(
                  color: Colors.orangeAccent,
                ),
                borderRadius: BorderRadius.circular(100),
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
                        color: Theme.of(context).primaryColorLight,
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
                            "${items.daLam![index].soxe}",
                            style: TextStyle(
                              fontSize: 16,
                              color: Theme.of(context).primaryColorLight,
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
                              items.daLam![index].thoiGianDuKienBatDau
                                  .toString(),
                            )),
                            style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                          const SizedBox(width: 10),
                          Text(
                            hour.format(
                              DateTime.parse(
                                items.daLam![index].thoiGianDuKienBatDau
                                    .toString(),
                              ),
                            ),
                            style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
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
              flex: 3,
              child: Container(
                child: items.daLam![index].thoiGianBatDau != null
                    ? Text(
                        hour.format(
                          DateTime.parse(
                            items.daLam![index].thoiGianKetThuc.toString(),
                          ),
                        ),
                        style: const TextStyle(
                          color: Colors.green,
                        ),
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
}
