import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

import 'package:tbs_logistics_dangtai/app/driver/model/register_out_model.dart';
import 'package:tbs_logistics_dangtai/app/driver/model/status_driver_model.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';

class RegisterOutDetailsScreen extends StatelessWidget {
  const RegisterOutDetailsScreen({super.key});
  final String routes = "/REGISTER_OUT_DETAILS_SCREEN";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var phieura = Get.arguments[0] as PhieuraModel;
    var items = Get.arguments[1] as StatusDriverModel;
    var day = DateFormat("dd-MM-yyyy");
    var hour = DateFormat("hh:mm a");
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        title: Text(
          "Chi tiết phiếu ra đã đăng ký",
          style: TextStyle(
            color: Theme.of(context).primaryColorLight,
          ),
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.DRIVER_PAGE);
            },
            icon: Icon(
              Icons.home,
              size: 25,
              color: Theme.of(context).primaryColorLight,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
            const SizedBox(height: 10),
            _buildNumberCar(items, size, context),
            const SizedBox(height: 10),
            _buildProduct(items, size, context),
            const SizedBox(height: 10),
            items.loaixeRe!.maLoaiXe == "tai"
                ? _buildProductCar(phieura, size, context)
                : _buildProductCont(phieura, size, context),
          ],
        ),
      )),
    );
  }

  Widget _buildProduct(
      StatusDriverModel items, Size size, BuildContext context) {
    return Card(
      child: Container(
        height: size.width * 0.1,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.orangeAccent,
          ),
          borderRadius: BorderRadius.circular(15),
          // color: Colors.white,
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            const Expanded(
              flex: 1,
              child: Center(
                child: Text(
                  "Loại hàng",
                  style: TextStyle(
                    color: Colors.green,
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Center(
                child: Text(
                  items.loaihang == "HN" ? "Hàng nhập" : "Hàng xuất",
                  style: TextStyle(
                      fontSize: 16, color: Theme.of(context).primaryColorLight),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget _buildProductCar(PhieuraModel items, Size size, BuildContext context) {
    return Card(
      child: Container(
        height: size.width * 0.5,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.orangeAccent,
          ),
          borderRadius: BorderRadius.circular(15),
          // color: Colors.white,
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
                          "Số seal",
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Text(
                          "${items.contRa1seal1}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
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
                            children: [
                              const Text(
                                "Số Kiện : ",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "${items.soKienra}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColorLight,
                                ),
                              ),
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
                            children: [
                              const Text(
                                "Số Book : ",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "${items.soBookra}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColorLight,
                                ),
                              ),
                            ],
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [],
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
                            children: [
                              const Text(
                                "Số Khối : ",
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                ),
                              ),
                              Text(
                                "${items.sokhoira}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColorLight,
                                ),
                              ),
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
      ),
    );
  }

  Widget _buildProductCont(
      PhieuraModel items, Size size, BuildContext context) {
    return Card(
      child: Container(
        height: size.width * 0.7,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.orangeAccent,
          ),
          borderRadius: BorderRadius.circular(15),
          // color: Colors.white,
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
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                          ),
                        ),
                        Text(
                          "${items.contRa1}",
                          style: TextStyle(
                            fontSize: 16,
                            color: Theme.of(context).primaryColorLight,
                          ),
                        ),
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
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${items.contRa1seal1}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColorLight,
                                ),
                              ),
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
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${items.contRa1seal2}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColorLight,
                                ),
                              ),
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
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${items.soKienra}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColorLight,
                                ),
                              ),
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
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${items.soBookra}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColorLight,
                                ),
                              ),
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
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${items.sokhoira}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColorLight,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
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
                          style: TextStyle(
                            color: Colors.green,
                            fontSize: 16,
                          ),
                        ),
                        Text("${items.contRa2}"),
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
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text("${items.contRa2seal1}"),
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
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${items.contRa2seal2}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColorLight,
                                ),
                              ),
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
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${items.soKienra1}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColorLight,
                                ),
                              ),
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
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${items.soBookra1}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColorLight,
                                ),
                              ),
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
                                style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 16,
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(height: 5),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: [
                              Text(
                                "${items.sokhoira1}",
                                style: TextStyle(
                                  fontSize: 16,
                                  color: Theme.of(context).primaryColorLight,
                                ),
                              ),
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
      ),
    );
  }

  Widget _buildNumberCar(
      StatusDriverModel items, Size size, BuildContext context) {
    return Card(
      child: Container(
        height: size.width * 0.15,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.orangeAccent,
          ),
          borderRadius: BorderRadius.circular(15),
          // color: Colors.white,
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
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Text(
                        "${items.loaixeRe!.tenLoaiXe}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColorLight,
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
                        style: TextStyle(
                          color: Colors.green,
                          fontSize: 16,
                        ),
                      ),
                    ),
                  ),
                  Expanded(
                    flex: 3,
                    child: Center(
                      child: Text(
                        "${items.phieuvao!.soxe}",
                        style: TextStyle(
                          fontSize: 16,
                          color: Theme.of(context).primaryColorLight,
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
