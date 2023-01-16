import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/coordinators/model/ware_home_model.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/controller/tallyman_controller.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';

// ignore: must_be_immutable
class TallymanDetailsWarehomeScreen extends GetView<TallymanController> {
  TallymanDetailsWarehomeScreen({super.key});

  final String routes = "/TALLYMAN_DETAILS_WAREHOME_SCREEN";

  var items;
  var leftlenght;
  var rightlenght;

  @override
  Widget build(BuildContext context) {
    if (Get.arguments != null && Get.arguments is WareHomeModel) {
      items = Get.arguments as WareHomeModel;
      leftlenght = items.cuatrai!.length;
      rightlenght = items.cuaphai!.length;
    } else {
      items = [];
    }
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
                            return leftlenght == null
                                ? Container()
                                : Container(
                                    margin: const EdgeInsets.only(bottom: 15),
                                    child: Column(
                                      children: [
                                        Center(
                                          child: Text(
                                            "${items.cuatrai![index].tenCua}",
                                            style: const TextStyle(
                                              color: Colors.black,
                                              fontSize: 16,
                                            ),
                                          ),
                                        ),
                                        const SizedBox(height: 10),
                                        showLane(
                                          text:
                                              "${items.cuatrai![index].dock![0].tenDock}",
                                          color: items.cuatrai![index].dock![0]
                                                      .status ==
                                                  true
                                              ? Colors.green
                                              : Colors.red,
                                          onTap: () {
                                            print(items.cuatrai![index].dock![0]
                                                .status);
                                            if (items.cuatrai![index].dock![0]
                                                    .status ==
                                                false) {
                                              controller
                                                  .putDock(
                                                maDock: int.parse(
                                                  items.cuatrai![index].dock![0]
                                                      .maDock
                                                      .toString(),
                                                ),
                                              )
                                                  .whenComplete(() {
                                                items.cuatrai![index].dock![0]
                                                        .status ==
                                                    true;
                                                print(items.cuatrai![index]
                                                    .dock![0].status);
                                              });
                                            }
                                          },
                                        ),
                                        showLane(
                                          text:
                                              "${items.cuatrai![index].dock![1].tenDock}",
                                          color: items.cuatrai![index].dock![1]
                                                      .status ==
                                                  true
                                              ? Colors.green
                                              : Colors.red,
                                          onTap: () {
                                            print(items.cuatrai![index].dock![1]
                                                .maDock);
                                            if (items.cuatrai![index].dock![1]
                                                    .status ==
                                                false) {
                                              controller
                                                  .putDock(
                                                maDock: int.parse(
                                                  items.cuatrai![index].dock![1]
                                                      .maDock
                                                      .toString(),
                                                ),
                                              )
                                                  .whenComplete(() {
                                                items.cuatrai![index].dock![1]
                                                        .status ==
                                                    true;
                                                print(items.cuatrai![index]
                                                    .dock![1].status);
                                              });
                                              ;
                                            }
                                          },
                                        ),
                                        showLane(
                                          text:
                                              "${items.cuatrai![index].dock![2].tenDock}",
                                          color: items.cuatrai![index].dock![2]
                                                      .status ==
                                                  true
                                              ? Colors.green
                                              : Colors.red,
                                          onTap: () {
                                            print(items.cuatrai![index].dock![2]
                                                .maDock);
                                            if (items.cuatrai![index].dock![2]
                                                    .status ==
                                                false) {
                                              controller
                                                  .putDock(
                                                maDock: int.parse(
                                                  items.cuatrai![index].dock![2]
                                                      .maDock
                                                      .toString(),
                                                ),
                                              )
                                                  .whenComplete(() {
                                                items.cuatrai![index].dock![2]
                                                        .status ==
                                                    true;
                                                print("oke");
                                              });
                                              ;
                                            }
                                          },
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
                                          text:
                                              "${items.cuaphai![index].dock![0].tenDock}",
                                          color: items.cuaphai![index].dock![0]
                                                      .status ==
                                                  true
                                              ? Colors.green
                                              : Colors.red,
                                          onTap: () {
                                            if (items.cuaphai![index].dock![0]
                                                    .status ==
                                                false) {
                                              controller.putDock(
                                                maDock: int.parse(
                                                  items.cuaphai![index].dock![0]
                                                      .maDock
                                                      .toString(),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                        showLane(
                                          text:
                                              "${items.cuaphai![index].dock![1].tenDock}",
                                          color: items.cuaphai![index].dock![1]
                                                      .status ==
                                                  true
                                              ? Colors.green
                                              : Colors.red,
                                          onTap: () {
                                            if (items.cuaphai![index].dock![1]
                                                    .status ==
                                                false) {
                                              controller.putDock(
                                                maDock: int.parse(
                                                  items.cuaphai![index].dock![1]
                                                      .maDock
                                                      .toString(),
                                                ),
                                              );
                                            }
                                          },
                                        ),
                                        showLane(
                                          text:
                                              "${items.cuaphai![index].dock![2].tenDock}",
                                          color: items.cuaphai![index].dock![2]
                                                      .status ==
                                                  true
                                              ? Colors.green
                                              : Colors.red,
                                          onTap: () {
                                            if (items.cuaphai![index].dock![2]
                                                    .status ==
                                                false) {
                                              controller.putDock(
                                                maDock: int.parse(
                                                  items.cuaphai![index].dock![2]
                                                      .maDock
                                                      .toString(),
                                                ),
                                              );
                                              print(items.cuatrai![index]
                                                  .dock![2].status);
                                            }
                                          },
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
        ),
      ),
    );
  }

  Widget showLane(
      {required String text,
      required Color color,
      required VoidCallback onTap}) {
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
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
