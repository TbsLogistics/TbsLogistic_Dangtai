import 'package:get/get.dart';

import 'package:tbs_logistics_dangtai/config/routes/pages.dart';
import 'package:tbs_logistics_dangtai/config/share_preferences/share_prefer.dart';

class SplashController extends GetxController {
  @override
  void onInit() {
    super.onInit();
    Future.delayed(const Duration(seconds: 2), () => checkUserStatus());
  }

  checkUserStatus() async {
    var token = await SharePerApi().getToken();
    var role = await SharePerApi().getRole();
    var bophan = await SharePerApi().getIdBophan();
    // print(bophan);
    // print(role);
    if (token != null) {
      if (role == "TX") {
        Get.toNamed(Routes.DRIVER_PAGE);
      } else if (role == "KH") {
        Get.toNamed(Routes.CUSTOMER_PAGE);
      } else if (role == "NV") {
        if (bophan == "BV") {
          Get.toNamed(Routes.SERCURITY_PAGE);
        } else if (bophan == "DP") {
          Get.toNamed(Routes.COORDINATOR_PAGE);
        } else if (bophan == "TL") {
          Get.toNamed(Routes.TALLYMAN_PAGE);
        } else {
          Get.toNamed(Routes.LOGIN_PAGE);
        }
      } else {
        Get.toNamed(Routes.LOGIN_PAGE);
      }
      // checkPage();
    } else {
      Get.toNamed(Routes.LOGIN_PAGE);
    }
  }
}
