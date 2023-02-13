import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/view/ware_home/controller/warehome_controller.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/view/ware_home/model/list_dock_by_warehome_model.dart';

class ShowLane extends StatefulWidget {
  const ShowLane({
    super.key,
    required this.items,
    required this.indexDoor,
    required this.indexDock,
    required this.maDock,
  });

  final List<ListDockByWareHomeModel> items;
  final int indexDoor;
  final int indexDock;
  final int maDock;

  @override
  State<ShowLane> createState() => _ShowLaneState();
}

class _ShowLaneState extends State<ShowLane> {
  var controller = Get.put(WareHomeController());

  @override
  Widget build(BuildContext context) {
    var status = true;
    // print(status);
    var maDock = widget
        .items[0].cuaphai![widget.indexDoor].dock![widget.indexDock].maDock;
    return InkWell(
      onTap: () {
        print(widget.items[0].cuaphai![widget.indexDoor].dock![widget.indexDock]
            .maDock);
        controller.putDock(maDock: int.parse(maDock.toString()));
      },
      child: Container(
        margin: const EdgeInsets.all(5.0),
        height: 60,
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
                "${widget.items[0].cuaphai![widget.indexDoor].dock![widget.indexDock].tenDock}",
                style: TextStyle(
                    color: Theme.of(context).primaryColorLight, fontSize: 14),
              ),
              const SizedBox(
                height: 5,
              ),
              Container(
                width: 25,
                height: 25,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 1,
                    color: Colors.white,
                  ),
                  color: widget.items[0].cuaphai![widget.indexDoor]
                              .dock![widget.indexDock].status ==
                          status
                      ? Colors.green
                      : Colors.red,
                  borderRadius: BorderRadius.circular(100),
                ),
              ),
            ],
          ),
        ),
      ),
    );
    ;
  }
}
