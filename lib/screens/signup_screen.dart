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

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static String signUpScreenId = 'SignUpScreen';
  @override
  Widget build(BuildContext context) {
    TextEditingController userNameController = TextEditingController();
    TextEditingController userEmailController = TextEditingController();
    TextEditingController userPasswordController = TextEditingController();
    final GlobalKey<FormState> formKey = GlobalKey();
    return Scaffold(
      appBar: AppBar(
        // centerTitle: true,
        // title: const Text(
        //   'Sign Up',
        //   style: TextStyle(
        //     fontSize: 32.0,
        //     fontWeight: FontWeight.w600,
        //   ),
        // ),
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
          if (state is RegisterSuccessState) {
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
                          'Sign Up',
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
                      controller: userNameController,
                      hintText: 'Enter your name',
                      keyBoardType: TextInputType.name,
                      prefixIcon: const Padding(
                        padding: EdgeInsets.symmetric(
                          horizontal: 20,
                        ),
                        child: Icon(
                          Icons.perm_identity,
                          color: kPrimaryColor,
                          size: 30.0,
                        ),
                      ),
                      validator: (userNameData) {
                        if (userNameData == null || userNameData.isEmpty) {
                          return 'Please enter your name';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
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
                        if (userEmailData!.isEmpty) {
                          return 'Please enter your email';
                        } else if (!EmailValidator.validate(userEmailData)) {
                          return 'Please enter a valid email';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    CustomTextFormField(
                      controller: userPasswordController,
                      hintText: 'Enter your password',
                      keyBoardType: TextInputType.visiblePassword,
                      obscureText: BlocProvider.of<AuthCubit>(context)
                          .signUpIsObscureText,
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
                        onPressed: () {},
                        icon: IconButton(
                          onPressed: () {
                            BlocProvider.of<AuthCubit>(context)
                                .changeSignUpPasswordVisibility();
                          },
                          icon: BlocProvider.of<AuthCubit>(context)
                              .signUpSuffixIcon,
                        ),
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
                      condition: state is! RegisterLoadingState,
                      builder: (context) => CustomButton(
                        buttonLabel: 'Sign Up',
                        onTap: () {
                          if (formKey.currentState!.validate()) {
                            BlocProvider.of<AuthCubit>(context).registerUser(
                              userName: userNameController.text,
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
                          " Already have an account ?",
                          style: TextStyle(
                            color: kSecondryColor,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.pushReplacementNamed(
                              context,
                              LoginScreen.loginScreenId,
                            );
                          },
                          child: const Text(
                            'Login',
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
