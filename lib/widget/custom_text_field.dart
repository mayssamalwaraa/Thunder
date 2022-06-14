import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  TextEditingController? controller;
  String? labText;
  TextInputType? keyboardtype;

  CustomTextField({
    this.controller,
    this.keyboardtype,
    this.labText
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      keyboardType: keyboardtype,
      controller: controller,
      decoration: InputDecoration(
        labelText:labText,

      ),
      
    );
  }
}