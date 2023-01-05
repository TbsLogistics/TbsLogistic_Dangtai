import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tbs_logistics_dangtai/app/customer/controller/customer_controller.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';
import 'package:timeline_list/timeline.dart';
import 'package:timeline_list/timeline_model.dart';

class CustomerDetailsInfoDriver extends StatefulWidget {
  const CustomerDetailsInfoDriver({super.key});

  @override
  State<CustomerDetailsInfoDriver> createState() =>
      _CustomerDetailsInfoDriverState();
}

class _CustomerDetailsInfoDriverState extends State<CustomerDetailsInfoDriver> {
  final String routes = "/CUSTOMER_DETAILS_INFO_DRIVER";

  bool showFormStatus = false;

  @override
  Widget build(BuildContext context) {
    var items = Get.arguments;
    Size size = MediaQuery.of(context).size;
    return GetBuilder<CustomerController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text(
            "Chi tiết thông tin tài xế",
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
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                _buildNameKH(items, size),
                SizedBox(
                  height: size.width * 0.05,
                ),
                _buildNameCar(items, size),
                SizedBox(
                  height: size.width * 0.05,
                ),
                _buildStatus(size, items),
                SizedBox(
                  height: size.width * 0.05,
                ),
                showFormStatus ? _buildFormStatus(items, size) : Container(),
                SizedBox(
                  height: size.width * 0.05,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildFormStatus(dynamic item, Size size) {
    var length = item["trackingtime"].length;

    var day = DateFormat("yyyy-MM-dd");
    // ignore: unused_local_variable
    var hour = DateFormat("hh-mm");
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
                              "${item["trackingtime"][0]["Statustracking"]["name"]}",
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
                                item["trackingtime"][0]["thoigian"].toString(),
                              ),
                            )}"),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text("Giờ : ${day.format(
                              DateTime.parse(
                                item["trackingtime"][0]["thoigian"].toString(),
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
                              "${item["trackingtime"][1]["Statustracking"]["name"]}",
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
                                item["trackingtime"][1]["thoigian"].toString(),
                              ),
                            )}"),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text("Giờ : ${day.format(
                              DateTime.parse(
                                item["trackingtime"][1]["thoigian"].toString(),
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
                              "${item["trackingtime"][2]["Statustracking"]["name"]}",
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
                                item["trackingtime"][2]["thoigian"].toString(),
                              ),
                            )}"),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text("Giờ : ${day.format(
                              DateTime.parse(
                                item["trackingtime"][2]["thoigian"].toString(),
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
                              "${item["trackingtime"][3]["Statustracking"]["name"]}",
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
                                item["trackingtime"][3]["thoigian"].toString(),
                              ),
                            )}"),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text("Giờ : ${day.format(
                              DateTime.parse(
                                item["trackingtime"][3]["thoigian"].toString(),
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
                              "${item["trackingtime"][4]["Statustracking"]["name"]}",
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
                                item["trackingtime"][4]["thoigian"].toString(),
                              ),
                            )}"),
                          ),
                        ),
                        Expanded(
                          child: Center(
                            child: Text("Giờ : ${day.format(
                              DateTime.parse(
                                item["trackingtime"][4]["thoigian"].toString(),
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

  Widget _buildStatus(Size size, dynamic item) {
    var length = item["trackingtime"].length;
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
                    "${item["trackingtime"][length - 1]["Statustracking"]["name"]}",
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                  ),
                  const SizedBox(width: 10),
                  Icon(
                    Icons.album_outlined,
                    color: item["status"] == true ? Colors.green : Colors.red,
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

  Widget _buildNameCar(dynamic item, Size size) {
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
                      "${item["loaixe_re"]["tenLoaiXe"]}",
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
                      "${item["phieuvao"]["soxe"]}",
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

  Widget _buildNameKH(dynamic item, Size size) {
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
                      "${item["taixe_re"]["khachhang_re"]["tenKhachhang"]}",
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
                      "${item["taixe_re"]["khachhang_re"]["tenKhachhang"]}",
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
}
