import 'package:dalil_app/constants.dart';
import 'package:flutter/material.dart';

class CustomTextFormField extends StatelessWidget {
  const CustomTextFormField({
    super.key,
    this.hintText,
    this.onChanged,
    this.obscureText = false,
    this.suffixIcon,
    this.controller,
    this.keyBoardType,
    required this.prefixIcon,
    this.borderRadius = 23,
    this.cursorColor = kPrimaryColor,
    this.bordersColor = Colors.black26,
    this.validator,
  });

  final String? hintText;
  final Function(String)? onChanged;

  final IconButton? suffixIcon;
  final Widget prefixIcon;
  final bool obscureText;
  final TextEditingController? controller;
  final TextInputType? keyBoardType;
  final Color cursorColor;
  final Color bordersColor;
  final double borderRadius;
  final String? Function(String?)? validator;
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: validator,
      cursorColor: cursorColor,
      keyboardType: keyBoardType,
      controller: controller,
      obscureText: obscureText,
      onChanged: onChanged,
      decoration: InputDecoration(
        suffixIcon: suffixIcon,
        prefixIcon: prefixIcon,
        hintText: hintText,
        hintStyle: const TextStyle(
          color: Color.fromARGB(255, 124, 124, 124),
        ),
        enabledBorder: buildBorder(),
        focusedBorder: buildBorder(),
        border: buildBorder(),
      ),
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
