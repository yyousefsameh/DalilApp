import 'package:dalil_app/constants.dart';
import 'package:dalil_app/screens/home_screen.dart';
import 'package:dalil_app/widgets/custom_button.dart';
import 'package:flutter/material.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class OnBoardingScreen extends StatelessWidget {
  const OnBoardingScreen({super.key});
  static const String appIntroScreenId = 'AppIntroScreen';
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset(
                'assets/images/Dalil_Logo.png',
                width: 142.0,
                height: 142.0,
              ),
              const SizedBox(
                height: 20.0,
              ),
              GradientText(
                colors: const [
                  kPrimaryColor,
                  kSecondryColor,
                ],
                'DALIL',
                style: const TextStyle(
                  color: kSecondryColor,
                  fontSize: 70.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 25.0,
              ),
              const Text(
                'Start to enjoy the features\nwe'
                "'"
                've provided, and stay healthy!',
                textAlign: TextAlign.center,
                style: TextStyle(
                  color: kSecondryColor,
                  fontSize: 20.0,
                  fontWeight: FontWeight.w400,
                ),
              ),
              const SizedBox(
                height: 100.0,
              ),
              CustomButton(
                onTap: () {
                  // TODO saving state of app
                  Navigator.pushReplacementNamed(
                    context,
                    HomeScreen.homeScreenId,
                  );
                },
                buttonLabel: 'Get Started',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
