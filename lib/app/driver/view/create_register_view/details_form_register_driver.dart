import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/driver/model/register_driver_model.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';
import 'package:tbs_logistics_dangtai/config/routes/pages.dart';
import 'package:tbs_logistics_dangtai/config/widget/custom_text_fiels.dart';

class DetailsFormRegisterDriver extends StatefulWidget {
  const DetailsFormRegisterDriver({super.key});

  @override
  State<DetailsFormRegisterDriver> createState() =>
      _DetailsFormRegisterDriverState();
}

class _DetailsFormRegisterDriverState extends State<DetailsFormRegisterDriver> {
  final String routes = "/DETAILS_FORM_REGISTER_DRIVER";
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    var items = Get.arguments as RegisterForDriverModel;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: CustomColor.backgroundAppbar,
        title: const Text(
          "Chi tiết phiếu đã đăng ký",
          style: CustomTextStyle.tilteAppbar,
        ),
        centerTitle: true,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
            onPressed: () {
              Get.toNamed(Routes.DRIVER_PAGE);
            },
            icon: const Icon(
              Icons.home,
              size: 25,
              color: Colors.white,
            ),
          ),
        ],
      ),
      body: SingleChildScrollView(
          child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 15),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: const [
                Expanded(
                  child: CustomTextField(
                    title: 'Ngày vào dự kiến',
                    content: '24/12/2022',
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    title: 'Giờ vào dự kiến',
                    content: '12: 35 AM',
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomTextField(
                    title: 'Loại xe',
                    content: '${items.loaixe}',
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    title: 'Số xe',
                    content: '${items.soxe}',
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomTextField(
                    title: 'Loại hàng',
                    content: '${items.maloaiHang}',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Divider(
              indent: size.width * 0.2,
              endIndent: size.width * 0.2,
              height: 2,
              thickness: 2,
              color: Colors.black.withOpacity(0.2),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomTextField(
                    title: 'Số cont 1',
                    content: '${items.socont1}',
                  ),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomTextField(
                    title: 'Số Book',
                    content: '${items.soBook}',
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    title: 'Số Kiện',
                    content: '${items.soKien}',
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    title: 'Số Khối',
                    content: '${items.sokhoi}',
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomTextField(
                    title: 'Số Seal 1',
                    content: '${items.cont1seal1}',
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    title: 'Số Seal 2',
                    content: '${items.cont1seal2}',
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Divider(
              indent: size.width * 0.2,
              endIndent: size.width * 0.2,
              height: 2,
              thickness: 2,
              color: Colors.black.withOpacity(0.2),
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomTextField(
                    title: 'Số cont 2',
                    content: '${items.socont2}',
                  ),
                ),
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomTextField(
                    title: 'Số Book',
                    content: '${items.soBook1}',
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    title: 'Số Kiện',
                    content: '${items.sokien1}',
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    title: 'Số Khối',
                    content: '${items.sokhoi1}',
                  ),
                )
              ],
            ),
            const SizedBox(height: 10),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Expanded(
                  child: CustomTextField(
                    title: 'Số Seal 1',
                    content: '${items.cont2seal1}',
                  ),
                ),
                Expanded(
                  child: CustomTextField(
                    title: 'Số Seal 2',
                    content: '${items.cont2seal2}',
                  ),
                )
              ],
            ),
          ],
        ),
      )),
    );
  }
}
