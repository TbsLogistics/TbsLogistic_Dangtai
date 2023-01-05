import 'package:dropdown_search/dropdown_search.dart';
import 'package:flutter/material.dart';
import 'package:tbs_logistics_dangtai/config/model/list_customer_model.dart';

class TextFormSearch extends StatefulWidget {
  const TextFormSearch({Key? key}) : super(key: key);

  @override
  State<TextFormSearch> createState() => _TextFormSearchState();
}

class _TextFormSearchState extends State<TextFormSearch> {
  ListCustomerModel? selectedKhachhang;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.only(left: 5),
            child: Row(
              children: const [
                Text(
                  "Khách hàng *",
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
                child: Theme(
                  data: ThemeData(
                    inputDecorationTheme:
                        const InputDecorationTheme(border: InputBorder.none),
                  ),
                  child: DropdownSearch<ListCustomerModel>(
                    // asyncItems: (String? query) {
                    //   return controller.getData(query);
                    // },
                    popupProps: PopupPropsMultiSelection.modalBottomSheet(
                      showSelectedItems: true,
                      itemBuilder: _customPopupItemBuilderExample2,
                      showSearchBox: true,
                    ),
                    compareFn: (item, sItem) {
                      return item.maKhachHang == sItem.maKhachHang;
                    },
                    onChanged: (ListCustomerModel? newValue) {
                      setState(() {
                        selectedKhachhang = newValue;
                        // print(selectedKhachhang!.maKhachHang);
                      });
                    },
                    dropdownDecoratorProps: const DropDownDecoratorProps(
                      dropdownSearchDecoration: InputDecoration(
                        hintText: "Chọn khách hàng",
                        filled: true,
                        iconColor: Color(0xFFF3BD60),
                        focusColor: Color(0xFFF3BD60),
                        fillColor: Colors.white,
                        focusedBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFF3BD60), width: 1.0),
                        ),
                        enabledBorder: OutlineInputBorder(
                          borderSide:
                              BorderSide(color: Color(0xFFF3BD60), width: 1.0),
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
    );
  }

  Widget _customPopupItemBuilderExample2(
    BuildContext context,
    ListCustomerModel? item,
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
          subtitle: Text(item?.phone ?? ''),
          leading: const CircleAvatar(
              // this does not work - throws 404 error
              // backgroundImage: NetworkImage(item.avatar ?? ''),
              ),
        ),
      ),
    );
  }
}
