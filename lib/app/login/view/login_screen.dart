import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:tbs_logistics_dangtai/app/login/controller/login_controller.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/widget/button_form_login.dart';
import 'package:tbs_logistics_dangtai/config/widget/custom_text_form_field_password.dart';
import 'package:tbs_logistics_dangtai/config/widget/custom_text_form_fiels.dart';
import 'package:tbs_logistics_dangtai/config/widget/custom_text_form_fiels_account.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final String routes = "/login_screen";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<LoginController>(
        init: LoginController(),
        builder: (controller) {
          return Scaffold(
            body: SingleChildScrollView(
              child: Container(
                height: size.height,
                decoration: const BoxDecoration(
                  gradient: CustomColor.gradient,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Container(
                      height: size.height * 0.3,
                      width: size.width,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.only(
                          bottomLeft: Radius.circular(30),
                          bottomRight: Radius.circular(30),
                        ),
                        image: DecorationImage(
                          alignment: Alignment.center,
                          image: AssetImage(
                            "assets/images/background.png",
                          ),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    Container(
                      height: size.height * 0.1,
                      width: size.width,
                      decoration: const BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage("assets/images/logo@2x.png"),
                          fit: BoxFit.contain,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: size.width * 0.05,
                    ),
                    CustomFormFielsAccount(
                      title: "Account",
                      icon: Icons.person,
                      controller: controller.accountController,
                      hintText: 'Enter Account',
                    ),
                    CustomTextFormPassword(
                      hintText: 'Password',
                      icon: Icons.lock,
                      controller: controller.passwordController,
                      title: 'Password',
                    ),
                    ButtonFormLogin(onPressed: () {
                      controller.getLogin(
                        controller.accountController.text,
                        controller.passwordController.text,
                      );
                    }),
                    Expanded(child: Container()),
                  ],
                ),
              ),
            ),
          );
        });
  }
}
