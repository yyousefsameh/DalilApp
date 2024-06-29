import 'package:dalil_app/cubits/medicine_cubit/medicine_states.dart';
import 'package:dalil_app/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class MedicineCubit extends Cubit<MedicineState> {
  MedicineCubit() : super(MedicineInitialState());

  getMedicineByFullName({
    required String medicineName,
  }) async {
    emit(MedicineInfoLoadingState());
    var resultOfGettingMedicineInfo =
        await ApiService(Dio()).getMedicineByFullNameService(
      endPoint: "medicines/getMedicine",
      medicineName: medicineName,
    );
    resultOfGettingMedicineInfo.fold(
      (failure) => emit(MedicineInfoErrorState(failure.errorMessage)),
      (medicine) => emit(MedicineInfoSuccessState(medicine)),
    );
  }

  getMedicinesByCategory({
    required String medicinesCategory,
  }) async {
    emit(MedicinesByCategoryLoadingState());
    var resultOfGettingMedicinesByCategory =
        await ApiService(Dio()).getMedicinesByCategoryService(
      endPoint: "medicines/getMedicineByCategory",
      medicinesCategory: medicinesCategory,
    );
    resultOfGettingMedicinesByCategory.fold(
      (failure) => emit(MedicinesByCategoryErrorState(failure.errorMessage)),
      (medicinesByCategoryList) =>
          emit(MedicinesByCategorySuccessState(medicinesByCategoryList)),
    );
  }

  getMedicinesByCharacter({
    required String medicinesCharacter,
  }) async {
    emit(MedicinesByCharacterLoadingState());
    var resultOfGettingMedicinesByCharacter =
        await ApiService(Dio()).getMedicinesByAnyCharacterService(
      endPoint: "medicines/getMedicineByPrefix",
      medicinesCharacter: medicinesCharacter,
    );
    resultOfGettingMedicinesByCharacter.fold(
      (failure) => emit(MedicinesByCharacterErrorState(failure.errorMessage)),
      (medicinesByCharacterList) =>
          emit(MedicinesByCharacterSuccessState(medicinesByCharacterList)),
    );
  }

  getSimilarMedicineToMedicineMahcineName({
    required dynamic prescriptionImage,
  }) async {
    emit(MedicineInfoLoadingState());

    var resultOfGettingSimilarMedicinesToMedicineMahcineName =
        await ApiService(Dio())
            .getMedicineInfoAfterGettingMedicineNameFromMahcineModel(
      prescriptionImage: prescriptionImage,
    );

    resultOfGettingSimilarMedicinesToMedicineMahcineName.fold(
      (failure) => emit(MedicineInfoErrorState(failure.errorMessage)),
      (medicineModel) => emit(
        MedicineInfoSuccessState(medicineModel),
      ),
    );
  }

  void addMedicinesToHistory({
    required String userEmail,
    required String medicineName,
  }) {
    ApiService(Dio()).addMedicinesToHistory(
      endPoint: 'users/addToHistory',
      userEmail: userEmail,
      medicineName: medicineName,
    );
  }

  getHistoryMedicines({
    required String userEmail,
  }) async {
    emit(HistoryMedicinesLoadingState());

    var resultOfGettingHistoryMedicines =
        await ApiService(Dio()).getHistoryMedicines(
      endPoint: 'users/getHistory',
      userEmail: userEmail,
    );

    resultOfGettingHistoryMedicines.fold(
      (failure) => emit(HistoryMedicinesErrorState(failure.errorMessage)),
      (historyMedicinesList) =>
          emit(HistoryMedicinesSuccessState(historyMedicinesList)),
    );
  }
}
