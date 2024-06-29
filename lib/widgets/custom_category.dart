import 'package:dalil_app/constants.dart';
import 'package:flutter/material.dart';

class CustomCategory extends StatelessWidget {
  const CustomCategory({
    super.key,
    required this.categoryTitle,
    required this.categoryIcon,
    this.onTap,
  });

  final String categoryTitle;
  final IconData categoryIcon;
  final VoidCallback? onTap;
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: GestureDetector(
        onTap: onTap,
        child: Column(
          children: [
            Icon(
              categoryIcon,
              size: 60.0,
              color: kPrimaryColor,
            ),
            const SizedBox(
              height: 10.0,
            ),
            Text(
              categoryTitle,
              textAlign: TextAlign.center,
              style: const TextStyle(
                fontSize: 18.0,
                fontWeight: FontWeight.w600,
                color: kSecondryColor,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
