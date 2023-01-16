import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/customer/controller/customer_controller.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';

import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';
import 'package:tbs_logistics_dangtai/config/model/list_traking_model.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';
import 'package:tbs_logistics_dangtai/config/widget/sercurity/custom_list_title_registed.dart';

class ListTickerCustomer extends GetView<CustomerController> {
  final String routes = "/LIST_TICKER_CUSTOMER";

  const ListTickerCustomer({super.key});
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CustomerController>(
      builder: (controller) => Scaffold(
        appBar: AppBar(
          title: const Text(
            "Danh sách phiếu đã đăng ký",
            style: CustomTextStyle.tilteAppbar,
          ),
          leading: IconButton(
              onPressed: () {
                Get.back();
              },
              icon: const Icon(Icons.arrow_back_ios_new)),
          centerTitle: true,
          backgroundColor: CustomColor.backgroundAppbar,
        ),
        body: FutureBuilder(
            future: controller.getListRegistedCustomer(),
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                var items = snapshot.data as List<ListTrackingModel>;
                return ListView.builder(
                  itemCount: items.length,
                  itemBuilder: (context, index) => CustomListTitleRegisted(
                    stt: "${index + 1}",
                    name: "${items[index].taixeRe!.tenTaixe}",
                    phone: "${items[index].taixeRe!.phone}",
                    warehome: "${items[index].phieuvao!.kho!.tenKho}",
                    itemstype: "${items[index].loaihang!.tenLoaiHang}",
                    onTap: () {
                      Get.toNamed(
                        Routes.DETAILS_LIST_TICKER_OF_CUSTOMER,
                        arguments: items[index],
                      );
                    },
                  ),
                );
              }
              return const Center(
                child: CircularProgressIndicator(
                  color: Colors.orangeAccent,
                ),
              );
            }),
      ),
    );
  }
}
