class MedicineFromMachineModel {
  final bool medicineMachineStatus;
  final String medicineMachineName;

  MedicineFromMachineModel({
    required this.medicineMachineStatus,
    required this.medicineMachineName,
  });

  factory MedicineFromMachineModel.fromJson(Map<String, dynamic> json) {
    return MedicineFromMachineModel(
      medicineMachineStatus: json['statue'],
      medicineMachineName: json['data'],
    );
  }
}
