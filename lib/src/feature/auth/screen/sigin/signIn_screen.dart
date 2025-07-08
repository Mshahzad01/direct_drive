import 'package:direct_drive/config/genearte_route.dart';
import 'package:direct_drive/config/route_name.dart';
import 'package:direct_drive/src/constant/app_color.dart';

import 'package:direct_drive/src/core/component/costum_elevated_button.dart';
import 'package:direct_drive/src/core/component/custom_input_field.dart';
import 'package:direct_drive/src/core/component/google_sigin_button.dart';
import 'package:direct_drive/src/core/extension/context_ext._extension.dart';
import 'package:direct_drive/src/feature/auth/screen/resgester_account/email_otp_screen.dart';
import 'package:direct_drive/src/utills/showerror_diloagbox.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../cubit/auth_cubit.dart';
import '../../cubit/auth_state.dart';
import '../../data/auth_repository.dart';
import '../../data/auth_service.dart';

class SigninScreen extends StatefulWidget {
  const SigninScreen({super.key});

  @override
  State<SigninScreen> createState() => _NameScreenState();
}

class _NameScreenState extends State<SigninScreen> {
  final emailcontroller = TextEditingController();
  final passwordController = TextEditingController();
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  @override
  void dispose() {
    emailcontroller.dispose();
    passwordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final isLoading = context.watch<AuthCubit>().state is AuthLoading;
    return BlocListener<AuthCubit, AuthState>(
      listener: (context, state) {
        if (state is AuthFailure) {
          Utils.showErrorDialog(
            context: context,
            title: "Error",
            message: state.message,
          );
        }
        if (state is AuthSuccess) {
          Navigator.pushReplacementNamed(context, RouteName.home);
        }
      },
      child: Scaffold(
        appBar: AppBar(),
        body: SafeArea(
          child: Form(
            key: _formKey,
            child: Column(
              children: [
                Expanded(
                  child: SingleChildScrollView(
                    padding: EdgeInsets.only(
                      left: 20,
                      right: 20,
                      bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                      top: 20,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "Sign in",
                          style: context.mytexttheme.titleMedium?.copyWith(
                            color: Colors.black,
                            fontSize: 22,
                            fontWeight: FontWeight.w700,
                          ),
                        ),
                        const SizedBox(height: 05),

                        Text(
                          "Enter your Email address and password to sigin to your account",
                          style: context.mytexttheme.titleMedium?.copyWith(
                            color: Colors.black54,
                            fontSize: 14,
                          ),
                        ),
                        const SizedBox(height: 20),

                        Text(
                          "Email",
                          style: context.mytexttheme.titleMedium?.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),

                        const SizedBox(height: 05),

                        /// Email Field
                        CustomInputField(
                          controller: emailcontroller,
                          hintText: "Enter Email",
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Email is required";
                            }
                            return null;
                          },
                        ),

                        SizedBox(height: 15),
                        Text(
                          "Enter Email",
                          style: context.mytexttheme.titleMedium?.copyWith(
                            color: Colors.black,
                            fontSize: 16,
                          ),
                        ),
                        const SizedBox(height: 5),
                        CustomInputField(
                          isPassword: true,
                          controller: passwordController,
                          hintText: "Enter Password",
                          keyboardType: TextInputType.name,
                          validator: (value) {
                            if (value == null || value.trim().isEmpty) {
                              return "Password is required";
                            }
                            return null;
                          },
                        ),

                        InkWell(
                          onTap: () => Navigator.pushNamed(
                            context,
                            RouteName.forgetPassword,
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(
                              top: 10.0,
                              right: 10.0,
                            ),
                            child: Align(
                              alignment: Alignment.centerRight,
                              child: Text(
                                "Forget Password",
                                style: context.mytexttheme.titleMedium
                                    ?.copyWith(
                                      color: MyColors.primaryColor,
                                      fontSize: 14,
                                    ),
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 30),
                        SizedBox(
                          width: double.infinity,
                          child: CustomElevatedButtonWidget(
                            isLoading: isLoading,
                            onPressed: isLoading
                                ? null
                                : () {
                                    if (_formKey.currentState!.validate()) {
                                      context.read<AuthCubit>().signInWithEmail(
                                        email: emailcontroller.text.trim(),
                                        password: passwordController.text
                                            .trim(),
                                      );
                                    }
                                  },
                            buttonText: "Continue",
                          ),
                        ),

                        SizedBox(height: 25),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 1,
                              width: 95,
                              color: Colors.grey.shade400,
                            ),

                            Text(
                              "or log in with",
                              style: context.mytexttheme.bodyMedium?.copyWith(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            Container(
                              height: 1,
                              width: 95,
                              color: Colors.grey.shade400,
                            ),
                          ],
                        ),

                        SizedBox(height: 20),

                        GoogleSignInButton(
                          onPressed: () {
                            context.read<AuthCubit>().signInWithGoogle();
                          },
                        ),

                        SizedBox(height: 40),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Text(
                              "Don't have an account?",
                              style: context.mytexttheme.bodyMedium?.copyWith(
                                color: Colors.grey.shade400,
                              ),
                            ),
                            SizedBox(width: 04),

                            InkWell(
                              onTap: () => Navigator.pushReplacementNamed(
                                context,
                                RouteName.emailOtp,
                              ),
                              child: Text(
                                "Sign up",
                                style: context.mytexttheme.bodyMedium?.copyWith(
                                  color: MyColors.primaryColor,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
