import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/driver/controller/driver_controller.dart';
import 'package:tbs_logistics_dangtai/app/driver/model/status_driver_model.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';
import 'package:intl/intl.dart';

class StatusDriverScreen extends StatefulWidget {
  const StatusDriverScreen({super.key});

  @override
  State<StatusDriverScreen> createState() => _StatusDriverScreenState();
}

class _StatusDriverScreenState extends State<StatusDriverScreen> {
  bool showFormStatus = false;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<DriverController>(
      init: DriverController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: CustomColor.backgroundAppbar,
          title: const Text(
            "Chi tiết trạng thái",
            style: CustomTextStyle.tilteAppbar,
          ),
          centerTitle: true,
          leading: IconButton(
            icon: const Icon(Icons.arrow_back_ios_new),
            onPressed: () {
              Get.back();
            },
          ),
        ),
        body: FutureBuilder(
          future: controller.getStatus(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var items = snapshot.data as List<StatusDriverModel>;

              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: SingleChildScrollView(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      _buildNameKH(items[0], size),
                      SizedBox(
                        height: size.width * 0.05,
                      ),
                      _buildNameCar(items[0], size),
                      SizedBox(
                        height: size.width * 0.05,
                      ),
                      _buildStatus(size, items[0]),
                      SizedBox(
                        height: size.width * 0.05,
                      ),
                      showFormStatus
                          ? _buildFormStatus(items[0], size)
                          : Container(),
                      SizedBox(
                        height: size.width * 0.05,
                      ),
                      _buildButton(items[0], size, () {
                        Get.toNamed(
                          Routes.REGISTER_OUT_SCREEN,
                          arguments: [
                            items[0].maPhieuvao,
                            items[0].loaixeRe!.maLoaiXe,
                          ],
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

  Widget _buildFormStatus(StatusDriverModel item, Size size) {
    var length = item.trackingtime!.length;

    var day = DateFormat("yyy-MM-dd");
    return SizedBox(
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
                              "${item.trackingtime![0].statustracking!.name}",
                              style: TextStyle(
                                color: Colors.orangeAccent.withOpacity(0.8),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text("Ngày : ${day.format(
                              DateTime.parse(
                                item.trackingtime![0].thoigian.toString(),
                              ),
                            )}"),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text("Giờ : ${day.format(
                              DateTime.parse(
                                item.trackingtime![0].thoigian.toString(),
                              ),
                            )}"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  icon: const Icon(Icons.local_shipping, color: Colors.white),
                  iconBackground: Colors.cyan,
                  position: TimelineItemPosition.left,
                )
              : TimelineModel(
                  Container(height: size.width * 0.2),
                  icon: const Icon(Icons.local_shipping, color: Colors.white),
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
                              "${item.trackingtime![1].statustracking!.name}",
                              style: TextStyle(
                                color: Colors.orangeAccent.withOpacity(0.8),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text("Ngày : ${day.format(
                              DateTime.parse(
                                item.trackingtime![1].thoigian.toString(),
                              ),
                            )}"),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text("Giờ : ${day.format(
                              DateTime.parse(
                                item.trackingtime![1].thoigian.toString(),
                              ),
                            )}"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  icon: const Icon(Icons.meeting_room, color: Colors.white),
                  iconBackground: Colors.cyan,
                  position: TimelineItemPosition.right,
                )
              : TimelineModel(
                  Container(height: size.width * 0.2),
                  icon: const Icon(Icons.meeting_room, color: Colors.white),
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
                              "${item.trackingtime![2].statustracking!.name}",
                              style: TextStyle(
                                color: Colors.orangeAccent.withOpacity(0.8),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text("Ngày : ${day.format(
                              DateTime.parse(
                                item.trackingtime![2].thoigian.toString(),
                              ),
                            )}"),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text("Giờ : ${day.format(
                              DateTime.parse(
                                item.trackingtime![2].thoigian.toString(),
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
                              "${item.trackingtime![3].statustracking!.name}",
                              style: TextStyle(
                                color: Colors.orangeAccent.withOpacity(0.8),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text("Ngày : ${day.format(
                              DateTime.parse(
                                item.trackingtime![3].thoigian.toString(),
                              ),
                            )}"),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text("Giờ : ${day.format(
                              DateTime.parse(
                                item.trackingtime![3].thoigian.toString(),
                              ),
                            )}"),
                          ),
                        ),
                      ],
                    ),
                  ),
                  icon: const Icon(Icons.local_shipping, color: Colors.white),
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
                              "${item.trackingtime![4].statustracking!.name}",
                              style: TextStyle(
                                color: Colors.orangeAccent.withOpacity(0.8),
                                fontSize: 16,
                              ),
                            ),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text("Ngày : ${day.format(
                              DateTime.parse(
                                item.trackingtime![4].thoigian.toString(),
                              ),
                            )}"),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text("Giờ : ${day.format(
                              DateTime.parse(
                                item.trackingtime![4].thoigian.toString(),
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
    );
  }

  Widget _buildStatus(Size size, StatusDriverModel item) {
    var length = item.trackingtime!.length;
    return InkWell(
      onTap: () {
        setState(() {
          showFormStatus = !showFormStatus;
          // print(showFormStatus);
        });
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
                      color: Colors.black.withOpacity(0.8),
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Text(
                    "${item.trackingtime![length - 1].statustracking!.name}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.album_outlined,
                    color: item.status == true ? Colors.green : Colors.red,
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
    );
  }

  Widget _buildNameKH(StatusDriverModel item, Size size) {
    return Container(
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
                const Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      "Tên khách hàng",
                      style: CustomTextStyle.titlePrimary,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      "${item.taixeRe!.khachhangRe!.tenKhachhang}",
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
                const Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      "Số điện thoại",
                      style: CustomTextStyle.titlePrimary,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      "${item.taixeRe!.khachhangRe!.phone}",
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
    );
  }

  Widget _buildNameCar(StatusDriverModel item, Size size) {
    return Container(
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
                const Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      "Loại xe",
                      style: CustomTextStyle.titlePrimary,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      "${item.loaixeRe!.tenLoaiXe}",
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
                const Expanded(
                  flex: 2,
                  child: Center(
                    child: Text(
                      "Số xe",
                      style: CustomTextStyle.titlePrimary,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      "${item.phieuvao!.soxe}",
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
    );
  }

  Widget _buildButton(StatusDriverModel items, Size size, VoidCallback onTap) {
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
