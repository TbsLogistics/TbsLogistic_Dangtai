import 'package:flutter/material.dart';

class CustomFormFielsAccount extends StatelessWidget {
  const CustomFormFielsAccount(
      {super.key,
      required this.title,
      required this.controller,
      required this.hintText,
      required this.icon,
      this.validator});
  final String title;
  final TextEditingController controller;
  final String? hintText;
  final IconData icon;
  final String Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        // Container(
        //   color: Colors.black,
        //   padding: EdgeInsets.only(left: size.width * 0.1),
        //   child: Row(
        //     children: [
        //       Text(
        //         title,
        //         textAlign: TextAlign.left,
        //         style: const TextStyle(
        //           color: Colors.blueGrey,
        //           fontSize: 20,
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        Container(
          decoration: BoxDecoration(
            border: Border.all(
              width: 1,
              color: Color(0xFFF3BD60),
            ),
            color: Colors.white,
            borderRadius: BorderRadius.circular(20.0),
          ),
          padding: const EdgeInsets.only(top: 10, left: 10),
          height: 60,
          width: size.width * 0.8,
          margin: EdgeInsets.symmetric(vertical: size.height * 0.02),
          child: TextFormField(
            validator: validator,
            controller: controller,
            decoration: InputDecoration(
              hintText: hintText,
              border: InputBorder.none,
              icon: Icon(
                icon,
                size: 26,
              ),
              isDense: true,
            ),
          ),
        )
      ],
    );
  }
}
