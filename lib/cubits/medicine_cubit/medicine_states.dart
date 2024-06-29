import 'package:dalil_app/models/history_model/history_model_list_data.dart';
import 'package:dalil_app/models/medicine_model.dart';

abstract class MedicineState {}

class MedicineInitialState extends MedicineState {}

// Medicine Info
class MedicineInfoLoadingState extends MedicineState {}

class MedicineInfoSuccessState extends MedicineState {
  final MedicineModel medicineModel;
  MedicineInfoSuccessState(this.medicineModel);
}

class MedicineInfoErrorState extends MedicineState {
  final String errorMessage;

  MedicineInfoErrorState(this.errorMessage);
}

// Medicines By Category
class MedicinesByCategoryLoadingState extends MedicineState {}

class MedicinesByCategorySuccessState extends MedicineState {
  final List<MedicineModel> medicinesByCategoryList;
  MedicinesByCategorySuccessState(this.medicinesByCategoryList);
}

class MedicinesByCategoryErrorState extends MedicineState {
  final String errorMessage;

  MedicinesByCategoryErrorState(this.errorMessage);
}

// Medicines By Character
class MedicinesByCharacterLoadingState extends MedicineState {}

class MedicinesByCharacterSuccessState extends MedicineState {
  final List<MedicineModel> medicinesByCharacterList;

  MedicinesByCharacterSuccessState(this.medicinesByCharacterList);
}

class MedicinesByCharacterErrorState extends MedicineState {
  final String errorMessage;

  MedicinesByCharacterErrorState(this.errorMessage);
}

// Similar Medicines States
class SimilarMedicineToMedicineMahcineNameLoadingState extends MedicineState {}

class SimilarMedicineToMedicineMahcineNameSuccessState extends MedicineState {
  final MedicineModel medicineModel;

  SimilarMedicineToMedicineMahcineNameSuccessState(this.medicineModel);
}

class SimilarMedicineToMedicineMahcineNameErrorState extends MedicineState {
  final String errorMessage;

  SimilarMedicineToMedicineMahcineNameErrorState(this.errorMessage);
}

// History Medicines States
class HistoryMedicinesLoadingState extends MedicineState {}

class HistoryMedicinesSuccessState extends MedicineState {
  final List<HistoryModelListData> medicinesHistoryList;

  HistoryMedicinesSuccessState(this.medicinesHistoryList);
}

class HistoryMedicinesErrorState extends MedicineState {
  final String errorMessage;

  HistoryMedicinesErrorState(this.errorMessage);
}
