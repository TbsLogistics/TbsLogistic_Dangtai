import 'package:flutter/material.dart';
import 'package:tbs_logistics_dangtai/app/driver/view/driver_screen.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';
import 'package:tbs_logistics_dangtai/config/share_preferences/share_prefer.dart';

class DriverPage extends StatefulWidget {
  const DriverPage({super.key});

  @override
  State<DriverPage> createState() => _DriverPageState();
}

class _DriverPageState extends State<DriverPage> {
  final String routes = "/DRIVER_PAGE";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "TBS Logistic",
          style: CustomTextStyle.tilteAppbar,
        ),
        centerTitle: true,
        backgroundColor: CustomColor.backgroundAppbar,
      ),
      drawer: Drawer(
        child: _drawer(),
      ),
      body: const DriverScreen(),
    );
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
