import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/driver/controller/status_controller.dart';
import 'package:tbs_logistics_dangtai/app/driver/model/status_driver_model.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:intl/intl.dart';

// ignore: must_be_immutable
class StatusDriverScreen extends GetView<StatusDriverCotroller> {
  bool showFormStatus = false;

  StatusDriverScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<StatusDriverCotroller>(
      init: StatusDriverCotroller(),
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
                print(items.giovao);
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
                                  arguments: [
                                    items.maPhieuvao,
                                    items.loaixeRe!.maLoaiXe,
                                  ],
                                );
                              }),
                            ],
                          ),
                        ),
                      );
              }
              return Center(
                child: Text(
                  "Tài xế chưa hoạt động !",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 20,
                  ),
                ),
              );
            },
          )),
    );
  }

  Widget _buildFormStatus(
      StatusDriverCotroller controller, Size size, StatusDriverModel items) {
    var length = items.trackingtime!.length;

    var day = DateFormat("yyy-MM-dd");
    return items.trackingtime != null
        ? SizedBox(
            height: size.width,
            child: Timeline(
              children: <TimelineModel>[
                length >= 1
                    ? TimelineModel(
                        SizedBox(
                          height: size.width * 0.2,
                          child: Column(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    "${items.trackingtime![0].statustracking!.name}",
                                    style: TextStyle(
                                      color:
                                          Colors.orangeAccent.withOpacity(0.8),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text("Ngày : ${day.format(
                                    DateTime.parse(
                                      items.trackingtime![0].thoigian
                                          .toString(),
                                    ),
                                  )}"),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text("Giờ : ${day.format(
                                    DateTime.parse(
                                      items.trackingtime![0].thoigian
                                          .toString(),
                                    ),
                                  )}"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        icon: const Icon(Icons.local_shipping,
                            color: Colors.white),
                        iconBackground: Colors.cyan,
                        position: TimelineItemPosition.left,
                      )
                    : TimelineModel(
                        Container(height: size.width * 0.2),
                        icon: const Icon(Icons.local_shipping,
                            color: Colors.white),
                        iconBackground: Colors.cyan,
                      ),
                length >= 2
                    ? TimelineModel(
                        SizedBox(
                          height: size.width * 0.2,
                          child: Column(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    "${items.trackingtime![1].statustracking!.name}",
                                    style: TextStyle(
                                      color:
                                          Colors.orangeAccent.withOpacity(0.8),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text("Ngày : ${day.format(
                                    DateTime.parse(
                                      items.trackingtime![1].thoigian
                                          .toString(),
                                    ),
                                  )}"),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text("Giờ : ${day.format(
                                    DateTime.parse(
                                      items.trackingtime![1].thoigian
                                          .toString(),
                                    ),
                                  )}"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        icon:
                            const Icon(Icons.meeting_room, color: Colors.white),
                        iconBackground: Colors.cyan,
                        position: TimelineItemPosition.right,
                      )
                    : TimelineModel(
                        Container(height: size.width * 0.2),
                        icon:
                            const Icon(Icons.meeting_room, color: Colors.white),
                        iconBackground: Colors.cyan,
                      ),
                length >= 3
                    ? TimelineModel(
                        SizedBox(
                          height: size.width * 0.2,
                          child: Column(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    "${items.trackingtime![2].statustracking!.name}",
                                    style: TextStyle(
                                      color:
                                          Colors.orangeAccent.withOpacity(0.8),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text("Ngày : ${day.format(
                                    DateTime.parse(
                                      items.trackingtime![2].thoigian
                                          .toString(),
                                    ),
                                  )}"),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text("Giờ : ${day.format(
                                    DateTime.parse(
                                      items.trackingtime![2].thoigian
                                          .toString(),
                                    ),
                                  )}"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        icon: const Icon(Icons.table_rows, color: Colors.white),
                        iconBackground: Colors.cyan,
                        position: TimelineItemPosition.left,
                      )
                    : TimelineModel(
                        Container(height: size.width * 0.2),
                        icon: const Icon(Icons.table_rows, color: Colors.white),
                        iconBackground: Colors.cyan,
                      ),
                length >= 4
                    ? TimelineModel(
                        SizedBox(
                          height: size.width * 0.2,
                          child: Column(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    "${items.trackingtime![3].statustracking!.name}",
                                    style: TextStyle(
                                      color:
                                          Colors.orangeAccent.withOpacity(0.8),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text("Ngày : ${day.format(
                                    DateTime.parse(
                                      items.trackingtime![3].thoigian
                                          .toString(),
                                    ),
                                  )}"),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text("Giờ : ${day.format(
                                    DateTime.parse(
                                      items.trackingtime![3].thoigian
                                          .toString(),
                                    ),
                                  )}"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        icon: const Icon(Icons.local_shipping,
                            color: Colors.white),
                        iconBackground: Colors.cyan,
                        position: TimelineItemPosition.right,
                      )
                    : TimelineModel(
                        Container(height: size.width * 0.2),
                        icon: const Icon(Icons.android, color: Colors.white),
                        iconBackground: Colors.cyan,
                      ),
                length >= 5
                    ? TimelineModel(
                        SizedBox(
                          height: size.width * 0.2,
                          child: Column(
                            children: [
                              Expanded(
                                child: Center(
                                  child: Text(
                                    "${items.trackingtime![4].statustracking!.name}",
                                    style: TextStyle(
                                      color:
                                          Colors.orangeAccent.withOpacity(0.8),
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text("Ngày : ${day.format(
                                    DateTime.parse(
                                      items.trackingtime![4].thoigian
                                          .toString(),
                                    ),
                                  )}"),
                                ),
                              ),
                              Expanded(
                                child: Center(
                                  child: Text("Giờ : ${day.format(
                                    DateTime.parse(
                                      items.trackingtime![4].thoigian
                                          .toString(),
                                    ),
                                  )}"),
                                ),
                              ),
                            ],
                          ),
                        ),
                        icon: const Icon(Icons.done, color: Colors.white),
                        iconBackground: Colors.cyan,
                        position: TimelineItemPosition.left,
                      )
                    : TimelineModel(
                        Container(height: size.width * 0.2),
                        icon: const Icon(Icons.done, color: Colors.white),
                        iconBackground: Colors.cyan,
                      ),
              ],
              // position: TimelinePosition.Left,
              iconSize: 40,
              lineColor: Colors.orangeAccent.withOpacity(0.4),
            ),
          )
        : Container();
  }

  Widget _buildStatus(Size size, StatusDriverCotroller controller,
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

  Widget _buildNameKH(StatusDriverCotroller controller, Size size,
      BuildContext context, StatusDriverModel items) {
    return items.taixeRe != null
        ? Container(
            height: 60,
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
                          child: Text(
                            "${items.taixeRe!.khachhangRe!.tenKhachhang}",
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
                            "Số điện thoại",
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
                            "${items.taixeRe!.khachhangRe!.phone}",
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

  Widget _buildNameCar(StatusDriverCotroller controller, Size size,
      BuildContext context, StatusDriverModel items) {
    return items.loaixeRe != null
        ? Container(
            height: 60,
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
    StatusDriverCotroller controllers,
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