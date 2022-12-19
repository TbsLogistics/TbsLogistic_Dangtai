import 'package:flutter/material.dart';
import 'package:get/get_state_manager/src/simple/get_state.dart';
import 'package:tbs_logistics_dangtai/app/customer/controller/customer_controller.dart';
import 'package:tbs_logistics_dangtai/app/customer/view/customer_screen.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';
import 'package:tbs_logistics_dangtai/config/share_preferences/share_prefer.dart';

class CustomerPage extends StatefulWidget {
  CustomerPage({Key? key}) : super(key: key);

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  final String routes = "/CUSTOMER_PAGE";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerController>(
        init: CustomerController(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                // automaticallyImplyLeading: false,
                title: const Text(
                  "TBS Logistics",
                  style: CustomTextStyle.tilteAppbar,
                ),
                centerTitle: true,
                backgroundColor: CustomColor.backgroundAppbar,
              ),
              drawer: Drawer(
                child: _drawer(),
              ),
              body: CustomerScreen(),
            ));
  }

  Widget _drawer() {
    return Container(
      decoration: BoxDecoration(gradient: CustomColor.gradient),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          ListTile(
            onTap: () {
              SharePerApi().postLogout();
            },
            leading: const Icon(Icons.logout_rounded),
            title: const Text(
              "Đăng xuất",
              style: TextStyle(
                color: Colors.black,
                fontSize: 16,
              ),
            ),
          ),
        ],
      ),
    );
  }

  void closeDrawer() {
    if (_scaffoldKey.currentState != null) {
      if (_scaffoldKey.currentState!.isDrawerOpen) {
        _scaffoldKey.currentState!.closeDrawer();
      } else if (_scaffoldKey.currentState!.isEndDrawerOpen) {
        _scaffoldKey.currentState!.closeEndDrawer();
      }
    }
  }
}
