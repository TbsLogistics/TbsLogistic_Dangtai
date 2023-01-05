import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:tbs_logistics_dangtai/app/customer/controller/customer_controller.dart';
import 'package:tbs_logistics_dangtai/app/customer/view/customer_screen.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';
import 'package:tbs_logistics_dangtai/config/share_preferences/share_prefer.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  final String routes = "/CUSTOMER_PAGE";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<CustomerController>(
        init: CustomerController(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                // automaticallyImplyLeading: false,
                title: const Text(
                  "TBS Logistics",
                  style: CustomTextStyle.tilteAppbar,
                ),
                centerTitle: true,
                backgroundColor: CustomColor.backgroundAppbar,
              ),
              drawer: Drawer(
                child: _drawer(controller, size),
              ),
              body: const CustomerScreen(),
            ));
  }

  Widget _drawer(CustomerController controller, Size size) {
    return Container(
      padding: const EdgeInsets.only(top: 25),
      decoration: const BoxDecoration(gradient: CustomColor.gradient),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          // FutureBuilder(
          //   future: controller.getUser(),
          //   builder: (context, snapshot) {
          //     if (snapshot.hasData) {
          //       var items = snapshot.data;
          //       // print(items);
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
          //                       "Họ và tên : ${items!["tenKhachhang"]}",
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
          //                       "Số điện thoại : ${items["phone"]}",
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
            onTap: () {
              SharePerApi().postLogout();
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
