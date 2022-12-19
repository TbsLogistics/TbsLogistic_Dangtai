import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:tbs_logistics_dangtai/app/splash/controller/splash_binding.dart';
import 'package:tbs_logistics_dangtai/app/splash/view/splash_screen.dart';
import 'package:tbs_logistics_dangtai/config/core/constants/constants.dart';
import 'package:tbs_logistics_dangtai/config/core/theme/theme_provider.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';

void main() async {
  await GetStorage.init('MyStorage');
  final box = GetStorage('MyStorage');
  String? mode = box.read(AppConstants.THEME_KEY);
  bool isLightMode = (mode != null && mode == "light");
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
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
