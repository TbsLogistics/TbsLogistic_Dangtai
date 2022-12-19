import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tbs_logistics_dangtai/app/customer/controller/customer_controller.dart';
import 'package:tbs_logistics_dangtai/app/customer/model/list_driver_by_customer_model.dart';
import 'package:tbs_logistics_dangtai/app/customer/model/register_customer_model.dart';
import 'package:tbs_logistics_dangtai/app/customer/view/list_driver_by_customer.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';
import 'package:tbs_logistics_dangtai/config/core/data/text_style.dart';
import 'package:tbs_logistics_dangtai/config/model/list_driver_model.dart';
import 'package:tbs_logistics_dangtai/config/widget/buttom_form_submit.dart';
import 'package:tbs_logistics_dangtai/config/widget/custom_text_form_fiels.dart';
import 'package:tbs_logistics_dangtai/config/widget/drop_button.dart';

class RegisterCustomer extends StatefulWidget {
  const RegisterCustomer({Key? key}) : super(key: key);

  @override
  State<RegisterCustomer> createState() => _RegisterCustomerState();
}

class _RegisterCustomerState extends State<RegisterCustomer> {
  final String routes = "/REGISTER_CUSTOMER";
  ListDriverByCustomerModel? selectedTaixe;
  String? selectedTeamCar;
  String? selectedCar;
  String? selectedWarehome;
  String? selectedNumberCont;
  ListDriverByCustomerModel? selectedKhachhang;
  int numberSelectCont = 0;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<CustomerController>(
        init: CustomerController(),
        builder: (controller) => Scaffold(
              appBar: AppBar(
                backgroundColor: CustomColor.backgroundAppbar,
                title: const Text(
                  "TBS Logistics",
                  style: CustomTextStyle.tilteAppbar,
                ),
                centerTitle: true,
                leading: IconButton(
                  onPressed: () {
                    Get.back();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_new_outlined,
                    size: 24,
                    color: Colors.white,
                  ),
                ),
              ),
              body: Container(
                height: size.height,
                decoration: BoxDecoration(
                  gradient: CustomColor.gradient,
                ),
                padding: EdgeInsets.symmetric(vertical: 15, horizontal: 10),
                child: SingleChildScrollView(
                  child: Container(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        SizedBox(
                          height: 100,
                          child: Column(
                            children: [
                              Container(
                                padding: const EdgeInsets.only(left: 5),
                                child: Row(
                                  children: const [
                                    Text(
                                      "Tài xế *",
                                      textAlign: TextAlign.left,
                                      style: TextStyle(
                                        color: Colors.blueGrey,
                                        fontSize: 16,
                                      ),
                                    )
                                  ],
                                ),
                              ),
                              const SizedBox(height: 10),
                              Row(
                                children: [
                                  Expanded(
                                    child: Container(
                                      child: Theme(
                                        data: ThemeData(
                                          inputDecorationTheme:
                                              const InputDecorationTheme(
                                                  border: InputBorder.none),
                                        ),
                                        child: DropdownSearch<
                                            ListDriverByCustomerModel>(
                                          asyncItems: (String? query) {
                                            return controller.getData(query);
                                          },
                                          popupProps: PopupPropsMultiSelection
                                              .modalBottomSheet(
                                            showSelectedItems: true,
                                            itemBuilder:
                                                _customPopupItemBuilderExample2,
                                            showSearchBox: true,
                                          ),
                                          compareFn: (item, sItem) {
                                            return item.maTaixe ==
                                                sItem.maTaixe;
                                          },
                                          onChanged: (ListDriverByCustomerModel?
                                              newValue) {
                                            setState(() {
                                              selectedTaixe = newValue;
                                              print(selectedTaixe!.maTaixe);
                                            });
                                          },
                                          dropdownDecoratorProps:
                                              const DropDownDecoratorProps(
                                            dropdownSearchDecoration:
                                                InputDecoration(
                                              hintText: "Chọn tài xế",
                                              filled: true,
                                              iconColor: Color(0xFFF3BD60),
                                              focusColor: Color(0xFFF3BD60),
                                              fillColor: Colors.white,
                                              focusedBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFFF3BD60),
                                                    width: 1.0),
                                              ),
                                              enabledBorder: OutlineInputBorder(
                                                borderSide: BorderSide(
                                                    color: Color(0xFFF3BD60),
                                                    width: 1.0),
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              )
                            ],
                          ),
                        ),
                        CustomDropdownButton(
                          items: idKho
                              .map((item) => DropdownMenuItem<String>(
                                    value: item["value"],
                                    child: Text(
                                      item["name"],
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            //Do something when changing the item if you want.
                            selectedWarehome = value;
                          },
                          onSaved: (value) {
                            selectedWarehome = value.toString();
                          },
                          text: 'Kho',
                        ),
                        CustomFormFiels(
                          title: "Số xe",
                          controller: controller.numberCar,
                          hintText: "Nhập số xe",
                          icon: Icons.abc,
                        ),
                        CustomDropdownButton(
                          items: genderItems
                              .map((item) => DropdownMenuItem<String>(
                                    value: item["value"],
                                    child: Text(
                                      item["name"],
                                      style: const TextStyle(
                                        fontSize: 14,
                                      ),
                                    ),
                                  ))
                              .toList(),
                          onChanged: (value) {
                            //Do something when changing the item if you want.
                            setState(() {
                              selectedCar = value;
                            });
                            print(selectedCar);
                          },
                          onSaved: (value) {
                            setState(() {
                              selectedCar = value.toString();
                            });
                          },
                          text: 'Loại xe',
                        ),
                        selectedCar == "tai"
                            ? CustomFormFiels(
                                title: "Số seal",
                                controller: controller.numberCont1Seal1,
                                hintText: "Nhập số seal",
                                icon: Icons.abc,
                              )
                            : CustomDropdownButton(
                                items: numberCont
                                    .map((item) => DropdownMenuItem<String>(
                                          value: item["value"],
                                          child: Text(
                                            item["name"],
                                            style: const TextStyle(
                                              fontSize: 14,
                                            ),
                                          ),
                                        ))
                                    .toList(),
                                onChanged: (value) {
                                  //Do something when changing the item if you want.
                                  setState(() {
                                    selectedNumberCont = value;
                                    numberSelectCont =
                                        int.parse("${selectedNumberCont}");
                                  });
                                  print(selectedCar);
                                },
                                onSaved: (value) {
                                  setState(() {
                                    selectedNumberCont = value.toString();
                                  });
                                },
                                text: 'Chọn tổng số cont',
                              ),
                        numberSelectCont >= 1
                            ? _contFirt(controller)
                            : Container(),
                        numberSelectCont >= 2
                            ? _contFirt(controller)
                            : Container(),
                        ButtonFormSubmit(
                            onPressed: () {
                              controller.postRegisterCustomer(
                                numberCar: controller.numberCar.text,
                                numberCont1: controller.numberCont1.text,
                                numberCont1Seal1:
                                    controller.numberCont1Seal1.text,
                                numberCont1Seal2:
                                    controller.numberCont1Seal2.text,
                                numberCont2: controller.numberCont2.text,
                                numberCont2Seal1:
                                    controller.numberCont2Seal1.text,
                                numberCont2Seal2:
                                    controller.numberCont2Seal2.text,
                                numberKhoi: controller.numberKhoi.text,
                                numberKhoi1: controller.numberKhoi1.text,
                                numberKien: controller.numberKien.text,
                                numberKien1: controller.numberKien1.text,
                                numberPO: controller.numberPO.text,
                                numberPO1: controller.numberPO1.text,
                                idCar: selectedCar,
                                idTaixe: numberSelectCont,
                                idKho: selectedWarehome,
                                time: '2022-12-16T03:12:15.644Z',
                              );
                            },
                            text: "Đăng ký")
                      ],
                    ),
                  ),
                ),
              ),
            ));
  }

  Widget _contFirt(CustomerController controller) {
    return Column(
      children: [
        Divider(),
        CustomFormFiels(
          title: "Số cont 1",
          controller: controller.numberCont1,
          hintText: "Nhập số cont",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số seal 1",
          controller: controller.numberCont1Seal1,
          hintText: "Nhập số seal",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số seal 2",
          controller: controller.numberCont1Seal2,
          hintText: "Nhập số seal",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số book",
          controller: controller.numberPO,
          hintText: "Nhập số book",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số kiện",
          controller: controller.numberKien,
          hintText: "Nhập số kiện",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số khối",
          controller: controller.numberKhoi,
          hintText: "Nhập số khối",
          icon: Icons.abc,
        ),
      ],
    );
  }

  Widget _contSecond(CustomerController controller) {
    return Column(
      children: [
        Divider(),
        CustomFormFiels(
          title: "Số cont 2",
          controller: controller.numberCont2,
          hintText: "Nhập số cont",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số seal 1",
          controller: controller.numberCont2Seal1,
          hintText: "Nhập số seal",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số seal 2",
          controller: controller.numberCont2Seal2,
          hintText: "Nhập số seal",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số book",
          controller: controller.numberPO1,
          hintText: "Nhập số book",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số kiện",
          controller: controller.numberKien1,
          hintText: "Nhập số kiện",
          icon: Icons.abc,
        ),
        CustomFormFiels(
          title: "Số khối",
          controller: controller.numberKhoi1,
          hintText: "Nhập số khối",
          icon: Icons.abc,
        ),
      ],
    );
  }

  Widget _customPopupItemBuilderExample2(
    BuildContext context,
    ListDriverByCustomerModel? item,
    bool isSelected,
  ) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 5),
      child: Card(
        // color: Colors.green,
        shape: RoundedRectangleBorder(
          side: const BorderSide(
            color: Color(0xFFF3BD60),
          ),

          borderRadius: BorderRadius.circular(10.0), //<-- SEE HERE
        ),
        child: ListTile(
          style: ListTileStyle.drawer,
          focusColor: Colors.white,
          title: Text(
            item?.tenTaixe ?? '',
            style: TextStyle(color: Colors.blueGrey),
          ),
          subtitle: Text(item?.phone ?? ''),
          leading: CircleAvatar(
              // this does not work - throws 404 error
              // backgroundImage: NetworkImage(item.avatar ?? ''),
              ),
        ),
      ),
    );
  }

  final List<Map<String, dynamic>> genderItems = [
    {"value": "tai", "name": "Xe tải"},
    {"value": "con", "name": "Xe container"},
  ];

  final List<Map<String, dynamic>> numberCont = [
    {'value': "0", "name": "Xe không có cont"},
    {'value': "1", "name": "Xe có 1 cont"},
    {'value': "2", "name": "Xe có 2 cont"},
  ];

  final List<Map<String, dynamic>> idKho = [
    {"value": "K1", "name": "Kho 1"},
    {"value": "K2", "name": "Kho 2"},
    {"value": "K3", "name": "Kho 3"},
    {"value": "K4", "name": "Kho 4"},
    {"value": "K5", "name": "Kho 5"},
  ];
}
