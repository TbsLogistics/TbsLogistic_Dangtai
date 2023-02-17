import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/driver/controller/status_ticker_controller.dart';

class StatusTickerBindings extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<StatusTickerController>(() => StatusTickerController());
  }
}
