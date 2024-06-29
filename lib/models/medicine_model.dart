class MedicineModel {
  bool? medicineResponseStatus;
  final String? medicineResponseMessage;
  final String medicineName;
  final String medicineUses;
  final String medicineDosage;
  final String medincineSideEffects;
  final String? medicineImage;
  final String medicineType;
  final String medicineConcentration;
  final String medicineEffectiveMaterial;
  final String medicineAlternative;

  MedicineModel({
    required this.medicineResponseMessage,
    required this.medicineResponseStatus,
    required this.medicineName,
    required this.medicineUses,
    required this.medicineDosage,
    required this.medincineSideEffects,
    required this.medicineImage,
    required this.medicineType,
    required this.medicineConcentration,
    required this.medicineEffectiveMaterial,
    required this.medicineAlternative,
  });

  factory MedicineModel.fromJson(jsonData) {
    return MedicineModel(
      medicineResponseMessage: jsonData['message'],
      medicineResponseStatus: jsonData['statue'],
      medicineName: jsonData["medicine"]['name'],
      medicineUses: jsonData["medicine"]['usage'],
      medicineDosage: jsonData["medicine"]['dosage'],
      medincineSideEffects: jsonData["medicine"]['sideEffects'],
      medicineImage: jsonData["medicine"]['link'],
      medicineType: jsonData["medicine"]['amount'],
      medicineConcentration: jsonData["medicine"]['strength'],
      medicineEffectiveMaterial: jsonData["medicine"]['activeIngredient'],
      medicineAlternative: jsonData["medicine"]['alternative'],
    );
  }
  factory MedicineModel.fromJsonForList(jsonData) {
    return MedicineModel(
      medicineResponseMessage: jsonData['message'],
      medicineResponseStatus: jsonData['statue'],
      medicineName: jsonData['name'],
      medicineUses: jsonData['usage'],
      medicineDosage: jsonData['dosage'],
      medincineSideEffects: jsonData['sideEffects'],
      medicineImage: jsonData['link'],
      medicineType: jsonData['amount'],
      medicineConcentration: jsonData['strength'],
      medicineEffectiveMaterial: jsonData['activeIngredient'],
      medicineAlternative: jsonData['alternative'],
    );
  }
}
