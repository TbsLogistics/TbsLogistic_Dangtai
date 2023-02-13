import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/view/change_password/controller/change_password_controller.dart';

class ChangePasswordBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ChangePasswordTallymanController>(
        () => ChangePasswordTallymanController());
  }
}
