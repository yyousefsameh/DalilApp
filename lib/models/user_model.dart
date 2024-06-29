class UserModel {
  final bool? status;
  final String? message;
  final String? name;

  UserModel({
    this.status,
    this.message,
    this.name,
  });

  factory UserModel.fromJson(json) => UserModel(
        status: json['statue'] as bool?,
        message: json['message'] as String?,
        name: json['name'] as String?,
      );
}
