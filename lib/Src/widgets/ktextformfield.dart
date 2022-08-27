import 'package:flutter/material.dart';

import '../constants/appcolors.dart';

Widget KTextFormField({
  required final String hintText,
  required final bool obscure,
  required final Color color,
  required final String ? Function (String ?) validator,
  required final void Function (String ?) onchanged,

}) {
  return TextFormField(
    obscureText: obscure,
    validator: validator,
    onChanged: onchanged,
    decoration: InputDecoration(
      hintText: hintText,
      enabledBorder: OutlineInputBorder(
        borderSide: BorderSide(color: color)),
      focusedBorder: OutlineInputBorder(
        borderSide: BorderSide(color: color),
      
      ),
      errorBorder: OutlineInputBorder(
        borderSide: BorderSide(color: red),
      ),
      focusedErrorBorder: OutlineInputBorder(borderSide: BorderSide(color:red))

    ),
  );
}
