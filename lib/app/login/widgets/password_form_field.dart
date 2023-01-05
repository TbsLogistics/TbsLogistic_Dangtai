import 'package:flutter/material.dart';

class PasswordTextField extends StatefulWidget {
  const PasswordTextField({
    super.key,
    this.controller,
    this.validator,
  });
  final TextEditingController? controller;

  final String? Function(String?)? validator;

  @override
  State<PasswordTextField> createState() => _PasswordTextFieldState();
}

class _PasswordTextFieldState extends State<PasswordTextField> {
  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15.0, vertical: 5),
      child: TextFormField(
        controller: widget.controller,
        keyboardType: TextInputType.text,
        textInputAction: TextInputAction.next,
        validator: widget.validator,
        obscureText: _isPasswordVisible,
        decoration: InputDecoration(
          labelText: "Mật khẩu",
          floatingLabelStyle: const TextStyle(
            fontSize: 24,
            color: Colors.black,
            // fontWeight: FontWeight.bold,
          ),
          hintText: "",
          labelStyle: const TextStyle(color: Colors.black),
          alignLabelWithHint: true,
          contentPadding: const EdgeInsets.symmetric(vertical: 10),
          suffixIcon: IconButton(
              icon: Icon(
                _isPasswordVisible ? Icons.visibility_off : Icons.visibility,
                color: Colors.black,
              ),
              onPressed: () {
                setState(() {
                  _isPasswordVisible = !_isPasswordVisible;
                });
              }),
          enabledBorder: const UnderlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
            ),
          ),
          focusedBorder: const UnderlineInputBorder(
            borderSide: BorderSide(color: Colors.black, width: 2),
          ),
        ),
      ),
    );
  }
}
