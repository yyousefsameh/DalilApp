import 'dart:async';

import 'package:dalil_app/constants.dart';
import 'package:dalil_app/screens/on_boarding_screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:simple_gradient_text/simple_gradient_text.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});
  static const String splashScreenId = 'SplashScreen';
  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? timer;

  startDelay() {
    timer = Timer(
      const Duration(
        seconds: 3,
      ),
      goToOnboarding,
    );
  }

  goToOnboarding() {
    Navigator.pushReplacementNamed(
      context,
      OnBoardingScreen.appIntroScreenId,
    );
  }

  @override
  void initState() {
    startDelay();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              'assets/images/Dalil_Logo.png',
            ),
            const SizedBox(
              height: 10.0,
            ),
            GradientText(
              colors: const [
                kPrimaryColor,
                Color.fromRGBO(0, 0, 0, 0.69),
              ],
              'DALIL',
              style: const TextStyle(
                color: kSecondryColor,
                fontSize: 60.0,
                fontWeight: FontWeight.w400,
              ),
            ),
            const SizedBox(
              height: 50.0,
            ),
            const Text(
              'Know more.Be sure',
              style: TextStyle(
                color: kSecondryColor,
                fontSize: 20.0,
                fontWeight: FontWeight.w400,
              ),
            ).animate().fade(duration: 1000.ms),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    timer?.cancel();
    super.dispose();
  }
}
