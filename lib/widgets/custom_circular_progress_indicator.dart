import 'package:dalil_app/constants.dart';
import 'package:flutter/material.dart';

class CustomCircularIdicator extends StatelessWidget {
  const CustomCircularIdicator({super.key});

  @override
  Widget build(BuildContext context) {
    return const Center(
      child: CircularProgressIndicator(
        color: kPrimaryColor,
      ),
    );
  }
}
