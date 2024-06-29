import 'package:dalil_app/models/user_model.dart';

abstract class AuthState {}

class AuthInitialState extends AuthState {}

// Login states
class LoginSuccessState extends AuthState {
  final UserModel userModel;
  LoginSuccessState({required this.userModel});
}

class LoginLoadingState extends AuthState {}

class LoginFailureState extends AuthState {
  String errMessage;
  LoginFailureState({required this.errMessage});
}

// Register states
class RegisterLoadingState extends AuthState {}

class RegisterSuccessState extends AuthState {
  final UserModel userModel;
  RegisterSuccessState({required this.userModel});
}

class RegisterFailureState extends AuthState {
  String errMessage;
  RegisterFailureState({required this.errMessage});
}

// Reset states
class ResetLoadingState extends AuthState {}

class ResetSuccessState extends AuthState {
  final UserModel userModel;
  ResetSuccessState({required this.userModel});
}

class ResetFailureState extends AuthState {
  String errMessage;
  ResetFailureState({required this.errMessage});
}

class ChangeLoginEyeIcon extends AuthState {}

class ChangeRegisterEyeIcon extends AuthState {}

class ChangeResetOldePasswordEyeIcon extends AuthState {}

class ChangeResetNewPasswordEyeIcon extends AuthState {}
