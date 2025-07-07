import 'package:flutter/material.dart';

class CustomTextFieldCalculator extends StatelessWidget {
  const CustomTextFieldCalculator({
    super.key,
    this.hintText,
    this.onSaved,
    this.controller,
    this.validator,
  });
  final String? hintText;

  final void Function(String?)? onSaved;
  final TextEditingController? controller;
  final String? Function(String?)? validator;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      onSaved: onSaved,
      style: TextStyle(
          color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
      controller: controller,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value!.isEmpty) {
          return "Field is Required";
        }
        return null;
      },
      decoration: InputDecoration(
        contentPadding: EdgeInsets.only(left: 12),
        fillColor: Colors.white,
        filled: true,
        hintText: hintText,
        hintStyle: TextStyle(
            color: Colors.green, fontSize: 20, fontWeight: FontWeight.bold),
        border: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        enabledBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
        focusedBorder: const OutlineInputBorder(
          borderSide: BorderSide(color: Colors.white),
        ),
      ),
    );
  }
}
