import 'package:flutter/material.dart';

class CustomEdit extends StatelessWidget {
  const CustomEdit({
    required this.controller,
    required this.textInputAction,
    required this.textInputType,
    required this.hint,
    this.isObscure = false,
    this.hasSuffix = false,
    this.onPressed,
    Key? key,
  }) : super(key: key);

  final TextEditingController controller;
  final TextInputType textInputType;
  final TextInputAction textInputAction;
  final String hint;
  final bool isObscure;
  final bool hasSuffix;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: textInputType,
      textInputAction: textInputAction,
      obscureText: isObscure,
      decoration: InputDecoration(
        filled: true,
        fillColor: Color(0xFFF7F7F7),
        suffixIcon: hasSuffix
            ? IconButton(
                icon: Icon(isObscure ? Icons.visibility : Icons.visibility_off),
                onPressed: onPressed,
              )
            : null,
        enabledBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black, // Warna border bawah
            width: 1.0, // Ketebalan border bawah
          ),
        ),
        focusedBorder: UnderlineInputBorder(
          borderSide: BorderSide(
            color: Colors.black, // Warna border bawah saat dalam fokus
            width: 1.0, // Ketebalan border bawah saat dalam fokus
          ),
        ),
        hintText: hint,
      ),
    );
  }
}
