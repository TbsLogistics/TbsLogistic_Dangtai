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
            title: const Text(
              "Cài đặt",
              style: CustomTextStyle.tilteAppbar,
            ),
            centerTitle: true,
            backgroundColor: CustomColor.backgroundAppbar,
            leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(
                Icons.arrow_back_ios_new_outlined,
                size: 25,
                color: Colors.white,
              ),
            ),
          ),
          body: SingleChildScrollView(
            child: Container(
              decoration: const BoxDecoration(
                gradient: CustomColor.gradient,
              ),
              height: size.height,
              width: size.width,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const ListTile(
                    leading: Text(
                      "Profile",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Obx(
                    () => Column(
                      children: [
                        Card(
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
                                        style: const TextStyle(
                                          color: Colors.black,
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
                                        style: const TextStyle(
                                          color: Colors.black,
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
                                        style: const TextStyle(
                                          color: Colors.black,
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
                  const ListTile(
                    leading: Text(
                      "Chức năng",
                      style: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 18,
                        color: Colors.black,
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.light_mode),
                      title: const Text("Change mode light"),
                      trailing: CupertinoSwitch(
                        activeColor: Colors.amber,
                        value: controller.switchValue.value,
                        onChanged: (value) {
                          controller.switchValue.value = value;
                          controller.switchLight();
                          print(value);
                        },
                      ),
                    ),
                  ),
                  Card(
                    child: ListTile(
                      leading: const Icon(Icons.language),
                      title: const Text("Change language"),
                      trailing: CupertinoSwitch(
                        activeColor: Colors.amber,
                        value: controller.switchLanguage.value,
                        onChanged: (value) {
                          controller.switchLanguage.value = value;
                          controller.switchLanguag();
                        },
                      ),
                    ),
                  ),
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
