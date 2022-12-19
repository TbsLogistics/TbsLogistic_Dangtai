import 'package:flutter/material.dart';

class CustomTextFormPassword extends StatefulWidget {
  const CustomTextFormPassword({
    super.key,
    this.onTap,
    required this.hintText,
    required this.icon,
    required this.controller,
    required this.title,
  });
  final VoidCallback? onTap;
  final String hintText, title;
  final IconData icon;
  final TextEditingController controller;

  @override
  State<CustomTextFormPassword> createState() => _CustomTextFormPasswordState();
}

class _CustomTextFormPasswordState extends State<CustomTextFormPassword> {
  bool obscureText = true;
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        // Container(
        //   padding: EdgeInsets.only(left: size.width * 0.1),
        //   child: Row(
        //     children: [
        //       Text(
        //         widget.title,
        //         textAlign: TextAlign.left,
        //         style: const TextStyle(
        //           color: Colors.blueGrey,
        //           fontSize: 16,
        //         ),
        //       )
        //     ],
        //   ),
        // ),
        Container(
          margin: EdgeInsets.symmetric(
              horizontal: size.width * 0.05, vertical: size.width * 0.025),
          decoration: BoxDecoration(
            color: Colors.white,
            border: Border.all(width: 1, color: Colors.black.withOpacity(0.3)),
            borderRadius: const BorderRadius.all(Radius.circular(20.0)),
          ),
          width: size.width * 0.8,
          height: 60,
          child: TextFormField(
            controller: widget.controller,
            obscureText: obscureText,
            decoration: InputDecoration(
              border: InputBorder.none,
              contentPadding: const EdgeInsets.only(top: 20),
              isDense: true,
              hintText: widget.hintText,
              prefixIcon: Padding(
                padding: const EdgeInsets.only(top: 5),
                child: Icon(
                  widget.icon,
                  size: 20,
                ),
              ),
              suffixIcon: GestureDetector(
                onTap: () {
                  setState(() {
                    obscureText = !obscureText;
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.only(top: 15),
                  child: obscureText
                      ? Icon(
                          Icons.visibility_off,
                          color: Colors.black.withOpacity(0.7),
                        )
                      : Icon(
                          Icons.visibility,
                          color: Colors.black.withOpacity(0.7),
                        ),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
