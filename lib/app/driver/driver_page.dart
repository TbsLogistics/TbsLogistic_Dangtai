import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tbs_logistics_dangtai/app/driver/controller/driver_controller.dart';
import 'package:tbs_logistics_dangtai/app/driver/view/driver_screen.dart';
import 'package:tbs_logistics_dangtai/config/core/constants/constants.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';

class DriverPage extends StatefulWidget {
  const DriverPage({super.key});

  @override
  State<DriverPage> createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> {
  final String routes = "/DRIVER_PAGE";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<DriverController>(
      init: DriverController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text(
            "TBS Logistic",
            style: CustomTextStyle.tilteAppbar,
          ),
          centerTitle: true,
          backgroundColor: CustomColor.backgroundAppbar,
        ),
        drawer: Drawer(
          child: _drawer(controller, size),
        ),
        body: const DriverScreen(),
      ),
    );
  }

  Widget _drawer(DriverController controller, Size size) {
    return Container(
      decoration: const BoxDecoration(gradient: CustomColor.gradient),
      padding: const EdgeInsets.only(top: 25),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          FutureBuilder(
            future: controller.getInfor(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var items = snapshot.data;
                // print(items);
                return SizedBox(
                  height: size.height * 0.3,
                  child: Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(left: 10),
                        height: size.height * 0.1,
                        width: size.width,
                        alignment: Alignment.centerLeft,
                        child: Column(
                          children: [
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Họ và tên : ${items!["tenTaixe"]}",
                                style: const TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Số điện thoại : ${items["phone"]}",
                                style: const TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            Container(
                              alignment: Alignment.centerLeft,
                              child: Text(
                                "Chức vụ : ${items["usernameAccount"]}",
                                style: const TextStyle(
                                  color: Colors.blueGrey,
                                  fontSize: 16,
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
              return Container();
            },
          ),
          Column(
            children: [
              ListTile(
                onTap: () {
                  controller.postDetails();
                },
                leading: const Icon(
                  Icons.qr_code,
                  color: Colors.black,
                ),
                title: const Text(
                  "QR Code",
                  style: TextStyle(
                    color: Colors.black,
                    fontSize: 16,
                  ),
                ),
              ),
              ListTile(
                onTap: () {
                  // print("oke");
                  postLogout();
                },
                leading: const Icon(
                  Icons.logout_rounded,
                  color: Colors.black,
                ),
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

  postLogout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove(AppConstants.KEY_ACCESS_TOKEN);

    Get.toNamed(Routes.LOGIN_PAGE);
  }
}
