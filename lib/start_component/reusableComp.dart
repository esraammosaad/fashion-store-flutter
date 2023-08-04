import 'package:flutter/material.dart';

TextFormField reusableTextField({
  required TextEditingController controller,
  TextInputType? keyboardType,
  IconButton? icon,
  required bool isPassword,
  required String text, void Function(String)?onFeildSubmitted
}) {
  return TextFormField(
    onFieldSubmitted: onFeildSubmitted,
    controller: controller,
    cursorColor: Colors.black,
    keyboardType: keyboardType,
    obscureText: isPassword,
    validator: (value) {
      if (value!.isEmpty) {
        return 'You Must Enter a value';
      }
      return null;
    },
    decoration: InputDecoration(
      suffixIcon: icon,
      focusedBorder:
          const OutlineInputBorder(borderSide: BorderSide(color: Colors.black)),
      hintText: text,
    ),
  );
}
