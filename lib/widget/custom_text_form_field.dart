import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({
    super.key,
    this.hintText,
    this.suffixIcon,
    this.onchange,
    this.obscureText = false,
    this.keyboardType,
    this.controller,
    this.validator,
    this.hintStyle,
    this.onSaved,
    this.maxLines = 1,
    this.maxLength,
  });
  final String? hintText;
  final TextInputType? keyboardType;

  final Widget? suffixIcon;
  final void Function(String?)? onchange;
  final bool? obscureText;
  final TextEditingController? controller;
  final String? Function(String?)? validator;
  final TextStyle? hintStyle;
  final void Function(String?)? onSaved;
  final int? maxLines;
  final int? maxLength;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      maxLength: maxLength,
      maxLines: maxLines,
      onSaved: onSaved,
      controller: controller,
      keyboardType: keyboardType,
      obscureText: obscureText!,
      onChanged: onchange,
      validator: validator,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        fillColor: Color.fromARGB(255, 242, 242, 242),
        filled: true,
        hintText: hintText,
        hintStyle: hintStyle,
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Color.fromARGB(255, 241, 241, 241)),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(
            color: Color.fromARGB(255, 192, 192, 192),
          ),
        ),
      ),
    );
  }
}
