import 'package:get/instance_manager.dart';
import 'package:tbs_logistics_dangtai/app/splash/controller/splash_controller.dart';

class SplashBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SplashController>(() => SplashController());
  }
}
