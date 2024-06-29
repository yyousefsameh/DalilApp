class HistoryModelListData {
  String? id;
  String? email;
  String? medicine;
  int? v;

  HistoryModelListData({this.id, this.email, this.medicine, this.v});

  factory HistoryModelListData.fromJson(Map<String, dynamic> json) =>
      HistoryModelListData(
        id: json['_id'] as String?,
        email: json['email'] as String?,
        medicine: json['medicine'] as String?,
        v: json['__v'] as int?,
      );

  Map<String, dynamic> toJson() => {
        '_id': id,
        'email': email,
        'medicine': medicine,
        '__v': v,
      };
}
