import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/coordinators/coordinators_page.dart';
import 'package:tbs_logistics_dangtai/app/coordinators/view/coordinator_details_warehome_screen.dart';
import 'package:tbs_logistics_dangtai/app/customer/customer_page.dart';

import 'package:tbs_logistics_dangtai/app/customer/view/list_driver/customer_details_info_driver.dart';

import 'package:tbs_logistics_dangtai/app/customer/view/list_driver/list_driver_by_customer.dart';
import 'package:tbs_logistics_dangtai/app/customer/view/list_registed_of_customer/details_list_ticker_customer.dart';

import 'package:tbs_logistics_dangtai/app/customer/view/list_registed_of_customer/list_ticker_customer.dart';
import 'package:tbs_logistics_dangtai/app/customer/view/register_for_driver/create_register_driver_by_customer.dart';
import 'package:tbs_logistics_dangtai/app/customer/view/register_for_driver/customer_details_register.dart';
import 'package:tbs_logistics_dangtai/app/customer/view/settings/settings_customer_page.dart';
import 'package:tbs_logistics_dangtai/app/driver/driver_page.dart';
import 'package:tbs_logistics_dangtai/app/driver/view/create_register_out_view/register_out_details_screen.dart';
import 'package:tbs_logistics_dangtai/app/driver/view/create_register_out_view/register_out_screen.dart';
import 'package:tbs_logistics_dangtai/app/driver/view/create_register_view/details_form_register_driver.dart';
import 'package:tbs_logistics_dangtai/app/driver/view/status_tiker_view/status_ticker_details_view.dart';
import 'package:tbs_logistics_dangtai/app/login/controller/login_bindings.dart';

import 'package:tbs_logistics_dangtai/app/driver/view/qr_code_screen.dart';
import 'package:tbs_logistics_dangtai/app/login/login_page_main.dart';
import 'package:tbs_logistics_dangtai/app/sercurity/sercurity_page.dart';
import 'package:tbs_logistics_dangtai/app/splash/controller/splash_binding.dart';
import 'package:tbs_logistics_dangtai/app/splash/view/splash_screen.dart';

import 'package:tbs_logistics_dangtai/app/tallyman/tallyman_page.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/view/list_finished_working/view/list_finished_working.dart';

import 'package:tbs_logistics_dangtai/app/tallyman/view/list_team_of_tallyman/list_team_details_of_tallyman.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/view/list_team_of_tallyman/list_team_of_tallyman.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/view/ware_home/tallyman_details_warehome_screen.dart';
import 'package:tbs_logistics_dangtai/app/tallyman/view/ware_home/tallyman_ware_home.dart';

import '../../app/driver/view/create_register_view/create_register_screen.dart';
import '../../app/tallyman/view/list_finished_working/view/list_finished_details_working.dart';
import '../../app/tallyman/view/settings/tallyman_settings_page.dart';

part './routes.dart';

abstract class AppPages {
  static final pages = [
    //Đăng nhập
    GetPage(
      name: Routes.LOGIN_PAGE,
      // page: () => const LoginPage(),
      page: () => LoginPage(),

      bindings: [LoginBindings()],
    ),
    //Splash
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashScreen(),
      binding: SplashBinding(),
    ),
    //Tài xế
    GetPage(
      name: Routes.DRIVER_PAGE,
      page: () => const DriverPage(),
    ),
    GetPage(
      name: Routes.DETAILS_FORM_REGISTER_DRIVER,
      page: () => const DetailsFormRegisterDriver(),
    ),
    GetPage(
      name: Routes.CREATE_REGISTER_DRIVER,
      page: () => const RegisterFormScreen(),
    ),
    GetPage(
      name: Routes.REGISTER_OUT_SCREEN,
      page: () => RegisterOutScreen(),
    ),
    GetPage(
        name: Routes.REGISTER_OUT_DETAILS_SCREEN,
        page: () => const RegisterOutDetailsScreen()),
    GetPage(
      name: Routes.STATUS_TICKER_DETAIL_SCREEN,
      page: () => const StatusTikerDetailScreen(),
    ),
    //Khách hàng
    GetPage(
      name: Routes.LIST_DRIVER_BY_CUSTOMER,
      page: () => const ListDriverByCustomer(),
    ),
    GetPage(
      name: Routes.QR_CODE_SCREEN,
      page: () => const QrCodeScreen(),
    ),
    GetPage(
      name: Routes.CUSTOMER_PAGE,
      page: () => const CustomerPage(),
    ),
    GetPage(
      name: Routes.REGISTER_CUSTOMER,
      page: () => const RegisterCustomer(),
    ),
    GetPage(
      name: Routes.DETAILS_REGISTER_CUSTOMER,
      page: () => const DetailsRegisterCustomer(),
    ),
    GetPage(
      name: Routes.CUSTOMER_DETAILS_INFO_DRIVER,
      page: () => const CustomerDetailsInfoDriver(),
    ),
    GetPage(
      name: Routes.LIST_TICKER_CUSTOMER,
      page: () => const ListTickerCustomer(),
    ),
    GetPage(
      name: Routes.DETAILS_LIST_TICKER_OF_CUSTOMER,
      page: () => const DetailsListTickerOfCustomer(),
    ),
    GetPage(
      name: Routes.CUSTOMER_SETTINGS,
      page: () => const CustomerSettings(),
    ),
    //Điều phối
    GetPage(
      name: Routes.COORDINATOR_PAGE,
      page: () => const CoordinatorPage(),
    ),
    GetPage(
      name: Routes.DETAILS_WAREHOME_SCREEN,
      page: () => const DetailsWareHomeScreen(),
    ),
    //Tallyman
    GetPage(
      name: Routes.TALLYMAN_PAGE,
      page: () => const TallymanPage(),
    ),
    GetPage(
      name: Routes.LIST_TEAM_DETAILS_OF_TALLYMAN,
      page: () => ListTeamDetailsOfTallyman(),
    ),
    GetPage(
      name: Routes.LIST_TEAM_OF_TALLYMAN,
      page: () => const ListTeamOfTallyman(),
    ),
    GetPage(
      name: Routes.TALLYMAN_WAREHOME_SCREEN,
      page: () => const TallymanWareHomeScreen(),
    ),
    GetPage(
      name: Routes.TALLYMAN_DETAILS_WAREHOME_SCREEN,
      page: () => TallymanDetailsWarehomeScreen(),
    ),
    GetPage(
      name: Routes.LIST_FINISHED_WORKING,
      page: () => const ListFinishedWorking(),
    ),
    GetPage(
      name: Routes.LIST_FINISHED_DETAILS_WORKING,
      page: () => ListFinishedDetailsWorking(),
    ),
    GetPage(
      name: Routes.TALLYMAN_SETTINGS,
      page: () => const TallymanSettings(),
    ),
    // GetPage(
    //   name: Routes.TALLYMAN_SEARCH_WORKING,
    //   page: () =>  showSearch(context: context, delegate: SearchTallymanWorking()),
    // ),
    //Leader hiện trường
    //admin
    //Bảo vệ
    GetPage(
      name: Routes.SERCURITY_PAGE,
      page: () => const SercurityPage(),
    ),
  ];
}
