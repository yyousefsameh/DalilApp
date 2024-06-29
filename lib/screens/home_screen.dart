import 'package:dalil_app/constants.dart';
import 'package:dalil_app/cubits/medicine_cubit/medicine_cubit.dart';
import 'package:dalil_app/screens/a_to_z_sreen.dart';
import 'package:dalil_app/screens/medicine_info_screen.dart';
import 'package:dalil_app/screens/medicines_history.dart';
import 'package:dalil_app/screens/prescription_image_screen.dart';
import 'package:dalil_app/screens/settings_drawer.dart';
import 'package:dalil_app/widgets/custom_category.dart';
import 'package:dalil_app/widgets/custom_logo_appbar.dart';
import 'package:dalil_app/widgets/custom_textfield.dart';
import 'package:dalil_app/widgets/home_categories_list_view.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});
  static String homeScreenId = 'HomeScreen';
  @override
  Widget build(BuildContext context) {
    FocusNode searchTextFieldfocusNode = FocusNode();
    bool isScanPrescription; // toggel between upload and scan screen

    return Scaffold(
      appBar: const CustomLogoAppBar(),
      endDrawer: const SettingsDrawerScreen(),
      body: Padding(
        padding: const EdgeInsets.only(
          right: 20.0,
          left: 20.0,
          // top: 40.0,
        ),
        child: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [
            SliverToBoxAdapter(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 30.0),
                  CustomTextfield(
                    textFieldfocusNode: searchTextFieldfocusNode,
                    keyboardType: TextInputType.text,
                    hintText: 'Search Drugs',
                    prefixIcon: const Icon(
                      Icons.search,
                    ),
                    onSubmitted: (medicineNameText) {
                      // medicine from textfield
                      BlocProvider.of<MedicineCubit>(context)
                          .getMedicineByFullName(
                        medicineName: medicineNameText.toLowerCase(),
                      );
                      Navigator.pushNamed(
                        context,
                        MedicineInfoScreen.medicineInfoScreenId,
                        arguments: medicineNameText,
                      );
                    },
                  ),
                  const SizedBox(height: 30.0),
                  const Text(
                    'Categories',
                    style: TextStyle(
                      fontSize: 35.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  const HomeCategoriesListView(),
                  Container(
                    width: double.infinity,
                    decoration: BoxDecoration(
                      color: const Color.fromRGBO(232, 242, 241, 1.0),
                      borderRadius: BorderRadius.circular(10.0),
                    ),
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Row(
                        children: [
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const Text(
                                'Search quickly with \nprescription',
                                style: TextStyle(
                                  fontSize: 22.0,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                              const SizedBox(height: 30.0),
                              GestureDetector(
                                onTap: () {
                                  Navigator.pushNamed(
                                    context,
                                    PrescriptionImageScreen
                                        .scanPrescriptionScreenId,
                                    arguments: isScanPrescription = false,
                                  );
                                },
                                child: Container(
                                  decoration: BoxDecoration(
                                    color: kPrimaryColor,
                                    borderRadius: BorderRadius.circular(10.0),
                                  ),
                                  // give button the width of the device
                                  width: 180,
                                  height: 40,
                                  child: const Center(
                                    child: Text(
                                      'Upload prescription',
                                      style: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white,
                                        fontSize: 18.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          const Spacer(),
                          Expanded(
                            flex: 3,
                            child: Image.asset(
                              'assets/images/Tablets.jpg',
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  const SizedBox(height: 30.0),
                  const Row(
                    children: [
                      Text(
                        'Features',
                        style: TextStyle(
                          fontSize: 35.0,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 50.0,
                  ),
                  Row(
                    children: [
                      CustomCategory(
                        categoryTitle: "Prescription\nScan",
                        categoryIcon: FontAwesomeIcons.filePrescription,
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            PrescriptionImageScreen.scanPrescriptionScreenId,
                            arguments: isScanPrescription = true,
                          );
                          searchTextFieldfocusNode.unfocus();
                        },
                      ),
                      CustomCategory(
                        categoryTitle: "Drugs\nA-Z",
                        categoryIcon: Icons.abc,
                        onTap: () {
                          Navigator.pushNamed(context, AToZScreen.aToZScreenId);
                          searchTextFieldfocusNode.unfocus();
                        },
                      ),
                      CustomCategory(
                        categoryTitle: "History\n",
                        categoryIcon: FontAwesomeIcons.clockRotateLeft,
                        onTap: () {
                          if (userEmail != null) {
                            BlocProvider.of<MedicineCubit>(context)
                                .getHistoryMedicines(
                              userEmail: userEmail!,
                            );
                            Navigator.pushNamed(
                              context,
                              MedicinesHistoryScreen.medicinesHistoryScreenId,
                            );
                            searchTextFieldfocusNode.unfocus();
                          }
                        },
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
