import 'package:dalil_app/constants.dart';
import 'package:dalil_app/cubits/medicine_cubit/medicine_cubit.dart';
import 'package:dalil_app/cubits/medicine_cubit/medicine_states.dart';
import 'package:dalil_app/screens/medicine_info_screen.dart';
import 'package:dalil_app/widgets/custom_a_z_medicine_card.dart';
import 'package:dalil_app/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AToZListView extends StatelessWidget {
  const AToZListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineCubit, MedicineState>(
      builder: (context, state) {
        if (state is MedicinesByCharacterLoadingState) {
          return const CustomCircularIdicator();
        } else if (state is MedicinesByCharacterSuccessState) {
          return ListView.separated(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemCount: state.medicinesByCharacterList.length,
            separatorBuilder: (context, index) => const SizedBox(
              height: 20.0,
            ),
            itemBuilder: (context, index) => CustomAToZMedicineCard(
              medicineModel: state.medicinesByCharacterList[index],
              onTap: () {
                Navigator.pushNamed(
                  context,
                  MedicineInfoScreen.medicineInfoScreenId,
                );
                if (userEmail != null) {
                  BlocProvider.of<MedicineCubit>(context).addMedicinesToHistory(
                    userEmail: userEmail!,
                    medicineName:
                        state.medicinesByCharacterList[index].medicineName,
                  );
                }
                BlocProvider.of<MedicineCubit>(context).getMedicineByFullName(
                  medicineName:
                      state.medicinesByCharacterList[index].medicineName,
                );
              },
            ),
          );
        } else if (state is MedicinesByCharacterErrorState) {
          return Center(
            child: Text(
              state.errorMessage,
              // 'An error occurred while fetching the medicine info, Please Try again',
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0,
              ),
            ),
          );
        }
        return Container();
      },
    );
  }
}
