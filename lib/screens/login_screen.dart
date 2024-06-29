import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:dalil_app/constants.dart';
import 'package:dalil_app/cubits/auth_cubit/auth_cubit.dart';
import 'package:dalil_app/cubits/auth_cubit/auth_states.dart';
import 'package:dalil_app/helper/status_message.dart';
import 'package:dalil_app/screens/home_screen.dart';
import 'package:dalil_app/screens/reset_password_screen.dart';
import 'package:dalil_app/screens/signup_screen.dart';
import 'package:dalil_app/services/cache_preferences_service.dart';
import 'package:dalil_app/widgets/custom_button.dart';
import 'package:dalil_app/widgets/custom_circular_progress_indicator.dart';
import 'package:dalil_app/widgets/custom_textformfield.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});
  static String loginScreenId = 'LoginScreen';

  @override
  Widget build(BuildContext context) {
    TextEditingController userEmailController = TextEditingController();
    TextEditingController userPasswordController = TextEditingController();

    final GlobalKey<FormState> formKey = GlobalKey();
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
      body: BlocConsumer<AuthCubit, AuthState>(
        listener: (context, state) {
          if (state is LoginSuccessState) {
            if (state.userModel.status!) {
              statusMessage(
                message: state.userModel.message!,
                backgroundColor: kPrimaryColor,
              );
              CacheService.saveData(
                key: "userEmail",
                value: userEmailController.text,
              );
              print(userEmail);
              Navigator.pushReplacementNamed(
                context,
                HomeScreen.homeScreenId,
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
          return Padding(
            padding: const EdgeInsets.only(
              right: 25,
              left: 25,
              top: 20,
            ),
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    const Row(
                      children: [
                        Text(
                          'Login',
                          style: TextStyle(
                            fontSize: 28.0,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20.0,
                    ),
                    CustomTextFormField(
                      controller: userEmailController,
                      hintText: 'Enter your email',
                      keyBoardType: TextInputType.emailAddress,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(
                          Icons.email_outlined,
                          color: kPrimaryColor,
                          size: 30.0,
                        ),
                      ),
                      validator: (String? userEmailData) {
                        if (userEmailData == null || userEmailData.isEmpty) {
                          return 'Please enter your email';
                        } else if (!EmailValidator.validate(userEmailData)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      obscureText: BlocProvider.of<AuthCubit>(context)
                          .loginIsObscureText,
                      controller: userPasswordController,
                      keyBoardType: TextInputType.visiblePassword,
                      hintText: 'Enter your password',
                      prefixIcon: const Padding(
                        padding: EdgeInsets.symmetric(horizontal: 20),
                        child: Icon(
                          Icons.lock_outline_rounded,
                          color: kPrimaryColor,
                          size: 30.0,
                        ),
                      ),
                      suffixIcon: IconButton(
                        onPressed: () {
                          BlocProvider.of<AuthCubit>(context)
                              .changeLoginPasswordVisibility();
                        },
                        icon:
                            BlocProvider.of<AuthCubit>(context).loginSuffixIcon,
                      ),
                      validator: (userPasswordData) {
                        if (userPasswordData == null ||
                            userPasswordData.isEmpty) {
                          return 'Please enter a password';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        TextButton(
                          onPressed: () {
                            Navigator.pushNamed(
                              context,
                              ResetPasswordScreen.resetPasswordScreenId,
                            );
                          },
                          child: const Text(
                            'Reset Password',
                            style: TextStyle(
                              color: kPrimaryColor,
                            ),
                          ),
                        ),
                      ],
                    ),
                    ConditionalBuilder(
                      condition: state is! LoginLoadingState,
                      builder: (context) => CustomButton(
                        buttonLabel: 'Login',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(context).loginUser(
                              userEmail: userEmailController.text,
                              userPassword: userPasswordController.text,
                            );
                          }
                        },
                      ),
                      fallback: (context) => const CustomCircularIdicator(),
                    ),
                    const SizedBox(
                      height: 8,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          "Don't have an account ?",
                          style: TextStyle(
                            color: kSecondryColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              SignUpScreen.signUpScreenId,
                            );
                          },
                          child: const Text(
                            'Sign Up',
                            style: TextStyle(
                              color: kPrimaryColor,
                            ),
                          ),
                        )
                      ],
                    ),
                  ],
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}
