import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/customer/customer_page.dart';
import 'package:tbs_logistics_dangtai/app/customer/view/create_register_driver_by_customer.dart';
import 'package:tbs_logistics_dangtai/app/customer/view/list_driver_by_customer.dart';
import 'package:tbs_logistics_dangtai/app/driver/driver_page.dart';
import 'package:tbs_logistics_dangtai/app/driver/view/create_register_view/create_register_second_screen.dart';
import 'package:tbs_logistics_dangtai/app/login/login_page.dart';
import 'package:tbs_logistics_dangtai/app/splash/controller/splash_binding.dart';
import 'package:tbs_logistics_dangtai/app/splash/controller/splash_controller.dart';
import 'package:tbs_logistics_dangtai/app/splash/view/splash_screen.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = [
    //Đăng nhập
    GetPage(
      name: Routes.LOGIN_PAGE,
      page: () => LoginPage(),
    ),
    //Splash
    GetPage(
      name: Routes.SPLASH,
      page: () => SplashScreen(),
      binding: SplashBinding(),
    ),
    //Tài xế
    GetPage(
      name: Routes.DRIVER_PAGE,
      page: () => DriverPage(),
    ),
    GetPage(
      name: Routes.REGISTER_DRIVER_SECOND_SCREEN,
      page: () => const CreateRegisterSecondScreen(),
    ),
    //Khách hàng
    GetPage(
      name: Routes.LIST_DRIVER_BY_CUSTOMER,
      page: () => const ListDriverByCustomer(),
    ),
    GetPage(
      name: Routes.CUSTOMER_PAGE,
      page: () => CustomerPage(),
    ),
    GetPage(
      name: Routes.REGISTER_CUSTOMER,
      page: () => RegisterCustomer(),
    ),
    //Điều phối
    //Tallyman
    //Leader hiện trường
    //admin
  ];
}
