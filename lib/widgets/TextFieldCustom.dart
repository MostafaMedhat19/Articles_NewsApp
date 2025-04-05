import 'package:flutter/material.dart';

Widget textFieldCustom(String title, IconData icon, TextEditingController controller) {

  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: TextFormField(
      controller: controller,
      validator:  (value) {
        if(value == null || value.isEmpty)
          {
            return 'Please enter $title';
          }
        return null;
      },
      decoration: InputDecoration(
        suffixIcon: Icon(icon),
        border: const OutlineInputBorder(),
        labelText: title,
      ),
    ),
  );
}
