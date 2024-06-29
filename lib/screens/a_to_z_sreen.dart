import 'package:dalil_app/constants.dart';
import 'package:dalil_app/cubits/medicine_cubit/medicine_cubit.dart';
import 'package:dalil_app/screens/settings_drawer.dart';
import 'package:dalil_app/widgets/a_z_grid_view.dart';
import 'package:dalil_app/widgets/a_z_list_view.dart';
import 'package:dalil_app/widgets/custom_logo_appbar.dart';
import 'package:dalil_app/widgets/custom_textfield.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AToZScreen extends StatelessWidget {
  const AToZScreen({super.key});

  static String aToZScreenId = 'AToZScreen';

  @override
  Widget build(BuildContext context) {
    TextEditingController? aToZSearchController;
    return Scaffold(
      endDrawer: const SettingsDrawerScreen(),
      appBar: const CustomLogoAppBar(
        isLeading: true,
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        padding: const EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 16,
            ),
            const Text(
              'Drugs & Medications'
              '\n'
              'A to Z',
              style: TextStyle(
                color: kPrimaryColor,
                fontSize: 32,
              ),
            ),
            const SizedBox(
              height: 16,
            ),
            const Text(
              maxLines: 4,
              'Easy search by choose medicine letter for detailed and accurate information is provided on over prescriptions for both consumers and healthcare professionals.',
              style: TextStyle(
                color: kSecondryColor,
                fontSize: 16,
              ),
            ),
            const SizedBox(
              height: 32,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Search',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            CustomTextfield(
              controller: aToZSearchController,
              keyboardType: TextInputType.text,
              hintText: 'Search Drugs',
              prefixIcon: const Icon(
                Icons.search,
              ),
              onChanged: (medicineCharacterData) {
                BlocProvider.of<MedicineCubit>(context).getMedicinesByCharacter(
                  medicinesCharacter: medicineCharacterData,
                );
              },
              onSubmitted: (medicineCharacterData) {
                BlocProvider.of<MedicineCubit>(context).getMedicinesByCharacter(
                  medicinesCharacter: medicineCharacterData,
                );
              },
            ),
            const SizedBox(
              height: 32,
            ),
            const Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Text(
                  'Browse A - Z',
                  textAlign: TextAlign.start,
                  style: TextStyle(
                    color: kPrimaryColor,
                    fontSize: 32,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 16,
            ),
            const AToZGridView(),
            const SizedBox(
              height: 32,
            ),
            const AToZListView(),
          ],
        ),
      ),
    );
  }
}
