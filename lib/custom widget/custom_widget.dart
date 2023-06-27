
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    required this.controller,
    this.onChange, required this.hintText, required this.labelText,
  });

  final TextEditingController controller;
  final void Function(String)? onChange;
  final String hintText;
  final String labelText;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 12.0,horizontal: 5),
      child: TextField(
        onChanged: onChange,
        controller: controller,
        decoration: InputDecoration(
          hintText: hintText,
          labelText: labelText,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: Colors.white),
          ),
          border: OutlineInputBorder(
          ),
        ),
      ),
    );
  }
}