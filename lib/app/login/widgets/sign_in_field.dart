import 'package:flutter/material.dart';

class SignInField extends StatelessWidget {
  const SignInField({
    super.key,
    this.controller,
    this.validator,
    required this.decoration,
  });
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  final InputDecoration decoration;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: TextFormField(
        controller: controller,
        textInputAction: TextInputAction.next,
        validator: validator,
        decoration: decoration,
      ),
    );
  }
}
