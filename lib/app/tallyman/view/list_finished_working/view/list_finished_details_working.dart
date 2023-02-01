import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/controller/tallyman_controller.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/model/list_of_emfloy.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';

// ignore: must_be_immutable
class ListFinishedDetailsWorking extends GetView<TallymanController> {
  ListFinishedDetailsWorking({super.key});
  final String routes = "/LIST_FINISHED_DETAILS_WORKING";

  var items;
  var length;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    if (Get.arguments != null) {
      var items = Get.arguments as List<ListOfEmployeesModel>;

      return Scaffold(
        appBar: AppBar(
          title: Text(
            "Danh sách thành viên",
            style: TextStyle(
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
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
        body: Container(
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
          width: size.width,
          child: ListView.builder(
            itemBuilder: (context, index) {
              return Card(
                shape: RoundedRectangleBorder(
                  side: BorderSide(
                    color: Theme.of(context).primaryColorLight,
                  ),
                ),
                child: ListTile(
                  leading: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [Text("$index")],
                  ),
                  title: Text(
                    "${items[index].tenNV}",
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                  subtitle: Text(
                    "${items[index].maNv}",
                    style: TextStyle(
                      color: Theme.of(context).primaryColorLight,
                    ),
                  ),
                  trailing: Text(
                    "${items[index].soDienThoai}",
                    style: const TextStyle(
                      color: Colors.green,
                    ),
                  ),
                ),
              );
            },
            itemCount: items.length,
          ),
        ),
      );
    } else {
      return Scaffold(
        appBar: AppBar(
          title: const Text(
            "Danh sách thành viên",
            style: CustomTextStyle.tilteAppbar,
          ),
          centerTitle: true,
          backgroundColor: CustomColor.backgroundAppbar,
          leading: IconButton(
            onPressed: () {
              Get.back();
            },
            icon: const Icon(Icons.arrow_back_ios_new),
          ),
        ),
        body: const Center(
          child: Text("Lỗi dữ liệu"),
        ),
      );
    }
  }
}
