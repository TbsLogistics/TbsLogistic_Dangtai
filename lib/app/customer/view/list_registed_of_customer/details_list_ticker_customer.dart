import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/controller/tallyman_controller.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';
import 'package:tbs_logistics_dangtai/config/model/list_traking_model.dart';

class DetailsListTickerOfCustomer extends StatelessWidget {
  const DetailsListTickerOfCustomer({super.key});
  final String routes = "/DETAILS_LIST_TICKER_OF_CUSTOMER";

  @override
  Widget build(BuildContext context) {
    var items = Get.arguments as ListTrackingModel;
    var lengthTracking = items.trackingtime!.length;

    Size size = MediaQuery.of(context).size;
    return GetBuilder<TallymanController>(
        init: TallymanController(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                title: const Text(
                  'Chi tiết đơn hàng',
                  style: CustomTextStyle.tilteAppbar,
                ),
                backgroundColor: CustomColor.backgroundAppbar,
                centerTitle: true,
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(Icons.arrow_back_ios_new),
                ),
              ),
              body: SingleChildScrollView(
                child: Padding(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 15, vertical: 15),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Container(
                        height: size.width * 0.1,
                        decoration: BoxDecoration(
                          // border: Border.all(
                          //   width: 1,
                          //   // color: Colors.orangeAccent,
                          // ),
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Row(
                          children: [
                            Expanded(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  const Icon(
                                    Icons.album_outlined,
                                    color: Colors.greenAccent,
                                  ),
                                  const SizedBox(
                                    width: 10,
                                  ),
                                  Text(
                                      "${items.trackingtime![lengthTracking - 1].statustracking!.name}")
                                ],
                              ),
                            )
                          ],
                        ),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      _buildNameDriver(items, size),
                      const SizedBox(
                        height: 15,
                      ),
                      _buildNumberCar(items, size),
                      const SizedBox(
                        height: 15,
                      ),

                      //number cont
                      _buildNumberCont(items, size),
                      const SizedBox(
                        height: 15,
                      ),
                    ],
                  ),
                ),
              ),
            ));
  }

  Widget _buildNameDriver(ListTrackingModel items, Size size) {
    return Container(
      height: size.width * 0.2,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.orangeAccent,
        ),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
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
                      "Tên tài xế",
                      style: CustomTextStyle.titlePrimary,
                    ),
                  ),
                ),
                Expanded(
                  flex: 3,
                  child: Center(
                    child: Text(
                      "${items.taixeRe!.tenTaixe}",
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
                      "${items.taixeRe!.phone}",
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

  Widget _buildNumberCar(ListTrackingModel items, Size size) {
    return Container(
      height: size.width * 0.2,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.orangeAccent,
        ),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
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
    );
  }

  Widget _buildNumberCont(ListTrackingModel items, Size size) {
    return Container(
      height: size.width * 0.7,
      decoration: BoxDecoration(
        border: Border.all(
          width: 1,
          color: Colors.orangeAccent,
        ),
        borderRadius: BorderRadius.circular(15),
        color: Colors.white,
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Số công 1",
                        style: CustomTextStyle.titlePrimary,
                      ),
                      Text("${items.phieuvao!.socont1}"),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Số seal 1",
                              style: CustomTextStyle.titlePrimary,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("${items.phieuvao!.cont1seal1}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Số seal 2",
                              style: CustomTextStyle.titlePrimary,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("${items.phieuvao!.cont1seal2}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Số Kiện",
                              style: CustomTextStyle.titlePrimary,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("${items.phieuvao!.soKien}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Số Book",
                              style: CustomTextStyle.titlePrimary,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("${items.phieuvao!.soBook}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Số Khối",
                              style: CustomTextStyle.titlePrimary,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("${items.phieuvao!.sokhoi}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          const VerticalDivider(
            width: 1,
            indent: 15,
            endIndent: 15,
            color: Colors.orangeAccent,
            thickness: 1,
          ),
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Text(
                        "Số công 2",
                        style: CustomTextStyle.titlePrimary,
                      ),
                      Text("${items.phieuvao!.socont1}"),
                    ],
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Số seal 1",
                              style: CustomTextStyle.titlePrimary,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("${items.phieuvao!.cont2seal1}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Số seal 2",
                              style: CustomTextStyle.titlePrimary,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("${items.phieuvao!.cont2seal2}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Số Kiện",
                              style: CustomTextStyle.titlePrimary,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("${items.phieuvao!.sokien1}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Số Book",
                              style: CustomTextStyle.titlePrimary,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("${items.phieuvao!.soBook1}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 10),
                    child: Column(
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: const [
                            Text(
                              "Số Khối",
                              style: CustomTextStyle.titlePrimary,
                            ),
                          ],
                        ),
                        const SizedBox(height: 5),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Text("${items.phieuvao!.sokhoi1}"),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
