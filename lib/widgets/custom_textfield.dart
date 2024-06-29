import 'package:dalil_app/constants.dart';
import 'package:flutter/material.dart';

class CustomTextfield extends StatelessWidget {
  const CustomTextfield({
    super.key,
    this.hintText,
    this.searchController,
    required this.prefixIcon,
    this.onChanged,
    required this.keyboardType,
    this.textFieldfocusNode,
    this.borderRadius = 16.0,
    this.cursorColor = kPrimaryColor,
    this.bordersColor = Colors.black26,
    this.onSubmitted,
    this.controller,
  });
  final String? hintText;
  final TextEditingController? searchController;
  final Icon prefixIcon;
  final Color cursorColor;
  final Color bordersColor;
  final Function(String)? onChanged;
  final Function(String)? onSubmitted;
  final TextInputType keyboardType;
  final double borderRadius;
  final FocusNode? textFieldfocusNode;
  final TextEditingController? controller;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      cursorColor: cursorColor,
      focusNode: textFieldfocusNode,
      decoration: InputDecoration(
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 124, 124, 124),
        ),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        border: buildBorder(),
      ),
      onSubmitted: onSubmitted,
      onChanged: onChanged,
    );
  }

  OutlineInputBorder buildBorder() {
    return OutlineInputBorder(
      borderRadius: BorderRadius.circular(borderRadius),
      borderSide: BorderSide(
        color: bordersColor,
      ),
    );
  }
}
