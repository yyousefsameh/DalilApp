import 'package:dalil_app/cubits/medicine_cubit/medicine_cubit.dart';
import 'package:dalil_app/cubits/medicine_cubit/medicine_states.dart';
import 'package:dalil_app/screens/medicine_info_screen.dart';
import 'package:dalil_app/widgets/custom_circular_progress_indicator.dart';
import 'package:dalil_app/widgets/custom_history_medicine_card.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicinesHistoryListViewSeprated extends StatelessWidget {
  const MedicinesHistoryListViewSeprated({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineCubit, MedicineState>(
      builder: (context, state) {
        if (state is HistoryMedicinesLoadingState) {
          return const CustomCircularIdicator();
        } else if (state is HistoryMedicinesSuccessState) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 8.0,
            ),
            child: ListView.separated(
              itemCount: state.medicinesHistoryList.length,
              physics: const BouncingScrollPhysics(),
              separatorBuilder: (context, index) => const SizedBox(
                height: 20.0,
              ),
              itemBuilder: (context, index) => CustomHistoryMedicineCard(
                historyModelData: state.medicinesHistoryList[index],
                onTap: () {
                  BlocProvider.of<MedicineCubit>(context).getMedicineByFullName(
                    medicineName: state.medicinesHistoryList[index].medicine!,
                  );
                  Navigator.pushReplacementNamed(
                    context,
                    MedicineInfoScreen.medicineInfoScreenId,
                  );
                },
              ),
            ),
          );
        } else if (state is HistoryMedicinesErrorState) {
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
    );
  }
}
