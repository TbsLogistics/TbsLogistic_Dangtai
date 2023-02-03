import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/coordinators/model/ware_home_model.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';

class DetailsWareHomeScreen extends StatefulWidget {
  const DetailsWareHomeScreen({super.key});

  @override
  State<DetailsWareHomeScreen> createState() => _DetailsWareHomeScreenState();
}

class _DetailsWareHomeScreenState extends State<DetailsWareHomeScreen> {
  final String routes = "/DETAILS_WAREHOME_SCREEN";
  @override
  Widget build(BuildContext context) {
    var items = Get.arguments as WareHomeModel;
    var leftlenght = items.cuatrai!.length;
    var rightlenght = items.cuaphai!.length;

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Tình trạng line",
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
      body: Container(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
          child: Row(
            children: [
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListView.builder(
                            itemCount: leftlenght,
                            itemBuilder: (context, index) {
                              // ignore: unnecessary_null_comparison
                              return leftlenght == null
                                  ? Container()
                                  : Container(
                                      margin: const EdgeInsets.only(bottom: 15),
                                      child: Column(
                                        children: [
                                          Center(
                                            child: Text(
                                              "Cửa ${index + 1}",
                                              style: const TextStyle(
                                                color: Colors.black,
                                                fontSize: 16,
                                              ),
                                            ),
                                          ),
                                          const SizedBox(height: 10),
                                          showLane(
                                            "${items.cuatrai![index].dock![0].tenDock}",
                                            items.cuatrai![index].dock![0]
                                                        .status ==
                                                    false
                                                ? Colors.green
                                                : Colors.red,
                                            () {},
                                          ),
                                          showLane(
                                            "${items.cuatrai![index].dock![1].tenDock}",
                                            items.cuatrai![index].dock![1]
                                                        .status ==
                                                    false
                                                ? Colors.green
                                                : Colors.red,
                                            () {},
                                          ),
                                          showLane(
                                            "${items.cuatrai![index].dock![2].tenDock}",
                                            items.cuatrai![index].dock![2]
                                                        .status ==
                                                    false
                                                ? Colors.green
                                                : Colors.red,
                                            () {},
                                          ),
                                          const SizedBox(height: 10),
                                        ],
                                      ),
                                    );
                            }),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Column(
                  children: [
                    Expanded(
                      flex: 1,
                      child: Container(
                        padding: const EdgeInsets.symmetric(horizontal: 20),
                        child: ListView.builder(
                            itemCount: rightlenght,
                            itemBuilder: (context, index) {
                              // ignore: unnecessary_null_comparison
                              return leftlenght == null
                                  ? Container()
                                  : Container(
                                      margin: const EdgeInsets.only(bottom: 15),
                                      child: Column(
                                        children: [
                                          Center(
                                              child: Text(
                                            "Cửa ${index + 1}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                            ),
                                          )),
                                          const SizedBox(height: 10),
                                          showLane(
                                            "${items.cuaphai![index].dock![0].tenDock}",
                                            items.cuaphai![index].dock![0]
                                                        .status ==
                                                    false
                                                ? Colors.green
                                                : Colors.red,
                                            () {},
                                          ),
                                          showLane(
                                            "${items.cuaphai![index].dock![1].tenDock}",
                                            items.cuaphai![index].dock![1]
                                                        .status ==
                                                    false
                                                ? Colors.green
                                                : Colors.red,
                                            () {},
                                          ),
                                          showLane(
                                            "${items.cuaphai![index].dock![2].tenDock}",
                                            items.cuaphai![index].dock![2]
                                                        .status ==
                                                    false
                                                ? Colors.green
                                                : Colors.red,
                                            () {},
                                          ),
                                          const SizedBox(height: 10),
                                        ],
                                      ),
                                    );
                            }),
                      ),
                    ),
                  ],
                ),
              )
            ],
          )),
    );
  }

  Widget showLane(String text, Color color, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: const EdgeInsets.all(5.0),
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(
            width: 1,
            color: Colors.orangeAccent.withOpacity(0.4),
          ),
          // color: color,

          borderRadius: BorderRadius.circular(10.0),
        ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                text,
                style: const TextStyle(color: Colors.black, fontSize: 14),
              ),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                    border: Border.all(
                      width: 1,
                      color: Colors.white,
                    ),
                    color: color,
                    borderRadius: BorderRadius.circular(100)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
