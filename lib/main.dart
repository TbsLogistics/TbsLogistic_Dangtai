import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tbs_logistics_dangtai/app/splash/controller/splash_binding.dart';
import 'package:tbs_logistics_dangtai/app/splash/view/splash_screen.dart';
import 'package:tbs_logistics_dangtai/config/core/constants/constants.dart';
import 'package:tbs_logistics_dangtai/config/core/language/locale.dart';
import 'package:tbs_logistics_dangtai/config/core/theme/theme_provider.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';

void main() async {
  HttpOverrides.global = MyHttpOverrides();
  await GetStorage.init('MyStorage');
  final box = GetStorage('MyStorage');
  String? mode = box.read(AppConstants.THEME_KEY);
  bool isLightMode = (mode != null && mode == "light");
  var locale = const Locale('vi', 'VN');
  Get.updateLocale(locale);
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      translations: Messages(),
      locale: locale,
      themeMode: isLightMode ? ThemeMode.light : ThemeMode.dark,
      theme: MyThemes.lightTheme,
      darkTheme: MyThemes.lightTheme,
      defaultTransition: Transition.fade,
      initialBinding: SplashBinding(),
      initialRoute: Routes.SPLASH,
      getPages: AppPages.pages,
      home: const SplashScreen(),
    ),
  );
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..badCertificateCallback =
          (X509Certificate cert, String host, int port) => true;
  }
}
