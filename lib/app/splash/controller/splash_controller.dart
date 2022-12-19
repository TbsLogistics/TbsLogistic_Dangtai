import 'package:get/get.dart';
import 'package:get/state_manager.dart';
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
    print(role);
    if (token != null) {
      if (role == "TX") {
        Get.toNamed(Routes.DRIVER_PAGE);
      } else if (role == "KH") {
        Get.toNamed(Routes.CUSTOMER_PAGE);
      }
      // checkPage();
    } else {
      Get.toNamed(Routes.LOGIN_PAGE);
    }
  }
}
