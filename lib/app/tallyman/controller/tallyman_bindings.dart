import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/controller/tallyman_controller.dart';

class TallymanBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<TallymanController>(() => TallymanController());
  }
}
