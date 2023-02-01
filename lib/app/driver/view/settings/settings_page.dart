import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:tbs_logistics_dangtai/app/driver/controller/driver_controller.dart';
import 'package:tbs_logistics_dangtai/config/core/constants/constants.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';

class DriverSettings extends GetView<DriverController> {
  const DriverSettings({super.key});

  final String routes = "/DRIVER_SETTINGS";

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<DriverController>(
      init: DriverController(),
      builder: (controller) {
        return Scaffold(
          appBar: AppBar(
            title: Text(
              "Cài đặt",
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
                Icons.arrow_back_ios_new_outlined,
                size: 25,
                color: Theme.of(context).primaryColorLight,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              height: size.height,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  ListTile(
                    leading: Text(
                      "Profile",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Obx(
                    () => Column(
                      children: [
                        Card(
                          shape: const RoundedRectangleBorder(
                            side: BorderSide(
                              color: Colors.orangeAccent,
                            ),
                          ),
                          child: ListTile(
                            leading: const Icon(Icons.person),
                            title: const Text("Thông tin cá nhân"),
                            trailing: IconButton(
                                onPressed: () {
                                  controller.switchHideShow();
                                },
                                icon: Icon(
                                  controller.hideShowMode.isFalse
                                      ? Icons.keyboard_arrow_down_rounded
                                      : Icons.keyboard_arrow_up_rounded,
                                  size: 25,
                                  color: Colors.orangeAccent,
                                )),
                          ),
                        ),
                        controller.hideShowMode.isFalse
                            ? Container()
                            : Card(
                                shape: const RoundedRectangleBorder(
                                    // borderRadius: BorderRadius.circular(80),
                                    side: BorderSide(
                                        color: CustomColor.backgroundAppbar)
                                    //set border radius more than 50% of height and width to make circle
                                    ),
                                child: Column(
                                  children: [
                                    ListTile(
                                      leading: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            "UserName",
                                            style: TextStyle(
                                              color: Colors.orangeAccent,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      title: Text(
                                        "${controller.user.value.tenTaixe}",
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            "Phone",
                                            style: TextStyle(
                                              color: Colors.orangeAccent,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      title: Text(
                                        "${controller.user.value.phone}",
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                    ListTile(
                                      leading: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            "Email",
                                            style: TextStyle(
                                              color: Colors.orangeAccent,
                                              fontSize: 15,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                        ],
                                      ),
                                      title: Text(
                                        "${controller.user.value.email}",
                                        style: TextStyle(
                                          color: Theme.of(context).primaryColor,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              )
                      ],
                    ),
                  ),
                  ListTile(
                    leading: Text(
                      "Chức năng",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Theme.of(context).primaryColor,
                      ),
                    ),
                  ),
                  Card(
                    shape: const RoundedRectangleBorder(
                      side: BorderSide(
                        color: Colors.orangeAccent,
                      ),
                    ),
                    child: ListTile(
                      leading: const Icon(Icons.light_mode),
                      title: const Text("Change mode light"),
                      trailing: CupertinoSwitch(
                        activeColor: Colors.amber,
                        value: controller.switchValue.value,
                        onChanged: (value) {
                          controller.switchValue.value = value;
                          controller.switchLight(value);
                          print(value);
                        },
                      ),
                    ),
                  ),
                  // Card(
                  //   shape: const RoundedRectangleBorder(
                  //     side: BorderSide(
                  //       color: Colors.orangeAccent,
                  //     ),
                  //   ),
                  //   child: ListTile(
                  //     leading: const Icon(Icons.language),
                  //     title: const Text("Change language"),
                  //     trailing: CupertinoSwitch(
                  //       activeColor: Colors.amber,
                  //       value: controller.switchLanguage.value,
                  //       onChanged: (value) {
                  //         controller.switchLanguage.value = value;
                  //         controller.switchLanguag();
                  //       },
                  //     ),
                  //   ),
                  // ),
                  const Divider(
                    height: 1,
                    indent: 10,
                    endIndent: 10,
                    color: Colors.orangeAccent,
                    thickness: 1,
                  ),
                  ListTile(
                    onTap: () {
                      postLogout();
                    },
                    leading: const Icon(
                      Icons.logout,
                      color: Colors.redAccent,
                    ),
                    title: const Text(
                      "Đăng xuất",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.redAccent,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  postLogout() async {
    SharedPreferences pref = await SharedPreferences.getInstance();
    await pref.remove(AppConstants.KEY_ACCESS_TOKEN);

    Get.toNamed(Routes.LOGIN_PAGE);
  }
}
