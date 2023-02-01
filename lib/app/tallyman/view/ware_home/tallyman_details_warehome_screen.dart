import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/view/ware_home/controller/warehome_controller.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/view/ware_home/model/list_dock_by_warehome_model.dart';

// ignore: must_be_immutable
class WareHomePage extends GetView<WareHomeController> {
  WareHomePage({super.key});

  final String routes = "/TALLYMAN_WAREHOME_SCREEN";
  @override
  var controller = Get.put(WareHomeController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          "Tình trạng line",
          style: TextStyle(
            color: Theme.of(context).primaryColorLight,
          ),
        ),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        centerTitle: true,
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back_ios_new,
            color: Theme.of(context).primaryColorLight,
          ),
        ),
      ),
      body: FutureBuilder(
          future: controller.getLisDock(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var items = snapshot.data as List<ListDockByWareHomeModel>;
              var leftlenght = items[0].cuatrai!.length;
              var rightlenght = items[0].cuaphai!.length;
              return Container(
                padding:
                    const EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: Row(
                  children: [
                    Expanded(
                      child: Column(
                        children: [
                          Expanded(
                            flex: 1,
                            child: Container(
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: ListView.builder(
                                  itemCount: leftlenght,
                                  itemBuilder: (context, index) {
                                    return leftlenght == null
                                        ? Container()
                                        : Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 15),
                                            child: Column(
                                              children: [
                                                Center(
                                                  child: Text(
                                                    "${items[0].cuatrai![index].tenCua}",
                                                    style: const TextStyle(
                                                      color: Colors.black,
                                                      fontSize: 16,
                                                    ),
                                                  ),
                                                ),
                                                const SizedBox(height: 10),
                                                showLane(
                                                  text:
                                                      "${items[0].cuatrai![index].dock![0].tenDock}",
                                                  color: items[0]
                                                              .cuatrai![index]
                                                              .dock![0]
                                                              .status ==
                                                          true
                                                      ? Colors.green
                                                      : Colors.red,
                                                  onTap: () {
                                                    print(items[0]
                                                        .cuatrai![index]
                                                        .dock![0]
                                                        .status);
                                                    if (items[0]
                                                            .cuatrai![index]
                                                            .dock![0]
                                                            .status ==
                                                        false) {
                                                      controller
                                                          .putDock(
                                                        maDock: int.parse(
                                                          items[0]
                                                              .cuatrai![index]
                                                              .dock![0]
                                                              .maDock
                                                              .toString(),
                                                        ),
                                                      )
                                                          .whenComplete(() {
                                                        items[0]
                                                                .cuatrai![index]
                                                                .dock![0]
                                                                .status ==
                                                            true;
                                                        print(items[0]
                                                            .cuatrai![index]
                                                            .dock![0]
                                                            .status);
                                                      });
                                                    }
                                                  },
                                                ),
                                                showLane(
                                                  text:
                                                      "${items[0].cuatrai![index].dock![1].tenDock}",
                                                  color: items[0]
                                                              .cuatrai![index]
                                                              .dock![1]
                                                              .status ==
                                                          true
                                                      ? Colors.green
                                                      : Colors.red,
                                                  onTap: () {
                                                    print(items[0]
                                                        .cuatrai![index]
                                                        .dock![1]
                                                        .maDock);
                                                    if (items[0]
                                                            .cuatrai![index]
                                                            .dock![1]
                                                            .status ==
                                                        false) {
                                                      controller
                                                          .putDock(
                                                        maDock: int.parse(
                                                          items[0]
                                                              .cuatrai![index]
                                                              .dock![1]
                                                              .maDock
                                                              .toString(),
                                                        ),
                                                      )
                                                          .whenComplete(() {
                                                        items[0]
                                                                .cuatrai![index]
                                                                .dock![1]
                                                                .status ==
                                                            true;
                                                        print(items[0]
                                                            .cuatrai![index]
                                                            .dock![1]
                                                            .status);
                                                      });
                                                      ;
                                                    }
                                                  },
                                                ),
                                                showLane(
                                                  text:
                                                      "${items[0].cuatrai![index].dock![2].tenDock}",
                                                  color: items[0]
                                                              .cuatrai![index]
                                                              .dock![2]
                                                              .status ==
                                                          true
                                                      ? Colors.green
                                                      : Colors.red,
                                                  onTap: () {
                                                    print(items[0]
                                                        .cuatrai![index]
                                                        .dock![2]
                                                        .maDock);
                                                    if (items[0]
                                                            .cuatrai![index]
                                                            .dock![2]
                                                            .status ==
                                                        false) {
                                                      controller
                                                          .putDock(
                                                        maDock: int.parse(
                                                          items[0]
                                                              .cuatrai![index]
                                                              .dock![2]
                                                              .maDock
                                                              .toString(),
                                                        ),
                                                      )
                                                          .whenComplete(() {
                                                        items[0]
                                                                .cuatrai![index]
                                                                .dock![2]
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
                              padding:
                                  const EdgeInsets.symmetric(horizontal: 20),
                              child: ListView.builder(
                                  itemCount: rightlenght,
                                  itemBuilder: (context, index) {
                                    return leftlenght == null
                                        ? Container()
                                        : Container(
                                            margin: const EdgeInsets.only(
                                                bottom: 15),
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
                                                      "${items[0].cuaphai![index].dock![0].tenDock}",
                                                  color: items[0]
                                                              .cuaphai![index]
                                                              .dock![0]
                                                              .status ==
                                                          true
                                                      ? Colors.green
                                                      : Colors.red,
                                                  onTap: () {
                                                    if (items[0]
                                                            .cuaphai![index]
                                                            .dock![0]
                                                            .status ==
                                                        false) {
                                                      controller.putDock(
                                                        maDock: int.parse(
                                                          items[0]
                                                              .cuaphai![index]
                                                              .dock![0]
                                                              .maDock
                                                              .toString(),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                                showLane(
                                                  text:
                                                      "${items[0].cuaphai![index].dock![1].tenDock}",
                                                  color: items[0]
                                                              .cuaphai![index]
                                                              .dock![1]
                                                              .status ==
                                                          true
                                                      ? Colors.green
                                                      : Colors.red,
                                                  onTap: () {
                                                    if (items[0]
                                                            .cuaphai![index]
                                                            .dock![1]
                                                            .status ==
                                                        false) {
                                                      controller.putDock(
                                                        maDock: int.parse(
                                                          items[0]
                                                              .cuaphai![index]
                                                              .dock![1]
                                                              .maDock
                                                              .toString(),
                                                        ),
                                                      );
                                                    }
                                                  },
                                                ),
                                                showLane(
                                                  text:
                                                      "${items[0].cuaphai![index].dock![2].tenDock}",
                                                  color: items[0]
                                                              .cuaphai![index]
                                                              .dock![2]
                                                              .status ==
                                                          true
                                                      ? Colors.green
                                                      : Colors.red,
                                                  onTap: () {
                                                    if (items[0]
                                                            .cuaphai![index]
                                                            .dock![2]
                                                            .status ==
                                                        false) {
                                                      controller.putDock(
                                                        maDock: int.parse(
                                                          items[0]
                                                              .cuaphai![index]
                                                              .dock![2]
                                                              .maDock
                                                              .toString(),
                                                        ),
                                                      );
                                                      print(items[0]
                                                          .cuatrai![index]
                                                          .dock![2]
                                                          .status);
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
              );
            }
            return Center(
              child: CircularProgressIndicator(
                color: Colors.orangeAccent,
              ),
            );
          }),
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
