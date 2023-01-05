import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/sercurity/controller/sercurity_controller.dart';
import 'package:tbs_logistics_dangtai/config/model/list_traking_model.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/widget/sercurity/custom_list_title_registed.dart';

class SercurityScreen extends StatelessWidget {
  const SercurityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<SercurityController>(
      init: SercurityController(),
      builder: (controller) => FutureBuilder(
          future: controller.getListRegisted(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var items = snapshot.data as List<ListTrackingModel>;
              return Container(
                decoration: const BoxDecoration(
                  gradient: CustomColor.gradient,
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    SizedBox(
                      height: 60,
                      width: size.width,
                      child: const Center(
                        child: Text(
                          "Danh sách tài xế đã đăng ký",
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      child: ListView.builder(
                          itemCount: items.length,
                          itemBuilder: (context, index) {
                            return CustomListTitleRegisted(
                              stt: '${index + 1}',
                              name: '${items[index].taixeRe!.tenTaixe}',
                              // cccd: '${items[index].taixeRe!.CCCD}',
                              phone: '${items[index].taixeRe!.phone}',
                              itemstype:
                                  '${items[index].loaihang!.tenLoaiHang}',
                              warehome: '${items[index].phieuvao!.kho}',
                              onTap: () {},
                            );
                          }),
                    ),
                  ],
                ),
              );
            }
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.orangeAccent,
              ),
            );
          }),
    );
  }
}
