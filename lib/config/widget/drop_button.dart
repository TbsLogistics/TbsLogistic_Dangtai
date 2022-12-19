// ignore_for_file: file_names

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:tbs_logistics_dangtai/config/core/data/color.dart';

class CustomDropdownButton extends StatefulWidget {
  const CustomDropdownButton(
      {super.key,
      required this.items,
      required this.text,
      required this.onChanged,
      required this.onSaved});
  final List<DropdownMenuItem<String>> items;
  final String text;
  final Function(String?) onChanged;
  final Function(String?) onSaved;

  @override
  State<CustomDropdownButton> createState() => _CustomDropdownButtonState();
}

class _CustomDropdownButtonState extends State<CustomDropdownButton> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.only(left: 5),
          child: Row(
            children: [
              Text(
                widget.text,
                textAlign: TextAlign.left,
                style: const TextStyle(color: Colors.blueGrey, fontSize: 16),
              ),
            ],
          ),
        ),
        Container(
          decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(5.0),
            border: Border.all(
              width: 1,
              color: CustomColor.borderColor,
            ),
          ),
          height: 60,
          width: size.width - 10,
          margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
          child: DropdownButtonFormField2(
            selectedItemHighlightColor: Colors.orangeAccent.withOpacity(0.4),
            barrierColor: Colors.orangeAccent.withOpacity(0.4),
            focusColor: Colors.orangeAccent.withOpacity(0.4),
            decoration: InputDecoration(
              isDense: true,
              contentPadding: EdgeInsets.zero,
              focusColor: Colors.orangeAccent.withOpacity(0.4),
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(5.0),
                borderSide: BorderSide.none,
              ),
            ),
            isExpanded: true,
            hint: Text(
              'Chọn ${widget.text}',
              style: const TextStyle(fontSize: 16, color: Colors.blueGrey),
            ),
            icon: const Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 30,
            buttonHeight: 80,
            buttonPadding: const EdgeInsets.only(right: 10),
            dropdownDecoration: BoxDecoration(
              borderRadius: BorderRadius.circular(5),
              gradient: const LinearGradient(
                colors: [Colors.orangeAccent, Colors.white],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
                stops: [0.4, 0.7],
              ),
            ),
            items: widget.items,
            validator: (value) {
              if (value == null) {
                return 'Chọn ${widget.text}';
              }
              return null;
            },
            onChanged: widget.onChanged,
            onSaved: widget.onSaved,
          ),
        )
      ],
    );
  }
}
