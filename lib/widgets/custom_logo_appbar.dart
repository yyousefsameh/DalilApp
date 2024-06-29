import 'package:dalil_app/constants.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class CustomLogoAppBar extends StatelessWidget implements PreferredSize {
  const CustomLogoAppBar({
    super.key,
    this.isLeading = false,
  });
  final bool isLeading;
  @override
  Widget build(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      leading: isLeading
          ? IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 28.0,
              ),
            )
          : null,
      title: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              // logo image code
              Image.asset(
                'assets/images/Dalil_Logo.png',
                width: 30.0,
                height: 30.0,
              ),
              const SizedBox(
                width: 10,
              ),
              GradientText(
                colors: const [
                  kPrimaryColor,
                  Color.fromRGBO(0, 0, 0, 0.69),
                ],
                'DALIL',
                style: const TextStyle(
                  color: kSecondryColor,
                  fontSize: 25.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ],
          ),
          const Text(
            'Know more.Be sure',
            style: TextStyle(
              color: kSecondryColor,
              fontSize: 20.0,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget get child => throw UnimplementedError();

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
