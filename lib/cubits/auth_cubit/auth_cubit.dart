import 'package:dalil_app/constants.dart';
import 'package:dalil_app/cubits/auth_cubit/auth_states.dart';
import 'package:dalil_app/models/user_model.dart';
import 'package:dalil_app/services/api_service.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AuthCubit extends Cubit<AuthState> {
  AuthCubit(this.apiService) : super(AuthInitialState());

  final ApiService apiService;
  loginUser({
    required String userEmail,
    required String userPassword,
  }) async {
    emit(LoginLoadingState());

    try {
      Response response = await apiService.postUserData(
        endPoint: 'users/signIn',
        userEmail: userEmail,
        userPassword: userPassword,
      );
      UserModel userModel = UserModel.fromJson(response.data);
      emit(LoginSuccessState(userModel: userModel));
    } on Exception catch (e) {
      emit(LoginFailureState(errMessage: e.toString()));
    }
  }

  registerUser({
    required String userName,
    required String userEmail,
    required String userPassword,
  }) async {
    emit(RegisterLoadingState());
    try {
      Response response = await apiService.postUserData(
        endPoint: 'users/signUp',
        userName: userName,
        userEmail: userEmail,
        userPassword: userPassword,
      );

      UserModel userModel = UserModel.fromJson(response.data);
      emit(RegisterSuccessState(userModel: userModel));
    } on Exception catch (e) {
      emit(RegisterFailureState(errMessage: e.toString()));
    }
  }

  resetUserPassword({
    required String userEmail,
    required String userOldPassword,
    required String userNewPassword,
  }) async {
    emit(ResetLoadingState());
    try {
      Response response = await apiService.putUserResetData(
        endPoint: 'users/resetPassword',
        userEmail: userEmail,
        userOldPassword: userOldPassword,
        userNewPassword: userNewPassword,
      );

      UserModel userModel = UserModel.fromJson(response.data);
      emit(ResetSuccessState(userModel: userModel));
    } on Exception catch (e) {
      emit(ResetFailureState(errMessage: e.toString()));
    }
  }

  Icon loginSuffixIcon = const Icon(
    Icons.visibility_outlined,
    color: kSecondryColor,
  );
  bool loginIsObscureText = true;

// change password icon
  void changeLoginPasswordVisibility() {
    loginIsObscureText = !loginIsObscureText;
    loginSuffixIcon = loginIsObscureText
        ? const Icon(
            Icons.visibility_outlined,
            color: kSecondryColor,
          )
        : const Icon(
            Icons.visibility_off_outlined,
            color: kSecondryColor,
          );
    emit(ChangeLoginEyeIcon());
  }

  Icon signUpSuffixIcon =
      const Icon(Icons.visibility_outlined, color: kSecondryColor);
  bool signUpIsObscureText = true;

// change password icon
  void changeSignUpPasswordVisibility() {
    signUpIsObscureText = !signUpIsObscureText;
    signUpSuffixIcon = signUpIsObscureText
        ? const Icon(Icons.visibility_outlined, color: kSecondryColor)
        : const Icon(Icons.visibility_off_outlined, color: kSecondryColor);
    emit(ChangeRegisterEyeIcon());
  }

  Icon resetOldPasswordSuffixIcon =
      const Icon(Icons.visibility_outlined, color: kSecondryColor);
  bool resetOldPasswordIsObscureText = true;

// change password icon
  void changeResetOldPasswordVisibility() {
    resetOldPasswordIsObscureText = !resetOldPasswordIsObscureText;
    resetOldPasswordSuffixIcon = resetOldPasswordIsObscureText
        ? const Icon(Icons.visibility_outlined, color: kSecondryColor)
        : const Icon(Icons.visibility_off_outlined, color: kSecondryColor);
    emit(ChangeResetOldePasswordEyeIcon());
  }

  Icon resetNewPasswordSuffixIcon =
      const Icon(Icons.visibility_outlined, color: kSecondryColor);
  bool resetNewPasswordIsObscureText = true;

// change password icon
  void changeResetNewPasswordVisibility() {
    resetNewPasswordIsObscureText = !resetNewPasswordIsObscureText;
    resetNewPasswordSuffixIcon = resetNewPasswordIsObscureText
        ? const Icon(Icons.visibility_outlined, color: kSecondryColor)
        : const Icon(Icons.visibility_off_outlined, color: kSecondryColor);
    emit(ChangeResetNewPasswordEyeIcon());
  }
}
