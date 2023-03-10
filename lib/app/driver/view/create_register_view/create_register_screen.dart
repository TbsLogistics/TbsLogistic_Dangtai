import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';
import 'package:tbs_logistics_dangtai/app/driver/controller/register_driver_controller.dart';
import 'package:tbs_logistics_dangtai/app/driver/model/list_customer_for_driver_model.dart';
import 'package:tbs_logistics_dangtai/config/widget/buttom_form_submit.dart';
import 'package:tbs_logistics_dangtai/config/widget/custom_text_form_fiels.dart';
import 'package:tbs_logistics_dangtai/config/widget/drop_button.dart';

class RegisterFormScreen extends StatefulWidget {
  const RegisterFormScreen({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _RegisterFormScreenState createState() => _RegisterFormScreenState();
}

class _RegisterFormScreenState extends State<RegisterFormScreen> {
  final String routes = "/CREATE_REGISTER_DRIVER";
  final formKey = GlobalKey<FormState>();
  ListCustomerForDriverModel? selectedKhachhang;
  String? idKhachhang;
  String? selectedTeamCar;
  String? selectedCar;
  String? selectedWarehome;
  String? selectedNumberCont;
  int numberSelectCont = 0;
  String? selectedProduct;
  bool isCheckProduct = false;
  bool isCheckNotProduct = true;

  TextEditingController dateinput = TextEditingController(text: "");
  bool showDateTime = false;
  bool showDate = false;
  bool showTime = false;
  DateTime dateTime = DateTime.now();
  DateTime selectedDate = DateTime.now();
  TimeOfDay selectedTime = TimeOfDay.now();

  Future<DateTime> _selectDate(BuildContext context) async {
    final selected = await showDatePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            dialogBackgroundColor: Colors.white,
            colorScheme: const ColorScheme.light(
              primary: Colors.orangeAccent,
              onPrimary: Colors.white,
              onSurface: Colors.blueAccent,
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialDate: selectedDate,
      firstDate: DateTime(2000),
      lastDate: DateTime(2025),
    );
    if (selected != null && selected != selectedDate) {
      setState(() {
        selectedDate = selected;
      });
    }
    return selectedDate;
  }

  Future<TimeOfDay> _selectTime(BuildContext context) async {
    final selected = await showTimePicker(
      builder: (context, child) {
        return Theme(
          data: Theme.of(context).copyWith(
            colorScheme: const ColorScheme.light(
              primary: Colors.orangeAccent,
              onPrimary: Colors.white,
              onSurface: Colors.blueAccent,
              onBackground: Colors.orangeAccent,
              onSurfaceVariant: Colors.black,
            ),
          ),
          child: child!,
        );
      },
      context: context,
      initialTime: selectedTime,
    );
    if (selected != null && selected != selectedTime) {
      setState(() {
        selectedTime = selected;
      });
    }
    return selectedTime;
  }

  Future _selectDateTime(BuildContext context) async {
    final date = await _selectDate(context);
    // ignore: unnecessary_null_comparison
    if (date == null) return;

    // ignore: use_build_context_synchronously
    final time = await _selectTime(context);

    // ignore: unnecessary_null_comparison
    if (time == null) return;
    setState(() {
      dateTime = DateTime(
        date.year,
        date.month,
        date.day,
        time.hour,
        time.minute,
      );
      // ignore: unnecessary_string_interpolations
      dateinput.text = "${getDateTime()}";
      // print(dateinput.text);
    });
  }

  String getDate() {
    // ignore: unnecessary_null_comparison
    if (selectedDate == null) {
      return 'select date';
    } else {
      return DateFormat('MMM d, yyyy').format(selectedDate);
    }
  }

  String getDateTime() {
    // ignore: unnecessary_null_comparison
    if (dateTime == null) {
      return 'select date timer';
    } else {
      return DateFormat('yyyy-MM-dd HH:mm').format(dateTime);
    }
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return GetBuilder<RegisterDriverController>(
      init: RegisterDriverController(),
      builder: (controller) => Scaffold(
        appBar: AppBar(
          backgroundColor: Theme.of(context).scaffoldBackgroundColor,
          leading: IconButton(
            icon: Icon(Icons.arrow_back_ios_new,
                size: 25, color: Theme.of(context).primaryColorLight),
            onPressed: () {
              Get.back();
            },
          ),
          title: Text(
            '????ng k?? phi???u v??o',
            style: TextStyle(color: Theme.of(context).primaryColorLight),
          ),
          centerTitle: true,
        ),
        body: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            // decoration: const BoxDecoration(gradient: CustomColor.gradient),
            child: Form(
              key: formKey,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                children: <Widget>[
                  buildDateTime(size),
                  CustomFormFiels(
                    title: "S??? xe *",
                    controller: controller.numberCar,
                    hintText: "Nh???p s??? xe",
                    icon: Icons.abc,
                    color: Theme.of(context).primaryColorLight,
                  ),
                  SizedBox(
                    height: 100,
                    child: Column(
                      children: [
                        Container(
                          padding: const EdgeInsets.only(left: 5),
                          child: Row(
                            children: [
                              Text(
                                "Kh??ch h??ng *",
                                textAlign: TextAlign.left,
                                style: TextStyle(
                                  color: Theme.of(context).primaryColorLight,
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
                              child: Theme(
                                data: ThemeData(
                                  inputDecorationTheme:
                                      const InputDecorationTheme(
                                          border: InputBorder.none),
                                ),
                                child:
                                    DropdownSearch<ListCustomerForDriverModel>(
                                  asyncItems: (String? query) {
                                    return controller.getData(query);
                                  },
                                  popupProps: PopupProps.dialog(
                                    showSelectedItems: true,
                                    itemBuilder:
                                        _customPopupItemBuilderExample2,
                                    showSearchBox: true,
                                  ),
                                  compareFn: (item, sItem) {
                                    return item.maKhachHang ==
                                        sItem.maKhachHang;
                                  },
                                  onChanged:
                                      (ListCustomerForDriverModel? newValue) {
                                    controller.selectedKhachhang =
                                        newValue!.maKhachHang.toString();
                              
                                  },
                                  dropdownDecoratorProps:
                                      DropDownDecoratorProps(
                                    dropdownSearchDecoration: InputDecoration(
                                      hintText: "Ch???n kh??ch h??ng ",
                                      hintStyle: TextStyle(
                                        color:
                                            Theme.of(context).primaryColorLight,
                                      ),
                                      filled: true,
                                      iconColor: const Color(0xFFF3BD60),
                                      focusColor: const Color(0xFFF3BD60),
                                      // fillColor: Colors.white,
                                      focusedBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFFF3BD60),
                                            width: 1.0),
                                      ),
                                      enabledBorder: const OutlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Color(0xFFF3BD60),
                                            width: 1.0),
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
                      setState(() {
                        selectedWarehome = value;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        selectedWarehome = value.toString();
                      });
                    },
                    text: 'Kho *',
                  ),
                  CustomDropdownButton(
                    items: idProduct
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
                        selectedProduct = value;
                      });
                    },
                    onSaved: (value) {
                      setState(() {
                        selectedProduct = value.toString();
                      });
                    },
                    text: 'Lo???i h??ng *',
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
                    },
                    onSaved: (value) {
                      setState(() {
                        selectedCar = value.toString();
                      });
                    },
                    text: 'Lo???i xe *',
                  ),
                  selectedCar == "tai"
                      ? CustomFormFiels(
                          title: "S??? seal",
                          controller: controller.numberCont1Seal1,
                          hintText: "Nh???p s??? seal",
                          icon: Icons.abc,
                          color: Theme.of(context).primaryColorLight,
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
                                  // ignore: unnecessary_brace_in_string_interps
                                  int.parse("${selectedNumberCont}");
                            });
                          },
                          onSaved: (value) {
                            setState(() {
                              selectedNumberCont = value.toString();
                            });
                          },
                          text: 'Ch???n t???ng s??? cont',
                        ),
                  numberSelectCont >= 1 ? _contFirt(controller) : Container(),
                  numberSelectCont >= 2 ? _contSecond(controller) : Container(),
                  ButtonFormSubmit(
                      onPressed: () {
                        if (dateinput.text == "" ||
                            selectedWarehome!.isEmpty ||
                            selectedCar!.isEmpty ||
                            controller.numberCar.text == "" ||
                            selectedProduct!.isEmpty ||
                            controller.selectedKhachhang.isEmpty) {
                          Get.snackbar(
                            "",
                            "",
                            titleText: const Text(
                              "Th??ng b??o",
                              style: TextStyle(
                                color: Colors.red,
                              ),
                            ),
                            messageText: const Text(
                              "B???n nh???p thi???u th??ng tin *",
                              style: TextStyle(
                                color: Colors.green,
                              ),
                            ),
                          );
                        } else {
                          controller.postRegisterDriver(
                            time: dateinput.text,
                            idWarehome: selectedWarehome,
                            idCar: selectedCar,
                            numberCar: controller.numberCar.text,
                            numberCont1: controller.numberCont1.text,
                            numberCont2: controller.numberCont2.text,
                            numberCont1Seal1: controller.numberCont1Seal1.text,
                            numberCont1Seal2: controller.numberCont1Seal2.text,
                            numberKhoi:
                                double.parse(controller.numberKhoi.text),
                            numberKien:
                                double.parse(controller.numberKien.text),
                            numberBook: controller.numberBook.text,
                            numberCont2Seal1: controller.numberCont2Seal1.text,
                            numberCont2Seal2: controller.numberCont2Seal2.text,
                            numberKhoi1:
                                double.parse(controller.numberKhoi1.text),
                            numberKien1:
                                double.parse(controller.numberKien1.text),
                            numberBook1: controller.numberBook1.text,
                            idProduct: selectedProduct,
                            maKhachHang: controller.selectedKhachhang,
                          );
                        }
                        // print(dateinput.text);
                      },
                      text: "????ng k??")
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }

  Widget _customPopupItemBuilderExample2(
    BuildContext context,
    ListCustomerForDriverModel? item,
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
            item?.tenKhachhang ?? '',
            style: const TextStyle(color: Colors.blueGrey),
          ),
        ),
      ),
    );
  }

  Widget buildDateTime(Size size) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Container(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            children: [
              Text(
                "Th???i gian d??? ki???n *",
                textAlign: TextAlign.left,
                style: TextStyle(
                  color: Theme.of(context).primaryColorLight,
                  fontSize: 16,
                ),
              )
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              // color: Color(0xFFF3BD60),
              color: Colors.orangeAccent,
            ),
            // color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
          ),
          padding: const EdgeInsets.only(top: 10, left: 10),
          height: 60,
          width: size.width - 10,
          margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
          child: TextFormField(
            onTap: () {
              _selectDateTime(context);
              showDateTime = true;
            },
            controller: dateinput,
            decoration: InputDecoration(
              hintText: "Nh???p th???i gian d??? ki???n",
              hintStyle: TextStyle(
                color: Theme.of(context).primaryColorLight,
              ),
              border: InputBorder.none,
              icon: Icon(
                Icons.calendar_month,
                size: 26,
                color: Theme.of(context).primaryColorLight,
              ),
              isDense: true,
            ),
          ),
        ),
      ],
    );
  }

  Widget _contFirt(RegisterDriverController controller) {
    return Column(
      children: [
        const Divider(),
        CustomFormFiels(
          title: "S??? cont 1",
          controller: controller.numberCont1,
          hintText: "Nh???p s??? cont",
          icon: Icons.abc,
          color: Theme.of(context).primaryColorLight,
        ),
        CustomFormFiels(
          title: "S??? seal 1",
          controller: controller.numberCont1Seal1,
          hintText: "Nh???p s??? seal",
          icon: Icons.abc,
          color: Theme.of(context).primaryColorLight,
        ),
        CustomFormFiels(
          title: "S??? seal 2",
          controller: controller.numberCont1Seal2,
          hintText: "Nh???p s??? seal",
          icon: Icons.abc,
          color: Theme.of(context).primaryColorLight,
        ),
        CustomFormFiels(
          title: "S??? book",
          controller: controller.numberBook,
          hintText: "Nh???p s??? book",
          icon: Icons.abc,
          color: Theme.of(context).primaryColorLight,
        ),
        CustomFormFiels(
          title: "S??? ki???n",
          controller: controller.numberKien,
          hintText: "Nh???p s??? ki???n",
          icon: Icons.abc,
          color: Theme.of(context).primaryColorLight,
        ),
        CustomFormFiels(
          title: "S??? kh???i",
          controller: controller.numberKhoi,
          hintText: "Nh???p s??? kh???i",
          icon: Icons.abc,
          color: Theme.of(context).primaryColorLight,
        ),
      ],
    );
  }

  Widget _contSecond(RegisterDriverController controller) {
    return Column(
      children: [
        const Divider(),
        CustomFormFiels(
          title: "S??? cont 2",
          controller: controller.numberCont2,
          hintText: "Nh???p s??? cont",
          icon: Icons.abc,
          color: Theme.of(context).primaryColorLight,
        ),
        CustomFormFiels(
          title: "S??? seal 1",
          controller: controller.numberCont2Seal1,
          hintText: "Nh???p s??? seal",
          icon: Icons.abc,
          color: Theme.of(context).primaryColorLight,
        ),
        CustomFormFiels(
          title: "S??? seal 2",
          controller: controller.numberCont2Seal2,
          hintText: "Nh???p s??? seal",
          icon: Icons.abc,
          color: Theme.of(context).primaryColorLight,
        ),
        CustomFormFiels(
          title: "S??? book",
          controller: controller.numberBook1,
          hintText: "Nh???p s??? book",
          icon: Icons.abc,
          color: Theme.of(context).primaryColorLight,
        ),
        CustomFormFiels(
          title: "S??? ki???n",
          controller: controller.numberKien1,
          hintText: "Nh???p s??? ki???n",
          icon: Icons.abc,
          color: Theme.of(context).primaryColorLight,
        ),
        CustomFormFiels(
          title: "S??? kh???i",
          controller: controller.numberKhoi1,
          hintText: "Nh???p s??? kh???i",
          icon: Icons.abc,
          color: Theme.of(context).primaryColorLight,
        ),
      ],
    );
  }

  final List<Map<String, dynamic>> genderItems = [
    {"value": "tai", "name": "Xe t???i"},
    {"value": "con", "name": "Xe container"},
  ];

  final List<Map<String, dynamic>> numberCont = [
    {'value': "0", "name": "0"},
    {'value': "1", "name": "1"},
    {'value': "2", "name": "2"},
  ];

  final List<Map<String, dynamic>> idKho = [
    {"value": "K1", "name": "Kho 1"},
    {"value": "K2", "name": "Kho 2"},
    {"value": "K3", "name": "Kho 3"},
    {"value": "K4", "name": "Kho 4"},
    {"value": "K5", "name": "Kho 5"},
    {"value": "K6", "name": "Kho 6"},
    {"value": "K7", "name": "Kho 7"},
  ];
  final List<Map<String, dynamic>> idProduct = [
    {'value': "HN", "name": "Nh???p h??ng"},
    {'value': "HX", "name": "Xu???t h??ng"},
  ];
}
