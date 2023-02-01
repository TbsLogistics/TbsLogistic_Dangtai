import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/customer/controller/customer_controller.dart';
import 'package:tbs_logistics_dangtai/app/customer/view/customer_screen.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';

class CustomerPage extends StatefulWidget {
  const CustomerPage({Key? key}) : super(key: key);

  @override
  State<CustomerPage> createState() => _CustomerPageState();
}

class _CustomerPageState extends State<CustomerPage> {
  final String routes = "/CUSTOMER_PAGE";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<CustomerController>(
      init: CustomerController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          automaticallyImplyLeading: false,
          title: Text(
            "TBS Logistics",
            style: TextStyle(
              color: Theme.of(context).primaryColorLight,
            ),
          ),
          centerTitle: true,
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          actions: [
            IconButton(
              onPressed: () {
                Get.toNamed(Routes.CUSTOMER_SETTINGS);
              },
              icon: Icon(
                Icons.settings,
                color: Theme.of(context).primaryColorLight,
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
