import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/sercurity/controller/sercurity_controller.dart';

class SercurityBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SercurityController>(() => SercurityController());
  }
}
