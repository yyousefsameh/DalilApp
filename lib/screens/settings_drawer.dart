import 'package:dalil_app/screens/login_screen.dart';
import 'package:dalil_app/screens/medicines_history.dart';
import 'package:dalil_app/screens/signup_screen.dart';
import 'package:dalil_app/widgets/custom_drawer_list_tile.dart';
import 'package:flutter/material.dart';

class SettingsDrawerScreen extends StatelessWidget {
  const SettingsDrawerScreen({super.key});
  static String settingsDrawerScreenId = 'SettingsDrawerScreen';
  @override
  Widget build(BuildContext context) {
    return Drawer(
      elevation: 0.0,
      child: Padding(
        padding: const EdgeInsets.all(6.0),
        child: ListView(
          children: [
            Row(
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios,
                    size: 28.0,
                  ),
                ),
                const DrawerHeader(
                  child: Center(
                    child: Text(
                      'Settings',
                      style: TextStyle(
                        fontSize: 28.0,
                        color: Colors.black,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            CustomDrawerListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, LoginScreen.loginScreenId);
              },
              listTileTitle: 'Login',
              listTileSuffixIcon: const Icon(
                Icons.arrow_forward_ios,
                size: 24.0,
              ),
            ),
            CustomDrawerListTile(
              onTap: () {
                Navigator.of(context).pop();
                Navigator.pushNamed(context, SignUpScreen.signUpScreenId);
              },
              listTileTitle: 'Sign Up',
              listTileSuffixIcon: const Icon(
                Icons.arrow_forward_ios,
                size: 24.0,
              ),
            ),
            // CustomDrawerListTile(
            //   onTap: () {
            //     Navigator.of(context).pop();
            //     Navigator.pushNamed(
            //         context, MedicinesHistoryScreen.medicinesHistoryScreenId);
            //   },
            //   listTileTitle: 'Log out',
            //   listTileSuffixIcon: const Icon(
            //     Icons.arrow_forward_ios,
            //     size: 24.0,
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
