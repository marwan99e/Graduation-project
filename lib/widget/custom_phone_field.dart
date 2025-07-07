import 'package:flutter/material.dart';
import 'package:intl_phone_field/intl_phone_field.dart';
import 'package:intl_phone_field/phone_number.dart';

class CustomPhoneField extends StatelessWidget {
  const CustomPhoneField(
      {super.key,
      this.hintText,
      this.onSaved,
      this.controller,
      this.onChanged});
  final String? hintText;
  final void Function(PhoneNumber?)? onSaved;
  final void Function(PhoneNumber)? onChanged;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return IntlPhoneField(
      validator: (value) {
        if (value == "") {
          return "please write your phone number";
        }
        return null;
      },
      controller: controller,
      onSaved: onSaved,
      onChanged: onChanged,
      initialCountryCode: "JO",
      decoration: InputDecoration(
        fillColor: const Color.fromARGB(255, 243, 243, 243),
        filled: true,
        hintText: hintText,
        hintStyle: const TextStyle(color: Colors.grey),
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
