import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/login/controller/login_controller.dart';
import 'package:tbs_logistics_dangtai/config/core/data/validate.dart';

class LoginPageMain extends GetView<LoginController> {
  LoginPageMain({super.key});
  final String routes = "/LOGIN_PAGE";
  TextEditingController accountController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<LoginController>(
      init: LoginController(),
      builder: (controller) {
        return SafeArea(
          child: Scaffold(
            resizeToAvoidBottomInset: true,
            body: Form(
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
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.1, vertical: 10),
                    child: TextFormField(
                      controller: accountController,
                      validator: (value) => Validate().username(value),
                      decoration: const InputDecoration(
                        icon: Icon(Icons.person),
                        hintText: "Tài khoản",
                        alignLabelWithHint: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        labelStyle: TextStyle(color: Colors.black),
                        floatingLabelStyle:
                            TextStyle(color: Colors.black, fontSize: 20),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.greenAccent,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.orangeAccent, width: 2),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.width * 0.025),
                  Padding(
                    padding: EdgeInsets.symmetric(
                        horizontal: size.width * 0.1, vertical: 10),
                    child: TextFormField(
                      controller: passwordController,
                      validator: (value) => Validate().password(value),
                      decoration: const InputDecoration(
                        icon: Icon(Icons.lock),
                        hintText: "Mật khẩu",
                        alignLabelWithHint: true,
                        contentPadding: EdgeInsets.symmetric(vertical: 10),
                        labelStyle: TextStyle(color: Colors.black),
                        floatingLabelStyle:
                            TextStyle(color: Colors.black, fontSize: 20),
                        enabledBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.greenAccent,
                          ),
                        ),
                        errorBorder: UnderlineInputBorder(
                          borderSide: BorderSide(
                            color: Colors.redAccent,
                          ),
                        ),
                        focusedBorder: UnderlineInputBorder(
                          borderSide:
                              BorderSide(color: Colors.orangeAccent, width: 2),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: size.width * 0.05),
                  Container(
                    margin: EdgeInsets.symmetric(
                        horizontal: size.width * 0.05,
                        vertical: size.width * 0.025),
                    decoration: BoxDecoration(
                      color: Colors.orangeAccent.withOpacity(0.8),
                      border: Border.all(
                        width: 1,
                        color: Colors.orangeAccent.withOpacity(0.4),
                      ),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20.0),
                      ),
                    ),
                    width: size.width * 0.8,
                    height: 60,
                    child: TextButton(
                      onPressed: () {
                        // controller.getLogin(
                        //   accountController.text,
                        //   passwordController.text,
                        // );
                        _signUpProcess(context, controller);
                      },
                      child: const Text(
                        "Đăng nhập",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                  Expanded(child: Container()),
                ],
              ),
            ),
          ),
        );
      },
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
}
