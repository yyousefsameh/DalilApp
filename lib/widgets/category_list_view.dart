import 'package:cached_network_image/cached_network_image.dart';
import 'package:dalil_app/constants.dart';
import 'package:dalil_app/cubits/medicine_cubit/medicine_cubit.dart';
import 'package:dalil_app/cubits/medicine_cubit/medicine_states.dart';
import 'package:dalil_app/screens/medicine_info_screen.dart';
import 'package:dalil_app/widgets/custom_circular_progress_indicator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class CategoryListView extends StatelessWidget {
  const CategoryListView({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MedicineCubit, MedicineState>(
      builder: (context, state) {
        if (state is MedicinesByCategoryLoadingState) {
          return const CustomCircularIdicator();
        } else if (state is MedicinesByCategorySuccessState) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              vertical: 12.0,
              horizontal: 8.0,
            ),
            child: Column(
              children: [
                const Padding(
                  padding: EdgeInsets.only(left: 8.0),
                  child: Row(
                    children: [
                      Text(
                        'Popular Medicines',
                        style: TextStyle(
                          fontSize: 24.0,
                          fontWeight: FontWeight.w600,
                          color: Color.fromRGBO(92, 96, 104, 1),
                        ),
                      ),
                    ],
                  ),
                ),
                const SizedBox(
                  height: 20.0,
                ),
                Expanded(
                  child: ListView.separated(
                    itemCount: state.medicinesByCategoryList.length,
                    physics: const BouncingScrollPhysics(),
                    separatorBuilder: (context, index) => const SizedBox(
                      height: 20.0,
                    ),
                    itemBuilder: (context, index) => GestureDetector(
                      onTap: () {
                        Navigator.pushReplacementNamed(
                          context,
                          MedicineInfoScreen.medicineInfoScreenId,
                        );
                        if (userEmail != null) {
                          BlocProvider.of<MedicineCubit>(context)
                              .addMedicinesToHistory(
                            userEmail: userEmail!,
                            medicineName: state
                                .medicinesByCategoryList[index].medicineName,
                          );
                        }
                        BlocProvider.of<MedicineCubit>(context)
                            .getMedicineByFullName(
                          medicineName:
                              state.medicinesByCategoryList[index].medicineName,
                        );
                      },
                      child: Container(
                        // to make the container smaller you can put height:
                        decoration: BoxDecoration(
                          border: Border.all(
                            color: const Color.fromRGBO(25, 154, 142, 0.77),
                          ),
                          borderRadius: BorderRadius.circular(20.0),
                          color: Colors.white,
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 40.0,
                              color: Colors.grey.withOpacity(0.3),
                              // ظبطو ال shadow
                            ),
                          ],
                        ),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Row(
                            children: [
                              CachedNetworkImage(
                                imageUrl: state.medicinesByCategoryList[index]
                                    .medicineImage!,
                                width: 110,
                                height: 110,
                                errorWidget: (context, url, error) =>
                                    const Center(
                                  child: Icon(
                                    Icons.error,
                                  ),
                                ),
                              ),
                              const SizedBox(
                                width: 20.0,
                              ),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      state.medicinesByCategoryList[index]
                                          .medicineName,
                                      style: const TextStyle(
                                        fontSize: 20.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black,
                                      ),
                                    ),
                                    Text(
                                      overflow: TextOverflow.ellipsis,
                                      maxLines: 2,
                                      "Medicine's Alternatives: ${state.medicinesByCategoryList[index].medicineAlternative}",
                                      style: const TextStyle(
                                        fontSize: 18.0,
                                        fontWeight: FontWeight.w600,
                                        color: kSecondryColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          );
        } else if (state is MedicinesByCategoryErrorState) {
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
