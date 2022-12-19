import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:tbs_logistics_dangtai/app/login/controller/login_controller.dart';
import 'package:tbs_logistics_dangtai/app/login/view/login_screen.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String routes = "/LOGIN_PAGE";

  @override
  Widget build(BuildContext context) {
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) => const Scaffold(
        body: LoginScreen(),
      ),
    );
  }
}
