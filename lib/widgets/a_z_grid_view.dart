import 'package:dalil_app/cubits/medicine_cubit/medicine_cubit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AToZGridView extends StatelessWidget {
  const AToZGridView({super.key});

  @override
  Widget build(BuildContext context) {
    List<String> gridViewLettersList = [
      'A',
      'B',
      'C',
      'D',
      'E',
      'F',
      'G',
      'H',
      'I',
      'J',
      'K',
      'L',
      'M',
      'N',
      'O',
      'P',
      'Q',
      'R',
      'S',
      'T',
      'U',
      'V',
      'W',
      'X',
      'Y',
      'Z',
    ];
    return GridView.builder(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 8,
        mainAxisSpacing: 12.0,
        crossAxisSpacing: 12.0,
      ),
      itemCount: gridViewLettersList.length,
      itemBuilder: (context, index) {
        return Container(
          color: const Color.fromARGB(255, 216, 215, 215),
          child: TextButton(
            onPressed: () {
              BlocProvider.of<MedicineCubit>(context).getMedicinesByCharacter(
                medicinesCharacter: gridViewLettersList[index].toLowerCase(),
              );
            },
            child: Text(
              gridViewLettersList[index],
              style: const TextStyle(
                fontSize: 16,
                color: Colors.black,
              ),
            ),
          ),
        );
      },
    );
  }
}
