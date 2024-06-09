import 'package:flutter/material.dart';

class customTextField extends StatelessWidget {
  const customTextField({
    required this.controller,
    required this.textInputAction,
    required this.textinputtype,
    required this.hint,
    this.isObscure = false,
    this.hasSuffix = false,
    this.onPressed,
    super.key,
  });

  final TextEditingController controller;
  final TextInputType textinputtype;
  final TextInputAction textInputAction;
  final String hint;
  final bool isObscure;
  final bool hasSuffix;
  final VoidCallback? onPressed;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      keyboardType: textinputtype,
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
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0, color: Color(0xFFD3D1D8)), // Ganti warna border menjadi #D3D1D8
          borderRadius: BorderRadius.circular(5.0),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(width: 1.0, color: Color(0xFFD3D1D8)), // Ganti warna border menjadi #D3D1D8
          borderRadius: BorderRadius.circular(5.0),
        ),
        hintText: hint,
      ),
    );
  }
}
