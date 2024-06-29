import 'package:dalil_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:dalil_app/cubits/medicine_cubit/medicine_cubit.dart';
import 'package:dalil_app/screens/a_to_z_sreen.dart';
import 'package:dalil_app/screens/category_screen.dart';
import 'package:dalil_app/screens/home_screen.dart';
import 'package:dalil_app/screens/login_screen.dart';
import 'package:dalil_app/screens/medicine_info_screen.dart';
import 'package:dalil_app/screens/medicines_history.dart';
import 'package:dalil_app/screens/on_boarding_screen.dart';
import 'package:dalil_app/screens/prescription_image_screen.dart';
import 'package:dalil_app/screens/reset_password_screen.dart';
import 'package:dalil_app/screens/scanned_and_searched_medicine_screen.dart';
import 'package:dalil_app/screens/settings_drawer.dart';
import 'package:dalil_app/screens/signup_screen.dart';
import 'package:dalil_app/screens/splash_screen.dart';
import 'package:dalil_app/services/api_service.dart';
import 'package:dalil_app/services/cache_preferences_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await CacheService.initSharedPreferences();
  runApp(const DalilApp());
}

class DalilApp extends StatelessWidget {
  const DalilApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers: [
        BlocProvider(
          create: (context) => MedicineCubit(),
        ),
        BlocProvider(
          create: (context) => AuthCubit(
            ApiService(
              Dio(),
            ),
          ),
        ),
      ],
      child: MaterialApp(
        theme: ThemeData(
          drawerTheme: const DrawerThemeData(),
        ),
        routes: {
          ResetPasswordScreen.resetPasswordScreenId: (context) =>
              const ResetPasswordScreen(),
          LoginScreen.loginScreenId: (context) => const LoginScreen(),
          SignUpScreen.signUpScreenId: (context) => const SignUpScreen(),
          HomeScreen.homeScreenId: (context) => const HomeScreen(),
          OnBoardingScreen.appIntroScreenId: (context) =>
              const OnBoardingScreen(),
          SettingsDrawerScreen.settingsDrawerScreenId: (context) =>
              const SettingsDrawerScreen(),
          MedicineInfoScreen.medicineInfoScreenId: (context) =>
              const MedicineInfoScreen(),
          // ScannedAndSearchedMedicinesScreen.scannedSearchedMedicinesScreenId:
          //     (context) => const ScannedAndSearchedMedicinesScreen(),
          MedicinesHistoryScreen.medicinesHistoryScreenId: (context) =>
              const MedicinesHistoryScreen(),
          PrescriptionImageScreen.scanPrescriptionScreenId: (context) =>
              const PrescriptionImageScreen(),
          AToZScreen.aToZScreenId: (context) => const AToZScreen(),
          SplashScreen.splashScreenId: (context) => const SplashScreen(),
          CategoryScreen.categoryScreenId: (context) => const CategoryScreen(),
        },
        debugShowCheckedModeBanner: false,
        initialRoute: SplashScreen.splashScreenId,
      ),
    );
  }
}
