import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/coordinators/controller/coordinator_controller.dart';

class CoordinatorBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<CoordinatorController>(() => CoordinatorController());
  }
}
