import 'package:dalil_app/cubits/medicine_cubit/medicine_cubit.dart';
import 'package:dalil_app/cubits/medicine_cubit/medicine_states.dart';
import 'package:dalil_app/screens/settings_drawer.dart';
import 'package:dalil_app/widgets/custom_logo_appbar.dart';
import 'package:dalil_app/widgets/medicine_info_column.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicineInfoScreen extends StatelessWidget {
  const MedicineInfoScreen({super.key});
  static String medicineInfoScreenId = 'MedicineInfoScreen';

  @override
  Widget build(BuildContext context) {
    String? medicineName =
        ModalRoute.of(context)!.settings.arguments as String?;
    return Scaffold(
      appBar: const CustomLogoAppBar(
        isLeading: true,
      ),
      endDrawer: const SettingsDrawerScreen(),
      body: BlocBuilder<MedicineCubit, MedicineState>(
        builder: (context, state) {
          if (state is MedicineInfoLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Color(0xFF037196),
              ),
            );
          } else if (state is MedicineInfoSuccessState) {
            // if (state.medicineModel.medicineResponseStatus) {
            return MedicineInfoColumn(
              medicineModel: state.medicineModel,
              medicineName: medicineName ??
                  state.medicineModel
                      .medicineName, // medicine name from machine model
            );
            // // } else {
            //   return Center(
            //     child: Text(
            //       state.medicineModel.medicineResponseMessage!,
            //       style: const TextStyle(
            //         fontWeight: FontWeight.bold,
            //       ),
            //     ),
            //   );
            // }
          } else if (state is MedicineInfoErrorState) {
            return const Center(
              child: Text(
                // state.errorMessage,
                'An error occurred while fetching the medicine info (Check the name of medicine), Please Try again',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 16.0,
                ),
              ),
            );
          }
          return const Center(
            child: Text(
              'An error occured, Please try again later',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          );
        },
      ),
    );
  }
}
