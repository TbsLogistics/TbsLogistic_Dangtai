import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/customer/view/change_password_/controller/change_password_controller.dart';

class ChangePasswordCustomerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ChangePasswordCustomerController());
  }
}
