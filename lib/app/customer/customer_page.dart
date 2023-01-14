import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/customer/controller/customer_controller.dart';
import 'package:tbs_logistics_dangtai/app/customer/view/customer_screen.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';
import 'view/settings/settings_customer_page.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  final String routes = "/CUSTOMER_PAGE";
  final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
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
          actions: [
            IconButton(
              onPressed: () {
                print("object");
                Get.to(() => CustomerSettings());
              },
              icon: const Icon(
                Icons.settings,
                color: Colors.white,
                size: 25,
              ),
            ),
          ],
        ),
        body: const CustomerScreen(),
      ),
    );
  }
}
