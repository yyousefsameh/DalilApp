class MedicineNameModel {
  final String medicineName;

  MedicineNameModel({
    required this.medicineName,
  });

  factory MedicineNameModel.fromJson(json) {
    return MedicineNameModel(
      medicineName: json['answer'],
    );
  }
}
