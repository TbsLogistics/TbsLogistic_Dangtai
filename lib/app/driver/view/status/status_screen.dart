import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/driver/controller/status_controller.dart';
import 'package:tbs_logistics_dangtai/app/driver/model/status_driver_model.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';
import 'package:tbs_logistics_dangtai/config/widget/custom_time_lines.dart';

import 'package:intl/intl.dart';

// ignore: must_be_immutable
class StatusDriverScreen extends GetView<StatusDriverController> {
  bool showFormStatus = false;

  StatusDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<StatusDriverController>(
      init: StatusDriverController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          title: Text(
            "Chi tiết trạng thái",
            style: TextStyle(
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          centerTitle: true,
          leading: IconButton(
            icon: Icon(
              Icons.arrow_back_ios_new,
              color: Theme.of(context).primaryColorLight,
            ),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: FutureBuilder(
          future: controller.getStatus(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var items = snapshot.data as StatusDriverModel;

              return items.trackingtime == null
                  ? const Center(
                      child: Text(
                        "Tài xế chưa hoạt động ! ",
                        style: TextStyle(
                          color: Colors.red,
                          fontSize: 22,
                        ),
                      ),
                    )
                  : Container(
                      padding: const EdgeInsets.symmetric(
                          vertical: 15, horizontal: 10),
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            _buildNameKH(controller, size, context, items),
                            SizedBox(
                              height: size.width * 0.05,
                            ),
                            _buildNameCar(controller, size, context, items),
                            SizedBox(
                              height: size.width * 0.05,
                            ),
                            _buildStatus(size, controller, context, items),
                            SizedBox(
                              height: size.width * 0.05,
                            ),
                            controller.showForm.value
                                ? _buildFormStatus(controller, size, items)
                                : Container(),
                            SizedBox(
                              height: size.width * 0.05,
                            ),
                            _buildButton(controller, size, () {
                              Get.toNamed(
                                Routes.REGISTER_OUT_SCREEN,
                                arguments: items,
                              );
                            }),
                          ],
                        ),
                      ),
                    );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.orangeAccent,
              ),
            );
          },
        ),
      ),
    );
  }

  Widget _buildFormStatus(
      StatusDriverController controller, Size size, StatusDriverModel items) {
    // ignore: unused_local_variable
    var length = items.trackingtime!.length;
    var day = DateFormat("yyy-MM-dd");
    var hour = DateFormat("hh:mm a");
    return items.trackingtime != null
        ? SizedBox(
            height: 80 * 4,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                CustomTimeLines(
                  contentLeft: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "Đã đăng tài",
                        style: TextStyle(
                          color: Colors.orangeAccent,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  contentRight: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Ngày : ${day.format(
                        DateTime.parse(
                          items.trackingtime![0].thoigian.toString(),
                        ),
                      )}"),
                      Text("Giờ : ${hour.format(
                        DateTime.parse(
                          items.trackingtime![0].thoigian.toString(),
                        ),
                      )}"),
                    ],
                  ),
                  image: const AssetImage("assets/timelines/result.png"),
                  height: 80,
                  colorLine: Colors.orangeAccent,
                ),
                CustomTimeLines(
                  contentLeft: items.trackingtime![1].thoigian != null
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: const [
                            Text(
                              "Đã vào cổng",
                              style: TextStyle(
                                color: Colors.orangeAccent,
                                fontSize: 16,
                              ),
                            ),
                          ],
                        )
                      : Container(),
                  contentRight: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      Text("Ngày : ${day.format(
                        DateTime.parse(
                          items.trackingtime![1].thoigian.toString(),
                        ),
                      )}"),
                      Text("Giờ : ${hour.format(
                        DateTime.parse(
                          items.trackingtime![1].thoigian.toString(),
                        ),
                      )}"),
                    ],
                  ),
                  image: items.trackingtime![1].thoigian == null
                      ? const AssetImage("assets/timelines/in_car.png")
                      : const AssetImage("assets/timelines/in_cared.png"),
                  height: 80,
                  colorLine: Colors.orangeAccent,
                ),
                CustomTimeLines(
                  contentLeft: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "Bắt đầu làm hàng",
                        style: TextStyle(
                          color: Colors.orangeAccent,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  contentRight: items.trackingtime!.length == 3
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Ngày : ${day.format(
                              DateTime.parse(
                                items.trackingtime![0].thoigian.toString(),
                              ),
                            )}"),
                            Text("Giờ : ${hour.format(
                              DateTime.parse(
                                items.trackingtime![0].thoigian.toString(),
                              ),
                            )}"),
                          ],
                        )
                      : Container(),
                  image: items.trackingtime!.length == 3
                      ? const AssetImage("assets/timelines/start_working.png")
                      : const AssetImage("assets/timelines/start_worked.png"),
                  height: 80,
                  colorLine: Colors.orangeAccent,
                ),
                CustomTimeLines(
                  contentLeft: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: const [
                      Text(
                        "Làm hàng xong",
                        style: TextStyle(
                          color: Colors.orangeAccent,
                          fontSize: 16,
                        ),
                      ),
                    ],
                  ),
                  contentRight: items.trackingtime!.length == 4
                      ? Column(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: [
                            Text("Ngày : ${day.format(
                              DateTime.parse(
                                items.trackingtime![0].thoigian.toString(),
                              ),
                            )}"),
                            Text("Giờ : ${hour.format(
                              DateTime.parse(
                                items.trackingtime![0].thoigian.toString(),
                              ),
                            )}"),
                          ],
                        )
                      : Container(),
                  image: items.trackingtime!.length == 4
                      ? const AssetImage("assets/timelines/finish.png")
                      : const AssetImage("assets/timelines/finished.png"),
                  height: 80,
                  colorLine: Colors.orangeAccent,
                ),
              ],
            ))
        : Container();
  }

  Widget _buildStatus(Size size, StatusDriverController controller,
      BuildContext context, StatusDriverModel items) {
    return items.trackingtime != null
        ? InkWell(
            onTap: () {
              controller.showFormStatus();
            },
            child: Container(
              height: 40,
              decoration: BoxDecoration(
                border: Border.all(
                  width: 1,
                  color: Colors.orangeAccent,
                ),
                borderRadius: BorderRadius.circular(15),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  Expanded(
                    flex: 4,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "Trạng thái :",
                          style: TextStyle(
                            color: Theme.of(context).primaryColorLight,
                            fontWeight: FontWeight.bold,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Text(
                          "${items.trackingtime![items.trackingtime!.length - 1].statustracking!.name}",
                          style: const TextStyle(
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Icon(
                          Icons.album_outlined,
                          color:
                              items.status == true ? Colors.green : Colors.red,
                        ),
                      ],
                    ),
                  ),
                  const Expanded(
                    flex: 1,
                    child: Center(
                      child: Icon(
                        Icons.arrow_drop_down_sharp,
                        size: 32,
                        color: Colors.orangeAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          )
        : Container();
  }

  Widget _buildNameKH(StatusDriverController controller, Size size,
      BuildContext context, StatusDriverModel items) {
    return items.taixeRe != null
        ? Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 1,
                color: Colors.orangeAccent,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Text(
                            "Tên khách hàng",
                            style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: items.taixeRe!.khachhangRe != null
                              ? Text(
                                  "${items.taixeRe!.khachhangRe!.tenKhachhang}",
                                  style: const TextStyle(
                                    fontSize: 16,
                                  ),
                                )
                              : const Text(""),
                        ),
                      )
                    ],
                  ),
                ),
                const VerticalDivider(
                  width: 1,
                  indent: 10,
                  endIndent: 10,
                  color: Colors.orangeAccent,
                  thickness: 1,
                ),
              ],
            ),
          )
        : Container();
  }

  Widget _buildNameCar(StatusDriverController controller, Size size,
      BuildContext context, StatusDriverModel items) {
    return items.loaixeRe != null
        ? Container(
            height: 80,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
              border: Border.all(
                width: 1,
                color: Colors.orangeAccent,
              ),
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Text(
                            "Loại xe",
                            style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Text(
                            "${items.loaixeRe!.tenLoaiXe}",
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                const VerticalDivider(
                  width: 1,
                  indent: 10,
                  endIndent: 10,
                  color: Colors.orangeAccent,
                  thickness: 1,
                ),
                Expanded(
                  child: Column(
                    children: [
                      Expanded(
                        flex: 2,
                        child: Center(
                          child: Text(
                            "Số xe",
                            style: TextStyle(
                              color: Theme.of(context).primaryColorLight,
                            ),
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Center(
                          child: Text(
                            "${items.phieuvao!.soxe}",
                            style: const TextStyle(
                              fontSize: 16,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ],
            ),
          )
        : Container();
  }

  Widget _buildButton(
    StatusDriverController controllers,
    Size size,
    VoidCallback onTap,
  ) {
    return InkWell(
      onTap: onTap,
      child: Container(
        height: size.width * 0.15,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.orangeAccent,
          ),
          borderRadius: BorderRadius.circular(15),
          color: Colors.white,
        ),
        child: const Center(
          child: Text(
            "Đăng ký phiếu ra",
            style: TextStyle(
              color: Colors.orangeAccent,
              fontSize: 20,
            ),
          ),
        ),
      ),
    );
  }
}
