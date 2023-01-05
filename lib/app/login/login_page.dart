import 'package:flutter/material.dart';
import 'package:get/state_manager.dart';
import 'package:tbs_logistics_dangtai/app/login/controller/login_controller.dart';
import 'package:tbs_logistics_dangtai/app/login/widgets/password_form_field.dart';
import 'package:tbs_logistics_dangtai/app/login/widgets/sign_in_field.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';
import 'package:tbs_logistics_dangtai/config/core/data/validate.dart';
import 'package:tbs_logistics_dangtai/config/widget/button_form_login.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final String routes = "/LOGIN_PAGE";

  final _formKey = GlobalKey<FormState>();
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) => Scaffold(
        // resizeToAvoidBottomInset: false,
        body: SingleChildScrollView(
          child: Container(
            height: size.height,
            decoration: const BoxDecoration(
              gradient: CustomColor.gradient,
            ),
            child: Form(
              key: _formKey,
              autovalidateMode: AutovalidateMode.always,
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
                  SignInField(
                    controller: accountController,
                    validator: (value) => Validate().username(value),
                    // validator: (value) {},
                    decoration:
                        CustomTextStyle.textFormFieldStyle("Tài khoản", ""),
                  ),
                  PasswordTextField(
                    controller: passwordController,
                    validator: (value) => Validate().password(value),
                    // validator: (value) {},
                  ),
                  ButtonFormLogin(onPressed: () {
                    _signUpProcess(context, controller);
                  }),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _signUpProcess(BuildContext context, LoginController controller) {
    var validate = _formKey.currentState!.validate();

    if (!validate) {
      controller.getLogin(
        accountController.text,
        passwordController.text,
      );
    }
  }

  @override
  void dispose() {
    // Clean up the controller when the widget is removed from the widget tree.
    // This also removes the _printLatestValue listener.
    accountController.dispose();
    passwordController.dispose();
    super.dispose();
  }
}
