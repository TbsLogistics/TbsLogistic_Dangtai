// ignore_for_file: constant_identifier_names

part of "pages.dart";

abstract class Routes {
  //Đăng nhập
  static const LOGIN_PAGE = "/LOGIN_PAGE";
  //Splash
  static const SPLASH = "/SPLASH";
  //Tài xế
  static const DRIVER_PAGE = "/DRIVER_PAGE";
  static const CREATE_REGISTER_DRIVER = "/CREATE_REGISTER_DRIVER";
  static const DETAILS_FORM_REGISTER_DRIVER = "/DETAILS_FORM_REGISTER_DRIVER";
  static const QR_CODE_SCREEN = "/QR_CODE_SCREEN";
  static const REGISTER_OUT_SCREEN = "/REGISTER_OUT_SCREEN";
  //Khách hàng
  static const CUSTOMER_PAGE = "/CUSTOMER_PAGE";
  static const LIST_DRIVER_BY_CUSTOMER = "/LIST_DRIVER_BY_CUSTOMER";
  static const REGISTER_CUSTOMER = "/REGISTER_CUSTOMER";
  static const REGISTER_OUT_DETAILS_SCREEN = "/REGISTER_OUT_DETAILS_SCREEN";
  static const DETAILS_REGISTER_CUSTOMER = "/DETAILS_REGISTER_CUSTOMER";
  static const CUSTOMER_DETAILS_INFO_DRIVER = "/CUSTOMER_DETAILS_INFO_DRIVER";
  static const LIST_TICKER_CUSTOMER = "/LIST_TICKER_CUSTOMER";
  static const DETAILS_LIST_TICKER_OF_CUSTOMER =
      "/DETAILS_LIST_TICKER_OF_CUSTOMER";
  //Điều phối
  static const COORDINATOR_PAGE = "/COORDINATOR_PAGE";
  static const DETAILS_WAREHOME_SCREEN = "/DETAILS_WAREHOME_SCREEN";
  //Tallyman
  static const TALLYMAN_PAGE = "/TALLYMAN_PAGE";
  static const LIST_TEAM_DETAILS_OF_TALLYMAN = "/LIST_TEAM_DETAILS_OF_TALLYMAN";
  static const LIST_TEAM_OF_TALLYMAN = "/LIST_TEAM_OF_TALLYMAN";
  // static const TALLYMAN_SEARCH_WORKING = "/TALLYMAN_SEARCH_WORKING";
  static const TALLYMAN_LIST_CAR_WORKING = "/TALLYMAN_LIST_CAR_WORKING";
  //Leader hiện trường
  //admin
  //Bảo vệ
  static const SERCURITY_PAGE = "/SERCURITY_PAGE";
}
