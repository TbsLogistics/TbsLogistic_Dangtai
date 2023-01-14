import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/coordinators/controller/coordinator_controller.dart';
import 'package:tbs_logistics_dangtai/app/coordinators/view/coordinator_screen.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';
import 'package:tbs_logistics_dangtai/config/share_preferences/share_prefer.dart';

class CoordinatorPage extends StatefulWidget {
  const CoordinatorPage({super.key});

  @override
  State<CoordinatorPage> createState() => _CoordinatorPageState();
}

class _CoordinatorPageState extends State<CoordinatorPage> {
  final String routes = "/COORDINATOR_PAGE";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<CoordinatorController>(
      init: CoordinatorController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text(
            "TBS Logistic",
            style: CustomTextStyle.tilteAppbar,
          ),
          centerTitle: true,
          backgroundColor: CustomColor.backgroundAppbar,
        ),
        body: const CoordinatorScreen(),
        drawer: Drawer(
          child: _drawer(controller, size),
        ),
      ),
    );
  }

  Widget _drawer(CoordinatorController controller, Size size) {
    return Container(
      decoration: const BoxDecoration(gradient: CustomColor.gradient),
      padding: const EdgeInsets.only(top: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // FutureBuilder(
          //   future: controller.getUser(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       var items = snapshot.data;

          //       return SizedBox(
          //         height: size.height * 0.3,
          //         child: Column(
          //           children: [
          //             Container(
          //               padding: const EdgeInsets.only(left: 10),
          //               height: size.height * 0.1,
          //               width: size.width,
          //               alignment: Alignment.centerLeft,
          //               child: Column(
          //                 children: [
          //                   Container(
          //                     alignment: Alignment.centerLeft,
          //                     child: Text(
          //                       "Họ và tên : ${items!["tenNV"]}",
          //                       style: const TextStyle(
          //                         color: Colors.blueGrey,
          //                         fontSize: 16,
          //                       ),
          //                     ),
          //                   ),
          //                   const SizedBox(height: 5),
          //                   Container(
          //                     alignment: Alignment.centerLeft,
          //                     child: Text(
          //                       "Số điện thoại : ${items["soDienThoai"]}",
          //                       style: const TextStyle(
          //                         color: Colors.blueGrey,
          //                         fontSize: 16,
          //                       ),
          //                     ),
          //                   ),
          //                   const SizedBox(height: 5),
          //                   Container(
          //                     alignment: Alignment.centerLeft,
          //                     child: Text(
          //                       "Chức vụ : ${items["usernameAccount"]}",
          //                       style: const TextStyle(
          //                         color: Colors.blueGrey,
          //                         fontSize: 16,
          //                       ),
          //                     ),
          //                   ),
          //                 ],
          //               ),
          //             ),
          //           ],
          //         ),
          //       );
          //     }
          //     return Container();
          //   },
          // ),
          ListTile(
            onTap: () async {
              await SharePerApi().postLogout();
            },
            leading: const Icon(Icons.logout_rounded),
            title: const Text(
              "Đăng xuất",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void closeDrawer() {
    if (_scaffoldKey.currentState != null) {
      if (_scaffoldKey.currentState!.isDrawerOpen) {
        _scaffoldKey.currentState!.closeDrawer();
      } else if (_scaffoldKey.currentState!.isEndDrawerOpen) {
        _scaffoldKey.currentState!.closeEndDrawer();
      }
    }
  }
}
