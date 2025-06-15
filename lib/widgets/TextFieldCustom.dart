import 'package:flutter/material.dart';

Widget textFieldCustom(String label, IconData icon, TextEditingController controller, {bool isPassword = false}) {
  return TextFormField(
    controller: controller,
    obscureText: isPassword,
    decoration: InputDecoration(
      labelText: label,
      prefixIcon: Icon(icon),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(12),
      ),
    ),
    validator: (value) {
      if (value == null || value.isEmpty) {
        return 'Please enter $label';
      }
      return null;
    },
  );
}
