import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dalil_app/constants.dart';
import 'package:dalil_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:dalil_app/cubits/auth_cubit/auth_states.dart';
import 'package:dalil_app/helper/status_message.dart';
import 'package:dalil_app/screens/login_screen.dart';
import 'package:dalil_app/widgets/custom_button.dart';
import 'package:dalil_app/widgets/custom_circular_progress_indicator.dart';
import 'package:dalil_app/widgets/custom_textformfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class ResetPasswordScreen extends StatefulWidget {
  const ResetPasswordScreen({super.key});

  static String resetPasswordScreenId = 'ResetPasswordScreen';

  @override
  State<ResetPasswordScreen> createState() => _ResetPasswordScreenState();
}

class _ResetPasswordScreenState extends State<ResetPasswordScreen> {
  @override
  Widget build(BuildContext context) {
    TextEditingController userEmailController = TextEditingController();
    TextEditingController userOldPasswordController = TextEditingController();
    TextEditingController userNewPasswordController = TextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey();
    return BlocConsumer<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is ResetSuccessState) {
          if (state.userModel.status!) {
            statusMessage(
              message: state.userModel.message!,
              backgroundColor: kPrimaryColor,
            );
            Navigator.pushReplacementNamed(
              context,
              LoginScreen.loginScreenId,
            );
          } else {
            statusMessage(
              message: state.userModel.message!,
              backgroundColor: Colors.red,
            );
          }
        }
      },
      builder: (context, state) {
        return Scaffold(
          appBar: AppBar(
            leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: const Icon(
                Icons.arrow_back_ios,
                size: 28.0,
              ),
            ),
          ),
          body: Padding(
            padding: const EdgeInsets.only(
              right: 25,
              left: 25,
              top: 20,
            ),
            child: SingleChildScrollView(
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      const Row(
                        children: [
                          Text(
                            'Reset Password',
                            style: TextStyle(
                              fontSize: 28.0,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ],
                      ),
                      const Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          Text(
                            'Create your new password',
                            style: TextStyle(
                              color: kSecondryColor,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        controller: userEmailController,
                        hintText: 'Enter your email',
                        keyBoardType: TextInputType.emailAddress,
                        prefixIcon: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Icon(
                            Icons.email_outlined,
                            color: kPrimaryColor,
                            size: 30.0,
                          ),
                        ),
                        validator: (userEmailData) {
                          if (userEmailData == null || userEmailData.isEmpty) {
                            return 'Please enter your email';
                          } else if (!EmailValidator.validate(userEmailData)) {
                            return 'Please enter a valid email';
                          }
                          return null;
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        controller: userOldPasswordController,
                        hintText: 'Enter your old password',
                        obscureText: BlocProvider.of<AuthCubit>(context)
                            .resetOldPasswordIsObscureText,
                        keyBoardType: TextInputType.visiblePassword,
                        prefixIcon: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Icon(
                            Icons.password_outlined,
                            color: kPrimaryColor,
                            size: 30.0,
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            BlocProvider.of<AuthCubit>(context)
                                .changeResetOldPasswordVisibility();
                          },
                          icon: BlocProvider.of<AuthCubit>(context)
                              .resetOldPasswordSuffixIcon,
                        ),
                        validator: (userPasswordData) {
                          RegExp regex = RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');
                          if (userPasswordData == null ||
                              userPasswordData.isEmpty) {
                            return 'Please enter a password';
                          } else if (!regex.hasMatch(userPasswordData)) {
                            return 'Please enter a password that has number, symbol,\nlowercase, uppercase and not less than 8 characters';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      CustomTextFormField(
                        controller: userNewPasswordController,
                        hintText: 'Enter your new password',
                        keyBoardType: TextInputType.visiblePassword,
                        obscureText: BlocProvider.of<AuthCubit>(context)
                            .resetNewPasswordIsObscureText,
                        prefixIcon: const Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 20,
                          ),
                          child: Icon(
                            Icons.lock_outline_rounded,
                            color: kPrimaryColor,
                            size: 30.0,
                          ),
                        ),
                        suffixIcon: IconButton(
                          onPressed: () {
                            BlocProvider.of<AuthCubit>(context)
                                .changeResetNewPasswordVisibility();
                          },
                          icon: BlocProvider.of<AuthCubit>(context)
                              .resetNewPasswordSuffixIcon,
                        ),
                        validator: (userPasswordData) {
                          RegExp regex = RegExp(
                              r'^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#$&*~]).{8,}$');
                          if (userPasswordData == null ||
                              userPasswordData.isEmpty) {
                            return 'Please enter a password';
                          } else if (!regex.hasMatch(userPasswordData)) {
                            return 'Please enter a password that has number, symbol,\nlowercase, uppercase and not less than 8 characters';
                          } else {
                            return null;
                          }
                        },
                      ),
                      const SizedBox(
                        height: 32,
                      ),
                      ConditionalBuilder(
                        condition: state is! ResetLoadingState,
                        builder: (context) => CustomButton(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              BlocProvider.of<AuthCubit>(context)
                                  .resetUserPassword(
                                userEmail: userEmailController.text,
                                userOldPassword: userOldPasswordController.text,
                                userNewPassword: userNewPasswordController.text,
                              );
                            }
                          },
                          buttonLabel: 'Done',
                        ),
                        fallback: (context) => const CustomCircularIdicator(),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
